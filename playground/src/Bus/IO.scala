package Bus

import chisel3._
import chisel3.util
import constant.Consts._
import constant._
class RFio extends Bundle{
  val raddr1  = Input(UInt(ADDR_LEN.W))
  val raddr2  = Input(UInt(ADDR_LEN.W))
  val rdata1  = Output(UInt(DWORD_LEN.W))
  val rdata2  = Output(UInt(DWORD_LEN.W))

  val wen     = Input(Bool())
  val waddr   = Input(UInt(ADDR_LEN.W))
  val wdata   = Input(UInt(DWORD_LEN.W))
}
//INST ROM
class IMemIO extends Bundle{
 val cen = Input(Bool())//read enable
  //  val wen = Input(Bool())
  val pc  = Input(UInt(DWORD_LEN.W))
  val inst = Output(UInt(INST_LEN.W))
}
//DATA RAM

class DMemIo extends Bundle{
  val addr = Input(UInt(WORD_LEN.W))
  val rdata = Output(UInt(DWORD_LEN.W))
  val wen  = Input(Bool())
  val wdata = Input(UInt(DWORD_LEN.W))
}


class DebugIo (data_width : Int ,addr_width : Int)extends Bundle {
  val Debug_rf_wen = Output(Bool())
  val Debug_rf_waddr = Output(UInt(addr_width.W))
  val Debug_rf_wdata = Output(UInt(data_width.W))
  val Debug_pc      = Output(UInt(DWORD_LEN.W))
  val Debug_inst    = Output(UInt(INST_LEN.W))
}