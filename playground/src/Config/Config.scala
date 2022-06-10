package Config

import chisel3._

/**
 * @CoreName : Go
 * build in the riscv-64 isa .
 * Simple 5-stage .
 */
trait GoParameter {
  val ISA = "rv64"
  val XLEN    : Int     = 64
  val instrWD : Int     = 32
  val rstValue : UInt = "h0000_0000_8000_0000".U(XLEN.W)

  val debugPrintOption : Boolean  = false 
}
