package Core
import Const.Consts._
import Const.Inst._
import chisel3._
import chisel3.util.{BitPat, Cat, Fill, ListLookup, MuxCase, MuxLookup}

import scala.collection.mutable.ArrayBuffer
import Const.util._
class IDecoder {

  val table : Array[(BitPat,List[BitPat])]= Array(
    AUIPC ->  List(U,excADD , PC  ,   ZERO2 , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    LUI   ->  List(U,excADD , ZERO1,  IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),

    ADDI  ->  List(I,excADD , RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    ADDIW ->  List(I,excADDW, RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SLTI  ->  List(I,excSLT , RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SLTIU ->  List(I,excSLTU, RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    ORI   ->  List(I,excOR  , RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    XORI  ->  List(I,excXOR , RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    ANDI  ->  List(I,excAND , RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SLLI  ->  List(I,excSLL , RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SLLIW ->  List(I,excSLLW, RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT,   CSRX , Valid , BX    ),
    SRLI  ->  List(I,excSRL , RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SRLIW ->  List(I,excSRLW, RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SRAI  ->  List(I,excSRA , RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SRAIW ->  List(I,excSRAW, RS1 ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),

    ADD   ->  List(R,excADD , RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    ADDW  ->  List(R,excADDW, RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SUB   ->  List(R,excSUB , RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SUBW  ->  List(R,excSUBW, RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SLT   ->  List(R,excSLT , RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SLTU  ->  List(R,excSLTU, RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SLL   ->  List(R,excSLL , RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SLLW  ->  List(R,excSLLW, RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SRL   ->  List(R,excSRL , RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SRLW  ->  List(R,excSRLW, RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SRA   ->  List(R,excSRA , RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    SRAW  ->  List(R,excSRAW, RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    OR    ->  List(R,excOR  , RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    AND   ->  List(R,excAND , RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    XOR   ->  List(R,excXOR , RS1 ,   RS2   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),

    JAL   ->  List(J,excADD , PC  ,   PLUS4 , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),
    JALR  ->  List(I,excADD , PC  ,   IMM   , DISEN  , memwenX , WEN  , ALU_OUT ,  CSRX , Valid , BX    ),


    BEQ   ->  List(B,excADD , ZERO1,  ZERO2 , DISEN  , memwenX , DISEN, wbdataX ,  CSRX , Valid , B_BEQ ),
    BNE   ->  List(B,excADD , ZERO1,  ZERO2 , DISEN  , memwenX , DISEN, wbdataX ,  CSRX , Valid , B_BNE ),
    BLT   ->  List(B,excADD , ZERO1,  ZERO2 , DISEN  , memwenX , DISEN, wbdataX ,  CSRX , Valid , B_BLT ),
    BGE   ->  List(B,excADD , ZERO1,  ZERO2 , DISEN  , memwenX , DISEN, wbdataX ,  CSRX , Valid , B_BGE ),
    BLTU  ->  List(B,excADD , ZERO1,  ZERO2 , DISEN  , memwenX , DISEN, wbdataX ,  CSRX , Valid , B_BLTU),
    BGEU  ->  List(B,excADD , ZERO1,  ZERO2 , DISEN  , memwenX , DISEN, wbdataX ,  CSRX , Valid , B_BGEU),


    LB    ->  List(I,excADD , RS1  ,  IMM   , CEN    , memwenX , WEN  , lbData  ,  CSRX , Valid , BX    ),
    LBU   ->  List(I,excADD , RS1  ,  IMM   , CEN    , memwenX , WEN  , lbuData ,  CSRX , Valid , BX    ),
    LH    ->  List(I,excADD , RS1  ,  IMM   , CEN    , memwenX , WEN  , lhData  ,  CSRX , Valid , BX    ),
    LHU   ->  List(I,excADD , RS1  ,  IMM   , CEN    , memwenX , WEN  , lhuData ,  CSRX , Valid , BX    ),
    LW    ->  List(I,excADD , RS1  ,  IMM   , CEN    , memwenX , WEN  , lwData  ,  CSRX , Valid , BX    ),
    LWU   ->  List(I,excADD , RS1  ,  IMM   , CEN    , memwenX , WEN  , lwuData ,  CSRX , Valid , BX    ),
    LD    ->  List(I,excADD , RS1  ,  IMM   , CEN    , memwenX , WEN  , ldData  ,  CSRX , Valid , BX    ),
    SB    ->  List(S,excADD , RS1  ,  IMM   , CEN    , OneByte , DISEN, wbdataX ,  CSRX , Valid , BX    ),
    SH    ->  List(S,excADD , RS1  ,  IMM   , CEN    , TwoByte , DISEN, wbdataX ,  CSRX , Valid , BX    ),
    SW    ->  List(S,excADD,  RS1  ,  IMM   , CEN    , FourByte, DISEN, wbdataX ,  CSRX,  Valid , BX    ),
    SD    ->  List(S,excADD,  RS1  ,  IMM   , CEN    , EighByte, DISEN, wbdataX ,  CSRX,  Valid , BX    )
  )

}

class CtrlSigsGen extends Bundle {
  val instTy : UInt = UInt(instrWD.W)
  val excTy  : UInt = UInt(excTyWD.W)
  val op1sel : UInt = UInt(op1selWD.W)
  val op2sel : UInt = UInt(op2selWD.W)
  val memcen : Bool = Bool()
  val memwen : UInt = UInt(4.W)
  val rfwen  : Bool = Bool()
  val wbdSel : UInt = UInt(wbdataselWD.W)
  val csr    : UInt = UInt(2.W)
  val valid  : Bool = Bool()
  val bTy    : UInt = UInt(3.W)

//======================================================================================================================//
//                                               excetype         memcen              wbdatasel        inst is valid ?  //
//                                       instrtype  |   op1,2 sel   |  memwen   rfwen   |     csrinstr |                //
//                                           |      |     |    |    |     |       |     |      |       |     branch ?   //
/**/  def defaultTable : List[BitPat] = List(X,   excX,op1X,op2X,DISEN,memwenX, DISEN,wbdataX,CSRX,  Invalid , BX)       //
//======================================================================================================================//
  def dcr(inst : UInt , table : Iterable[(BitPat,List[BitPat])]) : CtrlSigsGen  = { //decoder
    val deco = CtrlSigsDecode(inst,defaultTable,mappinIn = table)

    val sigs = Seq(instTy,excTy,op1sel,op2sel,memcen,memwen,rfwen,wbdSel,csr,valid,bTy)
    sigs zip deco map { case(s,d) => s:= d}

    this //return self
  }

}


object CtrlSigsDecode {
  /**
   *
   * @param in        指令
   * @param default   默认值
   * @param mappinIn  映射集合 ，这里指命令的BitPat合队友的控制信号集合，即 BEQ -> List(X,X,X,.......X)
   * @return 返回一个控制信号的Seq[UInt]
   */
  def apply(in : UInt , default : Seq[BitPat] , mappinIn : Iterable[(BitPat,List[BitPat])]) : Seq[UInt] = {
    val mapping = ArrayBuffer.fill(default.size)(ArrayBuffer[(BitPat,BitPat)]())
    /**
     * 这里实际是：
     * Array(
     *  BEQ   -> List(X,X,X.....X),
     *  ADDI  -> List(X,X,X.....X),
     *  ....
     *  ....
     * )
     * 的另一种写法。
     */
    for((key,values) <- mappinIn)
      for((values,i) <- values zipWithIndex)
        mapping(i) += key -> values

    for((thisDefault,thisMapping) <- default zip mapping)
      yield apply(in,thisDefault,thisMapping)
  }

  /**
   *
   * @param in          指令
   * @param default     默认值
   * @param mapping     映射集合 这里指命令的BitPat合队友的控制信号集合，即 BEQ -> List(X,X,X,.......X)
   * @return
   */
  def apply(in : UInt , default : BitPat , mapping : Iterable[(BitPat,BitPat)]) : UInt = {
    /**
     * 实际是 ：
     * MuxCase(default.value,Seq(
     *  in === BEQ  -> X , X , X, ...., X
     *  in === ADDI -> X , X , X, ...., X
     *  ....
     *  ....
     * ))
     */
    MuxCase(default.value.U,
      mapping.map{case (instBP , ctriSigsBP) => (in === instBP) -> ctriSigsBP.value.U}.toSeq)
  }
}

object immGen {
  def apply( inst : UInt , instTy : UInt ) : UInt = {
    val sigBit  : UInt = Mux( instTy === Z , 0.U(1.W) , inst(31))
    val b30_20  : UInt = Mux( instTy === U , inst(30,20) , Fill(11,sigBit) )
    val b19_12  : UInt = Mux( instTy =/= U && instTy =/= J , Fill(8,sigBit) , inst(19,12) )
    val b11     : UInt = Mux( instTy === B , inst(7) ,
                           Mux( instTy === J , inst(20) ,
                           Mux( instTy === U || instTy === Z , 0.U(1.W) , sigBit)))
    val b10_5   : UInt = Mux( instTy === U || instTy === Z , 0.U(6.W) , inst(30,25))
    val b4_1    : UInt = Mux( instTy === U , 0.U(4.W) ,
                          Mux( instTy === S || instTy === B , inst(11,8),
                          Mux(instTy === Z , inst(19,16),inst(24,21))))
    val b0      : UInt = Mux( instTy === S , inst(7) ,
                           Mux( instTy === I , inst(20) ,
                           Mux( instTy === Z , inst(15),0.U(1.W))))
    Cat(Fill(33,sigBit),b30_20,b19_12,b11,b10_5,b4_1,b0)
  }
}

class GprBund extends Bundle {
  val rs1 = UInt(5.W)
  val rs2 = UInt(5.W)
  val rd  = UInt(5.W)
}

object DecodeGprAddr {
  def apply(inst : UInt ) :GprBund = {
    val ret = Wire(new GprBund)
    ret.rs1 := inst(19,15)
    ret.rs2 := inst(24,20)
    ret.rd  := inst(11, 7)
    ret
  }
}

class GprAddrGen (inWD : Int )extends Module {
  val io = IO(new Bundle{
    val in = Input(UInt(inWD.W))
    val o  = Output(new GprBund)
  })
  io.o := DecodeGprAddr(io.in)
}


class OpVecGen(op1sel : UInt , op2sel : UInt){
  private val WD = 64
  def op1Gen(rsdata : UInt , pc : UInt) : UInt = {
    MuxLookup(op1sel , rsdata , Seq(
      RS1 -> rsdata ,
      PC  -> pc ,
      ZERO1 -> 0.U(WD.W)
    ))
  }
  def op2Gen(rsdata : UInt , imm : UInt ): UInt = {
    MuxLookup(op2sel , rsdata, Seq(
      RS2   -> rsdata ,
      IMM   -> imm ,
      PLUS4 -> 4.U(WD.W),
      ZERO2 -> 0.U(WD.W)
    ))
  }
}

object loadstallReq {
  def apply(memcen : UInt , memwen : UInt) : Bool = {
    Mux(memcen === 1.U && memwen === 0.U , true.B ,false.B  )
  }
}