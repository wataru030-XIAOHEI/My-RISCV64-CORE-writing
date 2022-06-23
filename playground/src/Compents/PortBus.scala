package Compents

import Config.GoParameter
import chisel3._

trait MemParam extends GoParameter {
  val ADDRWD = XLEN
  val VADDRWD = XLEN
}

class DebugIO extends Bundle  {
  val debugPc = Output(UInt(64.W))
  val debugInst = Output(UInt(32.W))
  val debugwen = Output(Bool())
  val debugwaddr =Output(UInt(5.W))
  val debugdata = Output(UInt(64.W))
}
class IMemIO(datawidth : Int) extends Bundle {
  val addr = Output(UInt(64.W))
  val rdata = Input(UInt(datawidth.W))
  val cen   = Output(Bool())
  val wen   = Output(Bool())
  val wdata = Output(UInt(64.W))
}
class DMemIO(datawidth : Int) extends Bundle {
  val addr = Output(UInt(64.W))
  val rdata = Input(UInt(datawidth.W))
  val cen   = Output(Bool())
  val wen   = Output(UInt(4.W))
  val wdata = Output(UInt(64.W))
}


class bypass() extends Bundle {
  val wr    = UInt(64.W)
  val wen   = Bool()
  val waddr = UInt(5.W)
}
class BranchBus extends Bundle  {
  val flag  :Bool   = Bool()
  val target :UInt  = UInt(64.W)
  val Cancel :Bool  = Bool()
}