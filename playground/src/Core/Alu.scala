package Core
import Const.Consts._
import Core.Alu.{isSub, islogicorshift, sextBits, zext}
import chisel3._
import chisel3.util._
object Alu {
  def isSub(cmd : UInt ) : Bool = cmd === excSUB
  def islogicorshift(cmd : UInt ) : Bool = cmd === excSLT || cmd === excSLTU
  /**
   * 有符号数32位阶段继续符号拓展
   * @param data 要继续有符号拓展的数
   * @return
   */
//  def mysext(data : UInt ) : UInt = {
//    val ret = Wire(UInt(64.W))
//    ret := Cat( Fill( data.getWidth-32, data(31) ), data(31,0) )
//    ret
//  }
  def sextBits(data : UInt , Bits : Int  = 32 ) :UInt = {
    val ret = Wire(UInt(64.W))
    ret := Cat( Fill( data.getWidth - Bits , data(Bits - 1)) , data(Bits-1,0) )
    ret
  }

  /**
   * 无符号32位阶段拓展
   * @param data 要继续无符号拓展的数
   * @return
   */
  def zext(data : UInt ,Bits : Int = 32 ) : UInt = {
    val ret = Wire(UInt(64.W))
//    ret := Cat(0.U(32.W),data(31,0))
//    ret
    ret := Cat(0.U((data.getWidth - Bits).W),data(Bits-1,0))
    ret
  }
}
class Alu (XLEN : Int ) extends Module {
  val io = IO(new Bundle{
    val excTy = Input(UInt(excTyWD.W))
    val opVec = Input(Vec(2,UInt(XLEN.W)))

    val result = Output(UInt(XLEN.W))
  })
  val op2 : UInt = Mux(isSub(io.excTy),(~io.opVec(1)).asUInt()+1.U(XLEN.W),io.opVec(1))
  val op1 : UInt = io.opVec(0)

  val add_sub_result : UInt = Wire(UInt(XLEN.W))
  val logicShiftResult : UInt = Wire(UInt(XLEN.W))
  add_sub_result := MuxLookup(io.excTy,0.U(XLEN.W),Seq(
    excADD  ->  ( op1 + op2 ) ,
    excSUB  ->  ( op1 + op2 ) ,
    excADDW ->  sextBits( op1 + op2 )
  ))

  logicShiftResult := MuxLookup(io.excTy,0.U(XLEN.W),Seq(
    excSLT    -> ( op1.asSInt() < op2.asSInt() ) ,
    excSLTU   -> ( op1.asUInt() < op2.asUInt() )
  ))

  io.result := MuxCase(add_sub_result,Seq(
    islogicorshift(io.excTy) -> logicShiftResult
  ))
}
