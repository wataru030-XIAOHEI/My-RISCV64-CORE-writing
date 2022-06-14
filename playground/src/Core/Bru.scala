package Core

import Config.GoParameter
import Const.Consts._
import chisel3._
import chisel3.util._


class Bru  {

  def flaggen(Bty : UInt ,op1 : SInt,op2 : SInt) = {
    MuxLookup(Bty,false.B,Seq(
      B_BEQ   -> (op1.asSInt() === op2.asSInt()),
      B_BNE   -> (op1.asSInt() =/= op2.asSInt()),
      B_BLT   -> (op1.asSInt()  <  op2.asSInt()),
      B_BLTU  -> (op1.asUInt()  <  op2.asUInt()),
      B_BGE   -> (op1.asSInt()  >= op2.asSInt()),
      B_BGEU  -> (op1.asUInt()  >= op2.asUInt())
    ))
  }
}
