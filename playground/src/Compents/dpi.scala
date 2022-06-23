package Compents

import chisel3.BlackBox
import chisel3._
class dpi extends BlackBox{
  val io = IO(new Bundle{
    val inst = Input(UInt(32.W))
    val pc   = Input(UInt(64.W))
    val gpr_a0 = Input(UInt(64.W))
  })
}
