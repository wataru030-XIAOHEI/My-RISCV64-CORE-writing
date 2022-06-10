package Compents

import chisel3.BlackBox
import chisel3._
class dpi extends BlackBox{
  val io = IO(new Bundle{
    val inst = Input(UInt(32.W))
  })
}
