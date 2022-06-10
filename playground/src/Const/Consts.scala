package Const

import Config.GoParameter
import chisel3._
import chisel3.util._
import Const.Inst._
object util {
  implicit def uintToBitPat(x:UInt) : BitPat = BitPat(x)
}
//RV64------ I / M

object Consts extends GoParameter{

  def defaultdata = "h0000_0000_0000_0000".U

  def XX = BitPat("b0")
  def DISEN = BitPat("b0")
  //======instr type ============
  val inTyWd = 3
  def X = BitPat("b000")
  def I = 1.U(inTyWd.W)
  def B = 2.U(inTyWd.W)
  def S = 3.U(inTyWd.W)
  def J = 4.U(inTyWd.W)
  def U = 5.U(inTyWd.W)
  def Z = 6.U(inTyWd.W)
  def R = 7.U(inTyWd.W)
  //==========exceu type ==============
  val excTyWD = 7
  def excX   = BitPat("b0000000")
  def excADD = 1.U(excTyWD.W)
  def excSUB = 2.U(excTyWD.W)
  def excSLT = 3.U(excTyWD.W)
  def excADDW = 4.U(excTyWD.W)
  def excSLTU = 5.U(excTyWD.W)
  def MULT = 22.U(excTyWD.W)
  def DIV = 23.U(excTyWD.W)


  //=====op1_sel
  val op1selWD = 2
  def op1X = BitPat("b00")
  def RS1 = 1.U(op1selWD.W)
  def PC  = 2.U(op1selWD.W)
  def ZERO1 = 3.U(op1selWD.W)
  //=====op2_sel
  val op2selWD = 3
  def op2X = BitPat("b000")
  def RS2 = 1.U(op2selWD.W)
  def IMM = 2.U(op2selWD.W)
  def ZERO2 = 3.U(op2selWD.W)
  def PLUS4 = 4.U(op2selWD.W)

  //mem cen

  def CEN = BitPat("b1")

  //memwen
  def memwenX = BitPat("b0000")
  def OneByte = BitPat("b0001")
  def TwoByte = BitPat("b0010")
  def FourByte= BitPat("b1111")

  //wb_data_sel
  val wbdataselWD = 3
  def wbdataX = BitPat("b000")
  def ALU_OUT = 1.U(wbdataselWD.W)
  def LOAD_DATA = 2.U(wbdataselWD.W)

  //rfwen
  def WEN = BitPat("b1")

  //=====csr
  def CSRX = BitPat("b00")
  def CSRA = BitPat("b01")

  //instr invild
  def Invalid = BitPat("b0")
  def Valid =   BitPat("b1")


  //branchX
  def BX = BitPat("b000")
  def B_BEQ   = 1.U(3.W)
  def B_BNE   = 2.U(3.W)
  def B_BLT   = 3.U(3.W)
  def B_BLTU  = 4.U(3.W)
  def B_BGE   = 5.U(3.W)
  def B_BGEU  = 6.U(3.W)


}
