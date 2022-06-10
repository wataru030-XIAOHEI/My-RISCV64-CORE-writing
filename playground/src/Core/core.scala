package Core


import Compents.{BranchBus, DMemIO, DebugIO, IMemIO, bypass, dpi}
import Config.GoParameter
import Const.Consts.{ALU_OUT, B, I, J, LOAD_DATA, R, S, U, Z, excTyWD, wbdataselWD}
import Const.Inst.{JAL, JALR, LW, NOP}
import chisel3._
import chisel3.util._



class Core extends Module with GoParameter{
  val io = IO(new Bundle{
    val debug = new DebugIO
    val imem  = new IMemIO(32)
    val dmem  = new DMemIO(64)
  })
  //-----initial--------
  val gpr   =  new rf
//  val Bypassing = Wire(VecInit(Seq.fill(3){new bypass(XLEN)})) //0 : from ex 1: from mem ,2 : from wbu
  val exBypassing = Wire(new bypass())
  val memBypassing = Wire(new bypass())
  val wbBypassing = Wire(new bypass())

  val nopctrl = Wire(new CtrlSigsGen).dcr(NOP,(new IDecoder).table)
  val load_stall : Bool = Wire(Bool())
  val MultDivStall : Bool = Wire(Bool())
  val flush     : Bool = Wire(Bool())
  MultDivStall := false.B
  flush := false.B

  io.imem.wen := false.B
  io.imem.wdata := 0.U(XLEN.W)







  //=====if ======================

  val branchBus = Wire(new BranchBus)
  val pcreg     : UInt = RegInit(rstValue)
  val cenreg    : Bool = RegInit(false.B)
  val imemaddr  : UInt = Wire(UInt(XLEN.W))

  val seq_pc    : UInt = pcreg + 4.U(XLEN.W)
  val next_pc   : UInt = Wire(UInt(XLEN.W))
  next_pc := Mux(branchBus.flag,branchBus.target,seq_pc)
  
  when(cenreg === true.B){
      when(!load_stall && !MultDivStall){
      pcreg := next_pc
    }
  }
  cenreg := true.B
  imemaddr := pcreg

  io.imem.addr := imemaddr
  io.imem.cen := cenreg

  val if_inst :UInt = Wire(UInt(instrWD.W))
  if_inst := io.imem.rdata




  //================IDU============================
  val If2IdPc   :UInt  =   RegInit(0.U(XLEN.W))
  val If2IdInst :UInt  =   RegInit(NOP)
  //cancel
  when(branchBus.Cancel || flush) {
    If2IdPc     := 0.U(XLEN.W)
    If2IdInst   := NOP
  }.elsewhen(load_stall){
    If2IdPc     := If2IdPc
    If2IdInst   := If2IdInst
  } otherwise {
    If2IdPc     := pcreg
    If2IdInst   := if_inst
  }

  val id_pc   : UInt = If2IdPc     //id stage pc
  val id_inst : UInt = If2IdInst   //id stage inst



  val ctriSigs = Wire(new CtrlSigsGen).dcr(id_inst.asUInt(),(new IDecoder).table)

  val rfAddrGen = Module (new GprAddrGen(instrWD)).io

  rfAddrGen.in := id_inst
  val storeData : UInt = Wire(UInt(XLEN.W))
  val rs1 : UInt = rfAddrGen.o.rs1
  val rs2 : UInt = rfAddrGen.o.rs2
  val rd  : UInt = rfAddrGen.o.rd
  val rsAddr = IndexedSeq(rs1,rs2)
//  rsdataVec(0) := gpr.read(rs1).asSInt()
//  rsdataVec(1) := gpr.read(rs2).asSInt()
  val id_rs : IndexedSeq[UInt] = rsAddr.map(gpr.read _ )
  val rsVec : Vec[SInt] = Wire(Vec(2,SInt(XLEN.W)))
  rsVec(0) := MuxCase(id_rs(0),Seq(
    (exBypassing.wen && exBypassing.waddr === rsAddr(0) ) ->  exBypassing.wr  ,
    (memBypassing.wen && memBypassing.waddr === rsAddr(0) ) ->  memBypassing.wr  ,
    (wbBypassing.wen && wbBypassing.waddr === rsAddr(0) ) ->  wbBypassing.wr
  )).asSInt()
  rsVec(1) := MuxCase(id_rs(1),Seq(
    (exBypassing.wen && exBypassing.waddr === rsAddr(1) ) ->  exBypassing.wr  ,
    (memBypassing.wen && memBypassing.waddr === rsAddr(1) ) ->  memBypassing.wr  ,
    (wbBypassing.wen && wbBypassing.waddr === rsAddr(1) ) ->  wbBypassing.wr
  )).asSInt()
  storeData := rsVec(1).asUInt()
  val opGen = new OpVecGen(ctriSigs.op1sel,ctriSigs.op2sel)
  val opVec : Vec[UInt] = Wire(Vec(2,UInt(XLEN.W)))
  val imm   : SInt  = Wire(SInt(XLEN.W))

  imm := immGen(id_inst,ctriSigs.instTy).asSInt()
  opVec(0)  := opGen.op1Gen(rsVec(0).asUInt(),id_pc)
  opVec(1)  := opGen.op2Gen(rsVec(1).asUInt(),imm.asUInt())

  //=========bru==============================
  /**
   * branch excute unit . if branch flag is true or inst is JAL or JALR, excute the jump/branch ,
   * pc update to the branch target
   */
  val jump_target : UInt =  Wire(UInt(XLEN.W))
  jump_target := (rsVec(0).asUInt() + imm.asUInt())
  branchBus.flag := ((new Bru).flaggen(ctriSigs.bTy,opVec(0).asSInt(),opVec(1).asSInt())
                        || id_inst === JALR || id_inst === JAL)
  branchBus.target := Mux(id_inst === JALR ,
                            jump_target & (~1.U(XLEN.W)).asUInt()  ,id_pc + imm.asUInt() )
  branchBus.Cancel := branchBus.flag





  //===============EXU ========================
  val exCtrlSigs  = RegInit(nopctrl)
  val exOpVec     = RegInit(VecInit(0.U(XLEN.W),0.U(XLEN.W)))
  val exPc        = RegInit(0.U(XLEN.W))
  val exInst      = RegInit(NOP)
  val exRd        = RegInit(0.U(5.W))
  val exStoreData = RegInit(0.U(XLEN.W))

  when( flush || load_stall) {
    exCtrlSigs  := nopctrl
    exOpVec     := VecInit(0.U(XLEN.W), 0.U(XLEN.W))
    exPc        := 0.U(XLEN.W)
    exInst      := NOP
    exRd        := 0.U(5.W)
    exStoreData := 0.U(XLEN.W)
  }.otherwise{
    exCtrlSigs  := ctriSigs
    exOpVec     := opVec
    exPc        := id_pc
    exInst      := id_inst
    exRd        := rd
    exStoreData := storeData
  }

  //======alu ============
  val alu = Module( new Alu(XLEN) ).io
  alu.excTy := exCtrlSigs.excTy
  alu.opVec := exOpVec
  val alu_result : UInt = alu.result

  /**
   * load stall generate .
   * to ctrl the front-stage stall .
   * the stall cause the inst of Load Type
   */
  load_stall := loadstallReq(exCtrlSigs.memcen , exCtrlSigs.memwen)
  exBypassing.wen := exCtrlSigs.rfwen
  exBypassing.waddr := exRd
  exBypassing.wr := alu_result
  //==========MEM ============================
  val ctrlSigsMem     = RegInit(nopctrl)
  val alu_resultMem   = RegInit(0.U(XLEN.W))
  val rdMem           = RegInit(0.U(5.W))
  val pcMem           = RegInit(0.U(XLEN.W))
  val instMem         = RegInit(NOP)
  val storeDataMem    = RegInit(0.U(XLEN.W))

  when(flush){
    ctrlSigsMem   := nopctrl
    alu_resultMem := 0.U(XLEN.W)
    rdMem         := 0.U(5.W)
    pcMem         := 0.U(XLEN.W)
    instMem       := NOP
    storeDataMem  := 0.U(XLEN.W)

  }.elsewhen(!MultDivStall){
    ctrlSigsMem   := exCtrlSigs
    alu_resultMem := alu_result
    rdMem         := exRd
    pcMem         := exPc
    instMem       := exInst
    storeDataMem  := exStoreData
  }otherwise{
    ctrlSigsMem   := ctrlSigsMem
    alu_resultMem := alu_resultMem
    rdMem         := rdMem
    pcMem         := pcMem
    instMem       := instMem
    storeDataMem  := storeDataMem
  }

  //======lsu=======
  io.dmem.cen := ctrlSigsMem.memcen
  io.dmem.wen := ctrlSigsMem.memwen =/= 0.U
  io.dmem.wdata := storeDataMem
  io.dmem.addr := alu_resultMem
  val loadData :UInt = io.dmem.rdata
  val MemWbData : UInt = Wire(UInt(XLEN.W))

  MemWbData := MuxLookup(ctrlSigsMem.wbdSel,alu_resultMem,Seq(
    ALU_OUT   -> alu_resultMem ,
    LOAD_DATA -> loadData
  ))
  memBypassing.wr := MemWbData
  memBypassing.waddr := rdMem
  memBypassing.wen := ctrlSigsMem.rfwen
  //============WBU========================
  val ctrlSigsWb  = RegInit(nopctrl)
  val pcWb        = RegInit(0.U(XLEN.W))
  val instWb      = RegInit(NOP)
  val wbData      = RegInit(0.U(XLEN.W))
  val wbAddr      = RegInit(0.U(5.W))
  when(flush){
    ctrlSigsWb    := nopctrl
    pcWb          := 0.U(XLEN.W)
    instWb        := NOP
    wbData        := 0.U(XLEN.W)
    wbAddr        := 0.U(5.W)
  }otherwise{
    ctrlSigsWb    := ctrlSigsMem
    pcWb          := pcMem
    instWb        := instMem
    wbData        := MemWbData
    wbAddr        := rdMem
  }

  wbBypassing.wen := ctrlSigsWb.rfwen
  wbBypassing.wr := wbData
  wbBypassing.waddr := wbAddr
  gpr.write(wbAddr,wbData,ctrlSigsWb.rfwen)

  //=====dpi-c=====
  val Dpi = Module(new dpi).io
  Dpi.inst := io.debug.debugInst

  //============DEBUG==============
  io.debug.debugPc    := pcWb
  io.debug.debugInst  := instWb
  io.debug.debugwen   := ctrlSigsWb.rfwen
  io.debug.debugwaddr := wbAddr
  io.debug.debugdata  := wbData

  if(debugPrintOption){
    println(p"pc    : 0x${Hexadecimal(io.debug.debugPc)}")
    println(p"inst  : 0x${Hexadecimal(io.debug.debugInst)}")
    println(if(io.debug.debugwen == true)
           {p"wdata :   ${io.debug.debugdata}"}else{p"no write"})
    println(if(io.debug.debugwen == true )
    {p"wdata :   ${io.debug.debugwaddr}"}else{p"no write"})
  }

}

