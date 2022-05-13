package Core

import constant.Consts._
import chisel3._


class srcx extends Bundle{
  val src1 = Input(UInt(DWORD_LEN.W))
  val src2 = Input(UInt(DWORD_LEN.W))
  val imm = Input(UInt(DWORD_LEN.W))
}

class mem_wen_bundle extends  Bundle {
  val mem_wen_in = Input(Bool())
  val mem_wen_o = Output(Bool())
}
class regwen_bundle extends  Bundle {
  val reg_wen_in = Input(Bool())
  val reg_wen_o  = Output(Bool())
}
class reg_wtype_bundle extends  Bundle {
  val reg_wtype_in = Input(UInt(WB_LEN.W))
  val reg_wtype_out = Output(UInt(WB_LEN.W))
}
class pc_and_inst extends Bundle {
  val pc = Input(UInt(DWORD_LEN.W))
  val inst = Input(UInt(INST_LEN.W))
}

//************************************************//
//************************************************//
class if_id extends Module{
  val io = IO(new Bundle{
    val pc = Input(UInt(DWORD_LEN.W))
    val inst = Input(UInt(INST_LEN.W))

    val pc_o = Output(UInt(DWORD_LEN.W))
    val inst_o = Output(UInt(INST_LEN.W))
  })

  val pcR = RegInit(0.U(DWORD_LEN.W))
  val instR = RegInit(0.U(INST_LEN.W))

  pcR := io.pc
  instR := io.inst

  io.pc_o := pcR
  io.inst_o := instR
}

class id_ex extends Module{
  val io = IO(new Bundle{

    val pc_and_inst_in = new pc_and_inst
    val pc_and_inst_out = Flipped(new pc_and_inst)
    val inst_is_jump_in = Input(Bool())
    val inst_is_jump_o  = Output(Bool())

    val src_in = new srcx
    val src_out = Flipped(new srcx)
    val wb_addr_in = Input(UInt(5.W))
    val wb_addr_o = Output(UInt(5.W))

    val Dmem_wdata_in = Input(UInt(DWORD_LEN.W))
    val Dmem_wdata_o  = Output(UInt(DWORD_LEN.W))

    val exeu_op = Input(UInt(EXE_SEL_LEN.W))
    val exeu_op_o = Output(UInt(EXE_SEL_LEN.W))

    val mem_wen_io = new mem_wen_bundle

    val reg_wen_io = new regwen_bundle

    val wb_type_io = new reg_wtype_bundle
  })
  val pcR = RegInit(0.U(DWORD_LEN.W))
  val instR = RegInit(0.U(INST_LEN.W))
  pcR := io.pc_and_inst_in.pc
  instR := io.pc_and_inst_in.inst
  io.pc_and_inst_out.pc := pcR
  io.pc_and_inst_out.inst := instR

  val immR = RegInit(0.U(DWORD_LEN.W))
  val src1R = RegInit(0.U(DWORD_LEN.W))
  val src2R = RegInit(0.U(DWORD_LEN.W))
  immR := io.src_in.imm
  src1R := io.src_in.src1
  src2R := io.src_in.src2
  io.src_out.imm  := immR
  io.src_out.src1 := src1R
  io.src_out.src2 := src2R

  val wb_addrR = RegInit(0.U(5.W))
  wb_addrR := io.wb_addr_in
  io.wb_addr_o := wb_addrR


  val exeu_op_selR =RegInit(0.U(EXE_SEL_LEN.W))
  exeu_op_selR := io.exeu_op
  io.exeu_op_o := exeu_op_selR

  val memwenR = RegInit(false.B)
  memwenR := io.mem_wen_io.mem_wen_in
  io.mem_wen_io.mem_wen_o := memwenR

  val wenR = RegInit(false.B)
  wenR := io.reg_wen_io.reg_wen_in
  io.reg_wen_io.reg_wen_o := wenR

  val wtypeR = RegInit(0.U(WB_LEN.W))
  wtypeR := io.wb_type_io.reg_wtype_in
  io.wb_type_io.reg_wtype_out := wtypeR
  val Dmem_wdataR = RegInit(0.U(DWORD_LEN.W))
  Dmem_wdataR := io.Dmem_wdata_in
  io.Dmem_wdata_o := Dmem_wdataR


  val inst_is_j_flagR = RegInit(false.B)

  inst_is_j_flagR := io.inst_is_jump_in
  io.inst_is_jump_o := inst_is_j_flagR
}

class ex_mem extends Module {
  val io = IO(new Bundle {
    val pc_and_inst_in = new pc_and_inst
    val pc_and_inst_out = Flipped(new pc_and_inst)

    val alu_out_in = Input(UInt(DWORD_LEN.W))
    val alu_out_o  = Output(UInt(DWORD_LEN.W))

    val wb_addr_in = Input(UInt(5.W))
    val wb_addr_o  = Output(UInt(5.W))

    val Dmem_wdata_in = Input(UInt(DWORD_LEN.W))
    val Dmem_wdata_o = Output(UInt(DWORD_LEN.W))

    val mem_wen_io = new mem_wen_bundle
    val rf_wen_io = new regwen_bundle
    val wb_sel_io = new reg_wtype_bundle
  })
  val pcR = RegInit(0.U(DWORD_LEN.W))
  val instR = RegInit(0.U(WORD_LEN.W))
  pcR := io.pc_and_inst_in.pc
  instR := io.pc_and_inst_in.inst
  io.pc_and_inst_out.pc := pcR
  io.pc_and_inst_out.inst := instR

  val mem_wenR = RegInit(false.B)
  val rf_wenR = RegInit(false.B)
  val wb_selR = RegInit(0.U(WB_LEN.W))
  val wb_addrR = RegInit(0.U(5.W))
  val alu_outR = RegInit(0.U(DWORD_LEN.W))
  val Dmem_wdataR = RegInit(0.U(DWORD_LEN.W))
  Dmem_wdataR := io.Dmem_wdata_in
  io.Dmem_wdata_o := Dmem_wdataR


  mem_wenR := io.mem_wen_io.mem_wen_in
  io.mem_wen_io.mem_wen_o := mem_wenR
  rf_wenR := io.rf_wen_io.reg_wen_in
  io.rf_wen_io.reg_wen_o := rf_wenR
  wb_selR := io.wb_sel_io.reg_wtype_in
  io.wb_sel_io.reg_wtype_out := wb_selR
  wb_addrR := io.wb_addr_in
  io.wb_addr_o := wb_addrR
  alu_outR := io.alu_out_in
  io.alu_out_o := alu_outR
}


class mem_wb extends Module {
  val io = IO(new Bundle {
    val pc_and_inst_in = new pc_and_inst
    val pc_and_inst_o  = Flipped(new pc_and_inst)

    val pc_plus4_in = Input(UInt(DWORD_LEN.W))
    val pc_plus4_o  = Output(UInt(DWORD_LEN.W))

    val wb_addr_in = Input(UInt(5.W))
    val wb_addr_o  = Output(UInt(5.W))

    val alu_out_in = Input(UInt(DWORD_LEN.W))
    val alu_out_o  = Output(UInt(DWORD_LEN.W))

    val rf_wen_io = new regwen_bundle
    val wb_sel_io = new reg_wtype_bundle
    val Dmem_rdata_in = Input(UInt(DWORD_LEN.W))
    val Dmem_rdata_o  = Output(UInt(DWORD_LEN.W))
  })
  val pcR = RegInit(0.U(DWORD_LEN.W))
  pcR := io.pc_and_inst_in.pc
  io.pc_and_inst_o.pc := pcR

  val instR = RegInit(0.U(INST_LEN.W))
  instR := io.pc_and_inst_in.inst
  io.pc_and_inst_o.inst := instR

  val wb_addrR = RegInit(0.U(5.W))
  wb_addrR := io.wb_addr_in
  io.wb_addr_o := wb_addrR

  val rf_wenR = RegInit(false.B)
  rf_wenR := io.rf_wen_io.reg_wen_in
  io.rf_wen_io.reg_wen_o := rf_wenR

  val wb_selR = RegInit(0.U(WB_LEN.W))
  wb_selR := io.wb_sel_io.reg_wtype_in
  io.wb_sel_io.reg_wtype_out := wb_selR

  val Dmem_rdataR = RegInit(0.U(DWORD_LEN.W))
  Dmem_rdataR := io.Dmem_rdata_in
  io.Dmem_rdata_o := Dmem_rdataR

  val pcplus4R = RegInit(0.U(DWORD_LEN.W))
  pcplus4R := io.pc_plus4_in
  io.pc_plus4_o := pcplus4R

  val aluR = RegInit(0.U(DWORD_LEN.W))
  aluR := io.alu_out_in
  io.alu_out_o := aluR

}
