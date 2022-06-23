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

  val defaultdata = "h0000_0000_0000_0000".U

  val XX = BitPat("b0")
  val DISEN = BitPat("b0")
  //======instr type ============
  val inTyWd = 3
  val X = BitPat("b000")
  val I = 1.U(inTyWd.W)
  val B = 2.U(inTyWd.W)
  val S = 3.U(inTyWd.W)
  val J = 4.U(inTyWd.W)
  val U = 5.U(inTyWd.W)
  val Z = 6.U(inTyWd.W)
  val R = 7.U(inTyWd.W)
  //==========exceu type ==============
  val excTyWD = 7
  val excX   = BitPat("b0000000")
  val excADD = 1.U(excTyWD.W)
  val excSUB = 2.U(excTyWD.W)
  val excSLT = 3.U(excTyWD.W)
  val excADDW = 4.U(excTyWD.W)
  val excSUBW = 5.U(excTyWD.W)
  val excSLTU = 6.U(excTyWD.W)
  val excOR   = 7.U(excTyWD.W)
  val excXOR  = 8.U(excTyWD.W)
  val excAND  = 9.U(excTyWD.W)
  val excSLL  = 10.U(excTyWD.W)
  val excSRL  = 11.U(excTyWD.W)
  val excSRA  = 12.U(excTyWD.W)
  val excSLLW = 13.U(excTyWD.W)
  val excSRLW = 14.U(excTyWD.W)
  val excSRAW = 15.U(excTyWD.W)
  val MULT = 22.U(excTyWD.W)
  val DIV = 23.U(excTyWD.W)


  //=====op1_sel
  val op1selWD = 2
  val op1X = BitPat("b00")
  val RS1 = 1.U(op1selWD.W)
  val PC  = 2.U(op1selWD.W)
  val ZERO1 = 3.U(op1selWD.W)
  //=====op2_sel
  val op2selWD = 3
  val op2X = BitPat("b000")
  val RS2 = 1.U(op2selWD.W)
  val IMM = 2.U(op2selWD.W)
  val ZERO2 = 3.U(op2selWD.W)
  val PLUS4 = 4.U(op2selWD.W)

  //mem cen

  val CEN = BitPat("b1")

  //memwen
  val memwenX = /*BitPat("b0000")*/"b0000".U(4.W)
  val OneByte = /*BitPat("b0001")*/"b0001".U(4.W)
  val TwoByte = /*BitPat("b0010")*/"b0010".U(4.W)
  val FourByte= /*BitPat("b0100")*/"b0100".U(4.W)
  val EighByte= /*BitPat("b1000")*/"b1000".U(4.W)
  //wb_data_sel
  val wbdataselWD = 4
  val wbdataX = BitPat("b0000")
  val ALU_OUT = 1.U(wbdataselWD.W)
  val lbData  = 2.U(wbdataselWD.W)
  val lbuData = 3.U(wbdataselWD.W)
  val lhData  = 4.U(wbdataselWD.W)
  val lhuData = 5.U(wbdataselWD.W)
  val lwData  = 6.U(wbdataselWD.W)
  val lwuData = 7.U(wbdataselWD.W)
  val ldData  = 8.U(wbdataselWD.W)
  //rfwen
  val WEN = BitPat("b1")

  //=====csr
  val CSRX = BitPat("b00")
  val CSRA = BitPat("b01")

  //instr invild
  val Invalid = BitPat("b0")
  val Valid =   BitPat("b1")


  //branchX
  val BX = BitPat("b000")
  val B_BEQ   = 1.U(3.W)
  val B_BNE   = 2.U(3.W)
  val B_BLT   = 3.U(3.W)
  val B_BLTU  = 4.U(3.W)
  val B_BGE   = 5.U(3.W)
  val B_BGEU  = 6.U(3.W)


}
