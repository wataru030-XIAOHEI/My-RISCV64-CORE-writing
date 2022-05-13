package Core
import chisel3._
import Bus._
import utils._
import chisel3.util._
import constant.Consts._
import constant.Inst._

/**TODO 说明 我的chisel核，目前命名还没决定wwww
 * @bref author wataru030
 * @param Imemio 链接指令存储器
 * @param DMemio 链接数据存储器
 */

class core extends Module{
  val io = IO(new Bundle{
    val Imemio = Flipped(new IMemIO)
    val DMemio = Flipped(new DMemIo)
//    val debug_exit = Output(Bool())
    val Deubug = new DebugIo(DWORD_LEN,5)
  })
  //******************************



  //==============pipeline init
  val if_id_pl = Module(new if_id )
  val id_ex_pl = Module(new id_ex )
  //======================


  //*******************************
  val rf = Module(new RF)
  val alu_out = Wire(UInt(DWORD_LEN.W))

  //=================================================================
  //------------------IF------------------------
  val ImemCenR  = RegInit(false.B)
  ImemCenR := true.B
  val pc_reg = Reg(UInt(DWORD_LEN.W)) 
  val pc_plus4 = Wire(UInt(DWORD_LEN.W))
  pc_plus4 := pc_reg + 4.U(DWORD_LEN.W)



  
  val inst = io.Imemio.inst
    

  //分支选择 与无条件跳转
  val branch_target =  Wire(UInt(DWORD_LEN.W))
  val jump_target = Wire(UInt(DWORD_LEN.W))
  val branch_flag   = Wire(Bool())
  val jump_flag     = Wire(Bool())
  //跳转选择

  val inst_id = Wire(UInt(WORD_LEN.W))
  val pc_id = Wire(UInt(WORD_LEN.W))

  val inst_ex = Wire(UInt(INST_LEN.W))



  val jump_flag_ex = Wire(Bool())
  val jumpAndBranchMuxSel = Cat(branch_flag,jump_flag_ex)
  //下一个pc
  // val next_pc = MuxLookup(jumpAndBranchMuxSel,pc_plus4,Seq(
  //   "b10".U -> branch_target ,
  //   "b01".U -> jump_target
  // ))
  val next_pc = MuxCase(pc_plus4,Array(
    jump_flag_ex -> jump_target ,
    branch_flag  -> branch_target
  ))
  io.Imemio.cen := ImemCenR
  when(io.Imemio.cen===false.B){
    pc_reg := PC_RST_VALUE 
  } otherwise {
    pc_reg := next_pc
  }
    io.Imemio.pc := pc_reg

    if_id_pl.io.pc := pc_reg
    if_id_pl.io.inst :=  inst


  inst_id := if_id_pl.io.inst_o
  pc_id   := if_id_pl.io.pc_o
  //------------------ID------------------------
  val rs1 = inst_id(19,15)
  val rs2 = inst_id(24,20)
  val rd  = inst_id(11,7)//wb_address
  rf.io.channel.raddr1 := rs1 //rs1_address
  rf.io.channel.raddr2 := rs2 //rs2_address
    //**************读回来的数据**************
  val rs1_data = rf.io.channel.rdata1
  val rs2_data = rf.io.channel.rdata2
    //**************I TYPE IMM**************
  val imm_i = inst_id(31,20)
  val imm_i_sext = Cat(Fill(52,imm_i(11)) ,imm_i)
    //**************S TYPE IMM***************
  val imm_s = Cat(inst_id(31,25),inst_id(11,7))
  val imm_s_sext = Cat(Fill(52,imm_s(11)),imm_s)
    //**************U TYPE IMM***************
  val imm_u = inst_id(31,12)
  val imm_u_sext = Cat(Fill(44,imm_u(19)),imm_u)
  val imm_u_shifted = Cat(imm_u_sext , Fill(12,0.U(1.W)))
    //**************J TYPE IMM***************
  val imm_j = Cat(inst_id(31),inst_id(19,12),inst_id(30,21),inst_id(20))
  val imm_j_sext = Cat(Fill(43,imm_j(19)),imm_j , 0.U(1.W))
    //**************B TYPE IMM***************
  val imm_b = Cat(inst_id(31),inst_id(7),inst_id(30,25),inst_id(11,8))
  val imm_b_sext = Cat(Fill(51,imm_b(11)),imm_b,0.U(1.W))

    //*************zero extend imm *****************
  val imm_zero = inst_id(19,15)
  val imm_zext = Cat(Fill(59,0.U(1.W)),imm_zero)
    //**************运算数据选择控制通路**************
  val op_signals = CTRL_BUS_LOOKUP_TABLE(inst_id) // in Consts.scala



  /** @note  该队列各个部位表示的是控制相关的信号
   *  TODO
   * -指令运算类型---             源操作1选择---         源操作数2选择---      是否写存储器  ----是否写写寄存器堆  ---写回的是什么数据--------------
   *      |                           |                   |                 |                 |                 |
          v                           v                   v                 v                 v                 v             */
  val ( exec_fun:UInt ) :: ( op1_sel:UInt ) :: ( op2_sel:UInt ) :: ( mem_wen:Bool ) :: ( rf_wen:Bool ) :: ( wb_sel:UInt ) :: Nil
      = op_signals

    //**************参与运算的运算数据匹配**************
  val op1 = MuxLookup(op1_sel , 0.U(DWORD_LEN.W), Seq(
    OP1_SRC1  -> rs1_data,
    OP1_PC    -> pc_reg,
    OP1_IMM   -> imm_zext
  ))

  val op2 = MuxLookup(op2_sel, 0.U(DWORD_LEN.W),Seq(
    OP2_SRC2  -> rs2_data,
    OP2_IMMI  -> imm_i_sext,
    OP2_IMMU  -> imm_u_shifted,
    OP2_IMMJ  -> imm_j_sext,
    OP2_IMMS  -> imm_s_sext
  ))
  jump_flag :=  ( inst_id === JAL || inst_id === JALR)
  //*******ID EX PIPELINE*****************************************

  val pc_ex = Wire(UInt(DWORD_LEN.W))
  val imm_b_sext_ex = Wire(UInt(DWORD_LEN.W))
  val op1_ex = Wire(UInt(DWORD_LEN.W))
  val op2_ex = Wire(UInt(DWORD_LEN.W))
  val exec_fun_ex = Wire(UInt(EXE_SEL_LEN.W))
  val memwen_ex = Wire(Bool())
  val rf_wen_ex = Wire(Bool())
  val wb_sel_ex = Wire(UInt(WB_LEN.W))
  val wb_addr_ex = Wire(UInt(5.W))
  val Dmem_wdata_ex = Wire(UInt(DWORD_LEN.W))


  //jump_flag
  id_ex_pl.io.inst_is_jump_in := jump_flag
  jump_flag_ex := id_ex_pl.io.inst_is_jump_o


  id_ex_pl.io.pc_and_inst_in.pc   := pc_id
  id_ex_pl.io.pc_and_inst_in.inst := inst_id
  inst_ex := id_ex_pl.io.pc_and_inst_out.inst
  pc_ex   := id_ex_pl.io.pc_and_inst_out.pc
  //imm_b_sext
  id_ex_pl.io.src_in.imm  := imm_b_sext_ex
  imm_b_sext_ex           := id_ex_pl.io.src_out.imm
  //op1 and op2
  id_ex_pl.io.src_in.src1 := op1
  id_ex_pl.io.src_in.src2 := op2
  op1_ex := id_ex_pl.io.src_out.src1
  op2_ex := id_ex_pl.io.src_out.src2
  //exeu_op
  id_ex_pl.io.exeu_op := exec_fun
  exec_fun_ex         := id_ex_pl.io.exeu_op_o
  //mem_wen
  id_ex_pl.io.mem_wen_io.mem_wen_in   := mem_wen
  memwen_ex                           := id_ex_pl.io.mem_wen_io.mem_wen_o
  //rf_wen
  id_ex_pl.io.reg_wen_io.reg_wen_in   := rf_wen
  rf_wen_ex                           := id_ex_pl.io.reg_wen_io.reg_wen_o
  //wb_sel
  id_ex_pl.io.wb_type_io.reg_wtype_in := wb_sel
  wb_sel_ex                           := id_ex_pl.io.wb_type_io.reg_wtype_out
  //wb_addr
  id_ex_pl.io.wb_addr_in              := rd
  wb_addr_ex                          :=  id_ex_pl.io.wb_addr_o
  //Dmem_wdata
  id_ex_pl.io.Dmem_wdata_in := rs2_data
  Dmem_wdata_ex := id_ex_pl.io.Dmem_wdata_o
  //**********ID EX PIPELINE END***********************************




  //---------------EX----------------------------------执行单元
  val ctrl_sel = new Ctrl //生成数据的控制函数

    //************ALU***************************
  alu_out := ctrl_sel.alu_out_mux(exec_fun_ex,op1_ex,op2_ex)
  jump_target := Mux(jump_flag_ex ,alu_out , 0.U(DWORD_LEN.W))
  //jal(J TYPE) and jalr(I TYPE)


    //************BRU***************************

  branch_target := pc_ex + imm_b_sext_ex
  branch_flag := ctrl_sel.branch_flag_gen(exec_fun_ex,false.B,op1_ex,op2_ex)




  //*******EX MEMU PIPELINE ********************************
  val ex_mem_pl =Module( new ex_mem )

  val pc_mem = Wire(UInt(DWORD_LEN.W))
  val inst_mem = Wire(UInt(INST_LEN.W))
  val wb_addr_mem = Wire(UInt(5.W))
  val alu_out_mem = Wire(UInt(DWORD_LEN.W))
  val rf_wen_mem = Wire(Bool())
  val mem_wen_mem = Wire(Bool())
  val wb_sel_mem = Wire(UInt(WB_LEN.W))
  val Dmem_data_mem = Wire(UInt(DWORD_LEN.W))
  //pc
  ex_mem_pl.io.pc_and_inst_in.pc := pc_ex
  pc_mem := ex_mem_pl.io.pc_and_inst_out.pc
  //inst
  ex_mem_pl.io.pc_and_inst_in.inst := inst_ex
  inst_mem := ex_mem_pl.io.pc_and_inst_out.inst

  //wadddr
  ex_mem_pl.io.wb_addr_in := wb_addr_ex
  wb_addr_mem := ex_mem_pl.io.wb_addr_o
  //alu_out
  ex_mem_pl.io.alu_out_in := alu_out
  alu_out_mem := ex_mem_pl.io.alu_out_o
  //wen
  ex_mem_pl.io.rf_wen_io.reg_wen_in := rf_wen_ex
  rf_wen_mem := ex_mem_pl.io.rf_wen_io.reg_wen_o
  //memwen
  ex_mem_pl.io.mem_wen_io.mem_wen_in := memwen_ex
  mem_wen_mem := ex_mem_pl.io.mem_wen_io.mem_wen_o
  //wb_sel
  ex_mem_pl.io.wb_sel_io.reg_wtype_in := wb_sel_ex
  wb_sel_mem := ex_mem_pl.io.wb_sel_io.reg_wtype_out
  //Dmem_wdata
  ex_mem_pl.io.Dmem_wdata_in := Dmem_wdata_ex
  Dmem_data_mem := ex_mem_pl.io.Dmem_wdata_o



  //******EX MEMU PIPELINE END ****************************




  //----------------MEM------------------------------------------

  io.DMemio.addr := alu_out_mem
  io.DMemio.wen := mem_wen_mem
  io.DMemio.wdata := Dmem_data_mem
  val pc_plus4_mem = pc_mem + 4.U(DWORD_LEN.W)

  //**************MEM WB PIPELINE*************************
  val mem_wb_pl =Module ( new mem_wb )
  val pc_wb = Wire(UInt(DWORD_LEN.W))
  val inst_wb = Wire(UInt(DWORD_LEN.W))
  val pc_plus4_wb = Wire(UInt(DWORD_LEN.W))
  val wb_addr_wb = Wire(UInt(5.W))
  val alu_out_wb = Wire(UInt(DWORD_LEN.W))
  val rf_wen_wb = Wire(Bool())
  val wb_sel_wb = Wire(UInt(WB_LEN.W))
  val Dmemrdata_wb = Wire(UInt(DWORD_LEN.W))
  //pc
  mem_wb_pl.io.pc_and_inst_in.pc := pc_mem
  pc_wb := mem_wb_pl.io.pc_and_inst_o.pc
  //inst
  mem_wb_pl.io.pc_and_inst_in.inst := inst_mem
  inst_wb := mem_wb_pl.io.pc_and_inst_o.inst
  //pc plus 4
  mem_wb_pl.io.pc_plus4_in := pc_plus4_mem
  pc_plus4_wb := mem_wb_pl.io.pc_plus4_o
  //wbaddr
  mem_wb_pl.io.wb_addr_in := wb_addr_mem
  wb_addr_wb := mem_wb_pl.io.wb_addr_o
  //rf_Wen
  mem_wb_pl.io.rf_wen_io.reg_wen_in := rf_wen_mem
  rf_wen_wb := mem_wb_pl.io.rf_wen_io.reg_wen_o
  //wb_sel
  mem_wb_pl.io.wb_sel_io.reg_wtype_in := wb_sel_mem
  wb_sel_wb := mem_wb_pl.io.wb_sel_io.reg_wtype_out
  //Dmemdata
  mem_wb_pl.io.Dmem_rdata_in := io.DMemio.rdata
  Dmemrdata_wb := mem_wb_pl.io.Dmem_rdata_o
  //alu_out
  mem_wb_pl.io.alu_out_in := alu_out_mem
  alu_out_wb := mem_wb_pl.io.alu_out_o

  //***************MEM WB PIPELINE END***************




//-------------WB---------------------------------------------------
val wb_data = ctrl_sel.wb_data_mux(wb_sel_wb,alu_out_wb ,pc_plus4_wb ,
Dmemrdata_wb )

//*******regsfile write back ***********
rf.io.channel.wen := rf_wen_wb
rf.io.channel.wdata := wb_data
rf.io.channel.waddr := wb_addr_wb




//--------------DEBUG------------------------

io.Deubug.Debug_rf_wen := rf_wen_wb
io.Deubug.Debug_rf_wdata := wb_data
io.Deubug.Debug_rf_waddr := wb_addr_wb
io.Deubug.Debug_pc := pc_wb
io.Deubug.Debug_inst := inst_wb
/*******DPI********/
    val dpi = Module(new dpi)
    dpi.io.inst_in := inst_wb
    /*****************/
}