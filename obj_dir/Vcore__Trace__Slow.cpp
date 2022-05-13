// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vcore__Syms.h"


void Vcore___024root__traceInitSub0(Vcore___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void Vcore___024root__traceInitTop(Vcore___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        Vcore___024root__traceInitSub0(vlSelf, tracep);
    }
}

void Vcore___024root__traceInitSub0(Vcore___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBit(c+179,"clock", false,-1);
        tracep->declBit(c+180,"reset", false,-1);
        tracep->declBit(c+181,"io_Imemio_cen", false,-1);
        tracep->declQuad(c+182,"io_Imemio_pc", false,-1, 63,0);
        tracep->declBus(c+184,"io_Imemio_inst", false,-1, 31,0);
        tracep->declBus(c+185,"io_DMemio_addr", false,-1, 31,0);
        tracep->declQuad(c+186,"io_DMemio_rdata", false,-1, 63,0);
        tracep->declBit(c+188,"io_DMemio_wen", false,-1);
        tracep->declQuad(c+189,"io_DMemio_wdata", false,-1, 63,0);
        tracep->declBit(c+191,"io_Deubug_Debug_rf_wen", false,-1);
        tracep->declBus(c+192,"io_Deubug_Debug_rf_waddr", false,-1, 4,0);
        tracep->declQuad(c+193,"io_Deubug_Debug_rf_wdata", false,-1, 63,0);
        tracep->declQuad(c+195,"io_Deubug_Debug_pc", false,-1, 63,0);
        tracep->declBus(c+197,"io_Deubug_Debug_inst", false,-1, 31,0);
        tracep->declBit(c+179,"core clock", false,-1);
        tracep->declBit(c+180,"core reset", false,-1);
        tracep->declBit(c+181,"core io_Imemio_cen", false,-1);
        tracep->declQuad(c+182,"core io_Imemio_pc", false,-1, 63,0);
        tracep->declBus(c+184,"core io_Imemio_inst", false,-1, 31,0);
        tracep->declBus(c+185,"core io_DMemio_addr", false,-1, 31,0);
        tracep->declQuad(c+186,"core io_DMemio_rdata", false,-1, 63,0);
        tracep->declBit(c+188,"core io_DMemio_wen", false,-1);
        tracep->declQuad(c+189,"core io_DMemio_wdata", false,-1, 63,0);
        tracep->declBit(c+191,"core io_Deubug_Debug_rf_wen", false,-1);
        tracep->declBus(c+192,"core io_Deubug_Debug_rf_waddr", false,-1, 4,0);
        tracep->declQuad(c+193,"core io_Deubug_Debug_rf_wdata", false,-1, 63,0);
        tracep->declQuad(c+195,"core io_Deubug_Debug_pc", false,-1, 63,0);
        tracep->declBus(c+197,"core io_Deubug_Debug_inst", false,-1, 31,0);
        tracep->declBit(c+179,"core if_id_pl_clock", false,-1);
        tracep->declBit(c+180,"core if_id_pl_reset", false,-1);
        tracep->declQuad(c+1,"core if_id_pl_io_pc", false,-1, 63,0);
        tracep->declBus(c+184,"core if_id_pl_io_inst", false,-1, 31,0);
        tracep->declQuad(c+3,"core if_id_pl_io_pc_o", false,-1, 63,0);
        tracep->declBus(c+5,"core if_id_pl_io_inst_o", false,-1, 31,0);
        tracep->declBit(c+179,"core id_ex_pl_clock", false,-1);
        tracep->declBit(c+180,"core id_ex_pl_reset", false,-1);
        tracep->declQuad(c+6,"core id_ex_pl_io_pc_and_inst_in_pc", false,-1, 63,0);
        tracep->declBus(c+5,"core id_ex_pl_io_pc_and_inst_in_inst", false,-1, 31,0);
        tracep->declQuad(c+8,"core id_ex_pl_io_pc_and_inst_out_pc", false,-1, 63,0);
        tracep->declBus(c+10,"core id_ex_pl_io_pc_and_inst_out_inst", false,-1, 31,0);
        tracep->declBit(c+11,"core id_ex_pl_io_inst_is_jump_in", false,-1);
        tracep->declBit(c+12,"core id_ex_pl_io_inst_is_jump_o", false,-1);
        tracep->declQuad(c+13,"core id_ex_pl_io_src_in_src1", false,-1, 63,0);
        tracep->declQuad(c+15,"core id_ex_pl_io_src_in_src2", false,-1, 63,0);
        tracep->declQuad(c+17,"core id_ex_pl_io_src_in_imm", false,-1, 63,0);
        tracep->declQuad(c+19,"core id_ex_pl_io_src_out_src1", false,-1, 63,0);
        tracep->declQuad(c+21,"core id_ex_pl_io_src_out_src2", false,-1, 63,0);
        tracep->declQuad(c+17,"core id_ex_pl_io_src_out_imm", false,-1, 63,0);
        tracep->declBus(c+23,"core id_ex_pl_io_wb_addr_in", false,-1, 4,0);
        tracep->declBus(c+24,"core id_ex_pl_io_wb_addr_o", false,-1, 4,0);
        tracep->declQuad(c+25,"core id_ex_pl_io_Dmem_wdata_in", false,-1, 63,0);
        tracep->declQuad(c+27,"core id_ex_pl_io_Dmem_wdata_o", false,-1, 63,0);
        tracep->declBus(c+29,"core id_ex_pl_io_exeu_op", false,-1, 4,0);
        tracep->declBus(c+30,"core id_ex_pl_io_exeu_op_o", false,-1, 4,0);
        tracep->declBit(c+31,"core id_ex_pl_io_mem_wen_io_mem_wen_in", false,-1);
        tracep->declBit(c+32,"core id_ex_pl_io_mem_wen_io_mem_wen_o", false,-1);
        tracep->declBit(c+33,"core id_ex_pl_io_reg_wen_io_reg_wen_in", false,-1);
        tracep->declBit(c+34,"core id_ex_pl_io_reg_wen_io_reg_wen_o", false,-1);
        tracep->declBus(c+35,"core id_ex_pl_io_wb_type_io_reg_wtype_in", false,-1, 1,0);
        tracep->declBus(c+36,"core id_ex_pl_io_wb_type_io_reg_wtype_out", false,-1, 1,0);
        tracep->declBit(c+179,"core rf_clock", false,-1);
        tracep->declBus(c+37,"core rf_io_channel_raddr1", false,-1, 4,0);
        tracep->declBus(c+38,"core rf_io_channel_raddr2", false,-1, 4,0);
        tracep->declQuad(c+39,"core rf_io_channel_rdata1", false,-1, 63,0);
        tracep->declQuad(c+25,"core rf_io_channel_rdata2", false,-1, 63,0);
        tracep->declBit(c+41,"core rf_io_channel_wen", false,-1);
        tracep->declBus(c+42,"core rf_io_channel_waddr", false,-1, 4,0);
        tracep->declQuad(c+43,"core rf_io_channel_wdata", false,-1, 63,0);
        tracep->declBit(c+179,"core ex_mem_pl_clock", false,-1);
        tracep->declBit(c+180,"core ex_mem_pl_reset", false,-1);
        tracep->declQuad(c+8,"core ex_mem_pl_io_pc_and_inst_in_pc", false,-1, 63,0);
        tracep->declBus(c+10,"core ex_mem_pl_io_pc_and_inst_in_inst", false,-1, 31,0);
        tracep->declQuad(c+45,"core ex_mem_pl_io_pc_and_inst_out_pc", false,-1, 63,0);
        tracep->declBus(c+47,"core ex_mem_pl_io_pc_and_inst_out_inst", false,-1, 31,0);
        tracep->declQuad(c+48,"core ex_mem_pl_io_alu_out_in", false,-1, 63,0);
        tracep->declQuad(c+50,"core ex_mem_pl_io_alu_out_o", false,-1, 63,0);
        tracep->declBus(c+24,"core ex_mem_pl_io_wb_addr_in", false,-1, 4,0);
        tracep->declBus(c+52,"core ex_mem_pl_io_wb_addr_o", false,-1, 4,0);
        tracep->declQuad(c+27,"core ex_mem_pl_io_Dmem_wdata_in", false,-1, 63,0);
        tracep->declQuad(c+53,"core ex_mem_pl_io_Dmem_wdata_o", false,-1, 63,0);
        tracep->declBit(c+32,"core ex_mem_pl_io_mem_wen_io_mem_wen_in", false,-1);
        tracep->declBit(c+55,"core ex_mem_pl_io_mem_wen_io_mem_wen_o", false,-1);
        tracep->declBit(c+34,"core ex_mem_pl_io_rf_wen_io_reg_wen_in", false,-1);
        tracep->declBit(c+56,"core ex_mem_pl_io_rf_wen_io_reg_wen_o", false,-1);
        tracep->declBus(c+36,"core ex_mem_pl_io_wb_sel_io_reg_wtype_in", false,-1, 1,0);
        tracep->declBus(c+57,"core ex_mem_pl_io_wb_sel_io_reg_wtype_out", false,-1, 1,0);
        tracep->declBit(c+179,"core mem_wb_pl_clock", false,-1);
        tracep->declBit(c+180,"core mem_wb_pl_reset", false,-1);
        tracep->declQuad(c+45,"core mem_wb_pl_io_pc_and_inst_in_pc", false,-1, 63,0);
        tracep->declBus(c+47,"core mem_wb_pl_io_pc_and_inst_in_inst", false,-1, 31,0);
        tracep->declQuad(c+58,"core mem_wb_pl_io_pc_and_inst_o_pc", false,-1, 63,0);
        tracep->declBus(c+60,"core mem_wb_pl_io_pc_and_inst_o_inst", false,-1, 31,0);
        tracep->declQuad(c+61,"core mem_wb_pl_io_pc_plus4_in", false,-1, 63,0);
        tracep->declQuad(c+63,"core mem_wb_pl_io_pc_plus4_o", false,-1, 63,0);
        tracep->declBus(c+52,"core mem_wb_pl_io_wb_addr_in", false,-1, 4,0);
        tracep->declBus(c+42,"core mem_wb_pl_io_wb_addr_o", false,-1, 4,0);
        tracep->declQuad(c+50,"core mem_wb_pl_io_alu_out_in", false,-1, 63,0);
        tracep->declQuad(c+65,"core mem_wb_pl_io_alu_out_o", false,-1, 63,0);
        tracep->declBit(c+56,"core mem_wb_pl_io_rf_wen_io_reg_wen_in", false,-1);
        tracep->declBit(c+41,"core mem_wb_pl_io_rf_wen_io_reg_wen_o", false,-1);
        tracep->declBus(c+57,"core mem_wb_pl_io_wb_sel_io_reg_wtype_in", false,-1, 1,0);
        tracep->declBus(c+67,"core mem_wb_pl_io_wb_sel_io_reg_wtype_out", false,-1, 1,0);
        tracep->declQuad(c+186,"core mem_wb_pl_io_Dmem_rdata_in", false,-1, 63,0);
        tracep->declQuad(c+68,"core mem_wb_pl_io_Dmem_rdata_o", false,-1, 63,0);
        tracep->declBus(c+60,"core dpi_inst_in", false,-1, 31,0);
        tracep->declBit(c+70,"core ImemCenR", false,-1);
        tracep->declQuad(c+1,"core pc_reg", false,-1, 63,0);
        tracep->declQuad(c+71,"core pc_plus4", false,-1, 63,0);
        tracep->declBus(c+30,"core exec_fun_ex", false,-1, 4,0);
        tracep->declQuad(c+19,"core op1_ex", false,-1, 63,0);
        tracep->declQuad(c+21,"core op2_ex", false,-1, 63,0);
        tracep->declBit(c+73,"core branch_flag", false,-1);
        tracep->declBit(c+12,"core jump_flag_ex", false,-1);
        tracep->declQuad(c+8,"core pc_ex", false,-1, 63,0);
        tracep->declQuad(c+17,"core imm_b_sext_ex", false,-1, 63,0);
        tracep->declQuad(c+74,"core branch_target", false,-1, 63,0);
        tracep->declBus(c+5,"core inst_id", false,-1, 31,0);
        tracep->declBus(c+37,"core rs1", false,-1, 4,0);
        tracep->declBus(c+23,"core rd", false,-1, 4,0);
        tracep->declBus(c+76,"core imm_i", false,-1, 11,0);
        tracep->declQuad(c+77,"core imm_i_sext_hi", false,-1, 51,0);
        tracep->declQuad(c+79,"core imm_i_sext", false,-1, 63,0);
        tracep->declBus(c+81,"core imm_s_hi", false,-1, 6,0);
        tracep->declBus(c+82,"core imm_s", false,-1, 11,0);
        tracep->declQuad(c+77,"core imm_s_sext_hi", false,-1, 51,0);
        tracep->declQuad(c+83,"core imm_s_sext", false,-1, 63,0);
        tracep->declBus(c+85,"core imm_u", false,-1, 19,0);
        tracep->declQuad(c+86,"core imm_u_sext_hi", false,-1, 43,0);
        tracep->declArray(c+88,"core imm_u_shifted", false,-1, 75,0);
        tracep->declBit(c+91,"core imm_j_hi_hi", false,-1);
        tracep->declBus(c+92,"core imm_j_hi_lo", false,-1, 7,0);
        tracep->declBus(c+93,"core imm_j_lo_hi", false,-1, 9,0);
        tracep->declBit(c+94,"core imm_j_lo_lo", false,-1);
        tracep->declBus(c+95,"core imm_j", false,-1, 19,0);
        tracep->declQuad(c+96,"core imm_j_sext_hi_hi", false,-1, 42,0);
        tracep->declQuad(c+98,"core imm_j_sext", false,-1, 63,0);
        tracep->declQuad(c+100,"core imm_zext", false,-1, 63,0);
        tracep->declBus(c+102,"core op1_sel", false,-1, 1,0);
        tracep->declBus(c+103,"core op2_sel", false,-1, 2,0);
        tracep->declArray(c+104,"core op2", false,-1, 75,0);
        tracep->declQuad(c+45,"core pc_mem", false,-1, 63,0);
        tracep->declBus(c+67,"core wb_sel_wb", false,-1, 1,0);
        tracep->declQuad(c+65,"core alu_out_wb", false,-1, 63,0);
        tracep->declQuad(c+63,"core pc_plus4_wb", false,-1, 63,0);
        tracep->declQuad(c+68,"core Dmemrdata_wb", false,-1, 63,0);
        tracep->declBus(c+107,"core pc_id", false,-1, 31,0);
        tracep->declQuad(c+50,"core alu_out_mem", false,-1, 63,0);
        tracep->declQuad(c+108,"core inst_wb", false,-1, 63,0);
        tracep->declBit(c+179,"core if_id_pl clock", false,-1);
        tracep->declBit(c+180,"core if_id_pl reset", false,-1);
        tracep->declQuad(c+1,"core if_id_pl io_pc", false,-1, 63,0);
        tracep->declBus(c+184,"core if_id_pl io_inst", false,-1, 31,0);
        tracep->declQuad(c+3,"core if_id_pl io_pc_o", false,-1, 63,0);
        tracep->declBus(c+5,"core if_id_pl io_inst_o", false,-1, 31,0);
        tracep->declQuad(c+3,"core if_id_pl pcR", false,-1, 63,0);
        tracep->declBus(c+5,"core if_id_pl instR", false,-1, 31,0);
        tracep->declBit(c+179,"core id_ex_pl clock", false,-1);
        tracep->declBit(c+180,"core id_ex_pl reset", false,-1);
        tracep->declQuad(c+6,"core id_ex_pl io_pc_and_inst_in_pc", false,-1, 63,0);
        tracep->declBus(c+5,"core id_ex_pl io_pc_and_inst_in_inst", false,-1, 31,0);
        tracep->declQuad(c+8,"core id_ex_pl io_pc_and_inst_out_pc", false,-1, 63,0);
        tracep->declBus(c+10,"core id_ex_pl io_pc_and_inst_out_inst", false,-1, 31,0);
        tracep->declBit(c+11,"core id_ex_pl io_inst_is_jump_in", false,-1);
        tracep->declBit(c+12,"core id_ex_pl io_inst_is_jump_o", false,-1);
        tracep->declQuad(c+13,"core id_ex_pl io_src_in_src1", false,-1, 63,0);
        tracep->declQuad(c+15,"core id_ex_pl io_src_in_src2", false,-1, 63,0);
        tracep->declQuad(c+17,"core id_ex_pl io_src_in_imm", false,-1, 63,0);
        tracep->declQuad(c+19,"core id_ex_pl io_src_out_src1", false,-1, 63,0);
        tracep->declQuad(c+21,"core id_ex_pl io_src_out_src2", false,-1, 63,0);
        tracep->declQuad(c+17,"core id_ex_pl io_src_out_imm", false,-1, 63,0);
        tracep->declBus(c+23,"core id_ex_pl io_wb_addr_in", false,-1, 4,0);
        tracep->declBus(c+24,"core id_ex_pl io_wb_addr_o", false,-1, 4,0);
        tracep->declQuad(c+25,"core id_ex_pl io_Dmem_wdata_in", false,-1, 63,0);
        tracep->declQuad(c+27,"core id_ex_pl io_Dmem_wdata_o", false,-1, 63,0);
        tracep->declBus(c+29,"core id_ex_pl io_exeu_op", false,-1, 4,0);
        tracep->declBus(c+30,"core id_ex_pl io_exeu_op_o", false,-1, 4,0);
        tracep->declBit(c+31,"core id_ex_pl io_mem_wen_io_mem_wen_in", false,-1);
        tracep->declBit(c+32,"core id_ex_pl io_mem_wen_io_mem_wen_o", false,-1);
        tracep->declBit(c+33,"core id_ex_pl io_reg_wen_io_reg_wen_in", false,-1);
        tracep->declBit(c+34,"core id_ex_pl io_reg_wen_io_reg_wen_o", false,-1);
        tracep->declBus(c+35,"core id_ex_pl io_wb_type_io_reg_wtype_in", false,-1, 1,0);
        tracep->declBus(c+36,"core id_ex_pl io_wb_type_io_reg_wtype_out", false,-1, 1,0);
        tracep->declQuad(c+8,"core id_ex_pl pcR", false,-1, 63,0);
        tracep->declBus(c+10,"core id_ex_pl instR", false,-1, 31,0);
        tracep->declQuad(c+17,"core id_ex_pl immR", false,-1, 63,0);
        tracep->declQuad(c+19,"core id_ex_pl src1R", false,-1, 63,0);
        tracep->declQuad(c+21,"core id_ex_pl src2R", false,-1, 63,0);
        tracep->declBus(c+24,"core id_ex_pl wb_addrR", false,-1, 4,0);
        tracep->declBus(c+30,"core id_ex_pl exeu_op_selR", false,-1, 4,0);
        tracep->declBit(c+32,"core id_ex_pl memwenR", false,-1);
        tracep->declBit(c+34,"core id_ex_pl wenR", false,-1);
        tracep->declBus(c+36,"core id_ex_pl wtypeR", false,-1, 1,0);
        tracep->declQuad(c+27,"core id_ex_pl Dmem_wdataR", false,-1, 63,0);
        tracep->declBit(c+12,"core id_ex_pl inst_is_j_flagR", false,-1);
        tracep->declBit(c+179,"core rf clock", false,-1);
        tracep->declBus(c+37,"core rf io_channel_raddr1", false,-1, 4,0);
        tracep->declBus(c+38,"core rf io_channel_raddr2", false,-1, 4,0);
        tracep->declQuad(c+39,"core rf io_channel_rdata1", false,-1, 63,0);
        tracep->declQuad(c+25,"core rf io_channel_rdata2", false,-1, 63,0);
        tracep->declBit(c+41,"core rf io_channel_wen", false,-1);
        tracep->declBus(c+42,"core rf io_channel_waddr", false,-1, 4,0);
        tracep->declQuad(c+43,"core rf io_channel_wdata", false,-1, 63,0);
        {int i; for (i=0; i<32; i++) {
                tracep->declQuad(c+110+i*2,"core rf rfR", true,(i+0), 63,0);}}
        tracep->declQuad(c+174,"core rf rfR_io_channel_rdata1_MPORT_data", false,-1, 63,0);
        tracep->declBus(c+37,"core rf rfR_io_channel_rdata1_MPORT_addr", false,-1, 4,0);
        tracep->declQuad(c+176,"core rf rfR_io_channel_rdata2_MPORT_data", false,-1, 63,0);
        tracep->declBus(c+38,"core rf rfR_io_channel_rdata2_MPORT_addr", false,-1, 4,0);
        tracep->declQuad(c+43,"core rf rfR_MPORT_data", false,-1, 63,0);
        tracep->declBus(c+42,"core rf rfR_MPORT_addr", false,-1, 4,0);
        tracep->declBit(c+198,"core rf rfR_MPORT_mask", false,-1);
        tracep->declBit(c+178,"core rf rfR_MPORT_en", false,-1);
        tracep->declBit(c+179,"core ex_mem_pl clock", false,-1);
        tracep->declBit(c+180,"core ex_mem_pl reset", false,-1);
        tracep->declQuad(c+8,"core ex_mem_pl io_pc_and_inst_in_pc", false,-1, 63,0);
        tracep->declBus(c+10,"core ex_mem_pl io_pc_and_inst_in_inst", false,-1, 31,0);
        tracep->declQuad(c+45,"core ex_mem_pl io_pc_and_inst_out_pc", false,-1, 63,0);
        tracep->declBus(c+47,"core ex_mem_pl io_pc_and_inst_out_inst", false,-1, 31,0);
        tracep->declQuad(c+48,"core ex_mem_pl io_alu_out_in", false,-1, 63,0);
        tracep->declQuad(c+50,"core ex_mem_pl io_alu_out_o", false,-1, 63,0);
        tracep->declBus(c+24,"core ex_mem_pl io_wb_addr_in", false,-1, 4,0);
        tracep->declBus(c+52,"core ex_mem_pl io_wb_addr_o", false,-1, 4,0);
        tracep->declQuad(c+27,"core ex_mem_pl io_Dmem_wdata_in", false,-1, 63,0);
        tracep->declQuad(c+53,"core ex_mem_pl io_Dmem_wdata_o", false,-1, 63,0);
        tracep->declBit(c+32,"core ex_mem_pl io_mem_wen_io_mem_wen_in", false,-1);
        tracep->declBit(c+55,"core ex_mem_pl io_mem_wen_io_mem_wen_o", false,-1);
        tracep->declBit(c+34,"core ex_mem_pl io_rf_wen_io_reg_wen_in", false,-1);
        tracep->declBit(c+56,"core ex_mem_pl io_rf_wen_io_reg_wen_o", false,-1);
        tracep->declBus(c+36,"core ex_mem_pl io_wb_sel_io_reg_wtype_in", false,-1, 1,0);
        tracep->declBus(c+57,"core ex_mem_pl io_wb_sel_io_reg_wtype_out", false,-1, 1,0);
        tracep->declQuad(c+45,"core ex_mem_pl pcR", false,-1, 63,0);
        tracep->declBus(c+47,"core ex_mem_pl instR", false,-1, 31,0);
        tracep->declBit(c+55,"core ex_mem_pl mem_wenR", false,-1);
        tracep->declBit(c+56,"core ex_mem_pl rf_wenR", false,-1);
        tracep->declBus(c+57,"core ex_mem_pl wb_selR", false,-1, 1,0);
        tracep->declBus(c+52,"core ex_mem_pl wb_addrR", false,-1, 4,0);
        tracep->declQuad(c+50,"core ex_mem_pl alu_outR", false,-1, 63,0);
        tracep->declQuad(c+53,"core ex_mem_pl Dmem_wdataR", false,-1, 63,0);
        tracep->declBit(c+179,"core mem_wb_pl clock", false,-1);
        tracep->declBit(c+180,"core mem_wb_pl reset", false,-1);
        tracep->declQuad(c+45,"core mem_wb_pl io_pc_and_inst_in_pc", false,-1, 63,0);
        tracep->declBus(c+47,"core mem_wb_pl io_pc_and_inst_in_inst", false,-1, 31,0);
        tracep->declQuad(c+58,"core mem_wb_pl io_pc_and_inst_o_pc", false,-1, 63,0);
        tracep->declBus(c+60,"core mem_wb_pl io_pc_and_inst_o_inst", false,-1, 31,0);
        tracep->declQuad(c+61,"core mem_wb_pl io_pc_plus4_in", false,-1, 63,0);
        tracep->declQuad(c+63,"core mem_wb_pl io_pc_plus4_o", false,-1, 63,0);
        tracep->declBus(c+52,"core mem_wb_pl io_wb_addr_in", false,-1, 4,0);
        tracep->declBus(c+42,"core mem_wb_pl io_wb_addr_o", false,-1, 4,0);
        tracep->declQuad(c+50,"core mem_wb_pl io_alu_out_in", false,-1, 63,0);
        tracep->declQuad(c+65,"core mem_wb_pl io_alu_out_o", false,-1, 63,0);
        tracep->declBit(c+56,"core mem_wb_pl io_rf_wen_io_reg_wen_in", false,-1);
        tracep->declBit(c+41,"core mem_wb_pl io_rf_wen_io_reg_wen_o", false,-1);
        tracep->declBus(c+57,"core mem_wb_pl io_wb_sel_io_reg_wtype_in", false,-1, 1,0);
        tracep->declBus(c+67,"core mem_wb_pl io_wb_sel_io_reg_wtype_out", false,-1, 1,0);
        tracep->declQuad(c+186,"core mem_wb_pl io_Dmem_rdata_in", false,-1, 63,0);
        tracep->declQuad(c+68,"core mem_wb_pl io_Dmem_rdata_o", false,-1, 63,0);
        tracep->declQuad(c+58,"core mem_wb_pl pcR", false,-1, 63,0);
        tracep->declBus(c+60,"core mem_wb_pl instR", false,-1, 31,0);
        tracep->declBus(c+42,"core mem_wb_pl wb_addrR", false,-1, 4,0);
        tracep->declBit(c+41,"core mem_wb_pl rf_wenR", false,-1);
        tracep->declBus(c+67,"core mem_wb_pl wb_selR", false,-1, 1,0);
        tracep->declQuad(c+68,"core mem_wb_pl Dmem_rdataR", false,-1, 63,0);
        tracep->declQuad(c+63,"core mem_wb_pl pcplus4R", false,-1, 63,0);
        tracep->declQuad(c+65,"core mem_wb_pl aluR", false,-1, 63,0);
        tracep->declBus(c+60,"core dpi inst_in", false,-1, 31,0);
    }
}

void Vcore___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) VL_ATTR_COLD;
void Vcore___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep);
void Vcore___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/);

void Vcore___024root__traceRegister(Vcore___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        tracep->addFullCb(&Vcore___024root__traceFullTop0, vlSelf);
        tracep->addChgCb(&Vcore___024root__traceChgTop0, vlSelf);
        tracep->addCleanupCb(&Vcore___024root__traceCleanup, vlSelf);
    }
}

void Vcore___024root__traceFullSub0(Vcore___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void Vcore___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) {
    Vcore___024root* const __restrict vlSelf = static_cast<Vcore___024root*>(voidSelf);
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        Vcore___024root__traceFullSub0((&vlSymsp->TOP), tracep);
    }
}

void Vcore___024root__traceFullSub0(Vcore___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VlWide<3>/*95:0*/ __Vtemp11;
    VlWide<3>/*95:0*/ __Vtemp12;
    VlWide<3>/*95:0*/ __Vtemp14;
    VlWide<3>/*95:0*/ __Vtemp21;
    VlWide<3>/*95:0*/ __Vtemp22;
    VlWide<3>/*95:0*/ __Vtemp23;
    VlWide<3>/*95:0*/ __Vtemp25;
    VlWide<3>/*95:0*/ __Vtemp31;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullQData(oldp+1,(vlSelf->core__DOT__pc_reg),64);
        tracep->fullQData(oldp+3,(vlSelf->core__DOT__if_id_pl__DOT__pcR),64);
        tracep->fullIData(oldp+5,(vlSelf->core__DOT__if_id_pl__DOT__instR),32);
        tracep->fullQData(oldp+6,((QData)((IData)(vlSelf->core__DOT__if_id_pl__DOT__pcR))),64);
        tracep->fullQData(oldp+8,(vlSelf->core__DOT__id_ex_pl__DOT__pcR),64);
        tracep->fullIData(oldp+10,(vlSelf->core__DOT__id_ex_pl__DOT__instR),32);
        tracep->fullBit(oldp+11,(((0x6fU == (0x7fU 
                                             & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                  | (0x67U == (0x707fU 
                                               & vlSelf->core__DOT__if_id_pl__DOT__instR)))));
        tracep->fullBit(oldp+12,(vlSelf->core__DOT__id_ex_pl__DOT__inst_is_j_flagR));
        tracep->fullQData(oldp+13,(((3U == (IData)(vlSelf->core__DOT__op1_sel))
                                     ? (QData)((IData)(
                                                       (0x1fU 
                                                        & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                           >> 0xfU))))
                                     : ((1U == (IData)(vlSelf->core__DOT__op1_sel))
                                         ? vlSelf->core__DOT__pc_reg
                                         : ((0U == (IData)(vlSelf->core__DOT__op1_sel))
                                             ? ((0U 
                                                 == 
                                                 (0x1fU 
                                                  & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                     >> 0xfU)))
                                                 ? 0ULL
                                                 : 
                                                vlSelf->core__DOT__rf__DOT__rfR
                                                [(0x1fU 
                                                  & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                     >> 0xfU))])
                                             : 0ULL)))),64);
        VL_EXTEND_WQ(76,64, __Vtemp11, ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                           >> 0x1fU)
                                           ? 0xfffffffffffffULL
                                           : 0ULL) 
                                         << 0xcU) | (QData)((IData)(
                                                                    ((0xfe0U 
                                                                      & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                         >> 0x14U)) 
                                                                     | (0x1fU 
                                                                        & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                           >> 7U)))))));
        VL_EXTEND_WQ(76,64, __Vtemp12, ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                           >> 0x1fU)
                                           ? 0x7ffffffffffULL
                                           : 0ULL) 
                                         << 0x15U) 
                                        | (QData)((IData)(
                                                          ((0x100000U 
                                                            & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                               >> 0xbU)) 
                                                           | ((0xff000U 
                                                               & vlSelf->core__DOT__if_id_pl__DOT__instR) 
                                                              | ((0xffcU 
                                                                  & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                     >> 0x13U)) 
                                                                 | (2U 
                                                                    & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                       >> 0x13U)))))))));
        VL_EXTEND_WQ(76,64, __Vtemp14, ((2U == (IData)(vlSelf->core__DOT__op2_sel))
                                         ? ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                               >> 0x1fU)
                                               ? 0xfffffffffffffULL
                                               : 0ULL) 
                                             << 0xcU) 
                                            | (QData)((IData)(
                                                              (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                               >> 0x14U))))
                                         : ((1U == (IData)(vlSelf->core__DOT__op2_sel))
                                             ? vlSelf->core__DOT__rf_io_channel_rdata2
                                             : 0ULL)));
        tracep->fullQData(oldp+15,((((QData)((IData)(
                                                     ((3U 
                                                       == (IData)(vlSelf->core__DOT__op2_sel))
                                                       ? 
                                                      __Vtemp11[1U]
                                                       : 
                                                      ((5U 
                                                        == (IData)(vlSelf->core__DOT__op2_sel))
                                                        ? 
                                                       __Vtemp12[1U]
                                                        : 
                                                       ((4U 
                                                         == (IData)(vlSelf->core__DOT__op2_sel))
                                                         ? 
                                                        (((IData)(
                                                                  ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                      >> 0x1fU)
                                                                      ? 0xfffffffffffULL
                                                                      : 0ULL) 
                                                                    << 0x14U) 
                                                                   | (QData)((IData)(
                                                                                (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                                >> 0xcU))))) 
                                                          >> 0x14U) 
                                                         | ((IData)(
                                                                    (((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                         >> 0x1fU)
                                                                         ? 0xfffffffffffULL
                                                                         : 0ULL) 
                                                                       << 0x14U) 
                                                                      | (QData)((IData)(
                                                                                (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                                >> 0xcU)))) 
                                                                     >> 0x20U)) 
                                                            << 0xcU))
                                                         : 
                                                        __Vtemp14[1U]))))) 
                                     << 0x20U) | (QData)((IData)(
                                                                 ((3U 
                                                                   == (IData)(vlSelf->core__DOT__op2_sel))
                                                                   ? 
                                                                  __Vtemp11[0U]
                                                                   : 
                                                                  ((5U 
                                                                    == (IData)(vlSelf->core__DOT__op2_sel))
                                                                    ? 
                                                                   __Vtemp12[0U]
                                                                    : 
                                                                   ((4U 
                                                                     == (IData)(vlSelf->core__DOT__op2_sel))
                                                                     ? 
                                                                    ((IData)(
                                                                             ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                                >> 0x1fU)
                                                                                 ? 0xfffffffffffULL
                                                                                 : 0ULL) 
                                                                               << 0x14U) 
                                                                              | (QData)((IData)(
                                                                                (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                                >> 0xcU))))) 
                                                                     << 0xcU)
                                                                     : 
                                                                    __Vtemp14[0U]))))))),64);
        tracep->fullQData(oldp+17,(vlSelf->core__DOT__id_ex_pl__DOT__immR),64);
        tracep->fullQData(oldp+19,(vlSelf->core__DOT__id_ex_pl__DOT__src1R),64);
        tracep->fullQData(oldp+21,(vlSelf->core__DOT__id_ex_pl__DOT__src2R),64);
        tracep->fullCData(oldp+23,((0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                             >> 7U))),5);
        tracep->fullCData(oldp+24,(vlSelf->core__DOT__id_ex_pl__DOT__wb_addrR),5);
        tracep->fullQData(oldp+25,(vlSelf->core__DOT__rf_io_channel_rdata2),64);
        tracep->fullQData(oldp+27,(vlSelf->core__DOT__id_ex_pl__DOT__Dmem_wdataR),64);
        tracep->fullCData(oldp+29,(((0x13U == (0x707fU 
                                               & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                     ? 1U : ((0x33U 
                                              == (0xfe00707fU 
                                                  & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                              ? 1U : 
                                             ((0x40000033U 
                                               == (0xfe00707fU 
                                                   & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                               ? 2U
                                               : ((0x37U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                   ? 1U
                                                   : 
                                                  ((0x6fU 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                    ? 1U
                                                    : 
                                                   ((0x67U 
                                                     == 
                                                     (0x707fU 
                                                      & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                     ? 0x11U
                                                     : 
                                                    ((0x17U 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                      ? 1U
                                                      : 
                                                     ((0x3023U 
                                                       == 
                                                       (0x707fU 
                                                        & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                       ? 1U
                                                       : 
                                                      ((0x63U 
                                                        == 
                                                        (0x707fU 
                                                         & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                        ? 0xbU
                                                        : 0U)))))))))),5);
        tracep->fullCData(oldp+30,(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR),5);
        tracep->fullBit(oldp+31,(((0x13U != (0x707fU 
                                             & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                  & ((0x33U != (0xfe00707fU 
                                                & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                     & ((0x40000033U 
                                         != (0xfe00707fU 
                                             & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                        & ((0x37U != 
                                            (0x7fU 
                                             & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                           & ((0x6fU 
                                               != (0x7fU 
                                                   & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                              & ((0x67U 
                                                  != 
                                                  (0x707fU 
                                                   & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                 & ((0x17U 
                                                     != 
                                                     (0x7fU 
                                                      & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                    & (0x3023U 
                                                       == 
                                                       (0x707fU 
                                                        & vlSelf->core__DOT__if_id_pl__DOT__instR)))))))))));
        tracep->fullBit(oldp+32,(vlSelf->core__DOT__id_ex_pl__DOT__memwenR));
        tracep->fullBit(oldp+33,(((0x13U == (0x707fU 
                                             & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                  | ((0x33U == (0xfe00707fU 
                                                & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                     | ((0x40000033U 
                                         == (0xfe00707fU 
                                             & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                        | ((0x37U == 
                                            (0x7fU 
                                             & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                           | ((0x6fU 
                                               == (0x7fU 
                                                   & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                              | ((0x67U 
                                                  == 
                                                  (0x707fU 
                                                   & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                 | (0x17U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->core__DOT__if_id_pl__DOT__instR))))))))));
        tracep->fullBit(oldp+34,(vlSelf->core__DOT__id_ex_pl__DOT__wenR));
        tracep->fullCData(oldp+35,(((0x13U == (0x707fU 
                                               & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                     ? 1U : ((0x33U 
                                              == (0xfe00707fU 
                                                  & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                              ? 1U : 
                                             ((0x40000033U 
                                               == (0xfe00707fU 
                                                   & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                               ? 1U
                                               : ((0x37U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                   ? 1U
                                                   : 
                                                  ((0x6fU 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                    ? 2U
                                                    : 
                                                   ((0x67U 
                                                     == 
                                                     (0x707fU 
                                                      & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                     ? 2U
                                                     : 
                                                    ((0x17U 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                      ? 1U
                                                      : 0U)))))))),2);
        tracep->fullCData(oldp+36,(vlSelf->core__DOT__id_ex_pl__DOT__wtypeR),2);
        tracep->fullCData(oldp+37,((0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                             >> 0xfU))),5);
        tracep->fullCData(oldp+38,((0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                             >> 0x14U))),5);
        tracep->fullQData(oldp+39,(((0U == (0x1fU & 
                                            (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                             >> 0xfU)))
                                     ? 0ULL : vlSelf->core__DOT__rf__DOT__rfR
                                    [(0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                               >> 0xfU))])),64);
        tracep->fullBit(oldp+41,(vlSelf->core__DOT__mem_wb_pl__DOT__rf_wenR));
        tracep->fullCData(oldp+42,(vlSelf->core__DOT__mem_wb_pl__DOT__wb_addrR),5);
        tracep->fullQData(oldp+43,(((3U == (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR))
                                     ? vlSelf->core__DOT__mem_wb_pl__DOT__Dmem_rdataR
                                     : vlSelf->core__DOT___wb_data_T_3)),64);
        tracep->fullQData(oldp+45,(vlSelf->core__DOT__ex_mem_pl__DOT__pcR),64);
        tracep->fullIData(oldp+47,(vlSelf->core__DOT__ex_mem_pl__DOT__instR),32);
        tracep->fullQData(oldp+48,(((5U == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                     ? vlSelf->core__DOT___alu_out_T_10
                                     : vlSelf->core__DOT___alu_out_T_20)),64);
        tracep->fullQData(oldp+50,(vlSelf->core__DOT__ex_mem_pl__DOT__alu_outR),64);
        tracep->fullCData(oldp+52,(vlSelf->core__DOT__ex_mem_pl__DOT__wb_addrR),5);
        tracep->fullQData(oldp+53,(vlSelf->core__DOT__ex_mem_pl__DOT__Dmem_wdataR),64);
        tracep->fullBit(oldp+55,(vlSelf->core__DOT__ex_mem_pl__DOT__mem_wenR));
        tracep->fullBit(oldp+56,(vlSelf->core__DOT__ex_mem_pl__DOT__rf_wenR));
        tracep->fullCData(oldp+57,(vlSelf->core__DOT__ex_mem_pl__DOT__wb_selR),2);
        tracep->fullQData(oldp+58,(vlSelf->core__DOT__mem_wb_pl__DOT__pcR),64);
        tracep->fullIData(oldp+60,(vlSelf->core__DOT__mem_wb_pl__DOT__instR),32);
        tracep->fullQData(oldp+61,((4ULL + vlSelf->core__DOT__ex_mem_pl__DOT__pcR)),64);
        tracep->fullQData(oldp+63,(vlSelf->core__DOT__mem_wb_pl__DOT__pcplus4R),64);
        tracep->fullQData(oldp+65,(vlSelf->core__DOT__mem_wb_pl__DOT__aluR),64);
        tracep->fullCData(oldp+67,(vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR),2);
        tracep->fullQData(oldp+68,(vlSelf->core__DOT__mem_wb_pl__DOT__Dmem_rdataR),64);
        tracep->fullBit(oldp+70,(vlSelf->core__DOT__ImemCenR));
        tracep->fullQData(oldp+71,((4ULL + vlSelf->core__DOT__pc_reg)),64);
        tracep->fullBit(oldp+73,((1U & ((0xfU == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                         ? (IData)(vlSelf->core__DOT___hi_T_11)
                                         : ((0x10U 
                                             == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                             ? (~ (IData)(vlSelf->core__DOT___hi_T_11))
                                             : ((0xeU 
                                                 == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                                 ? 
                                                VL_GTES_IQQ(1,64,64, vlSelf->core__DOT__id_ex_pl__DOT__src1R, vlSelf->core__DOT__id_ex_pl__DOT__src2R)
                                                 : 
                                                ((0xdU 
                                                  == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                                  ? 
                                                 VL_LTS_IQQ(1,64,64, vlSelf->core__DOT__id_ex_pl__DOT__src1R, vlSelf->core__DOT__id_ex_pl__DOT__src2R)
                                                  : 
                                                 ((0xcU 
                                                   == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                                   ? 
                                                  (vlSelf->core__DOT__id_ex_pl__DOT__src1R 
                                                   != vlSelf->core__DOT__id_ex_pl__DOT__src2R)
                                                   : 
                                                  ((0xbU 
                                                    == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR)) 
                                                   & (vlSelf->core__DOT__id_ex_pl__DOT__src1R 
                                                      == vlSelf->core__DOT__id_ex_pl__DOT__src2R))))))))));
        tracep->fullQData(oldp+74,((vlSelf->core__DOT__id_ex_pl__DOT__pcR 
                                    + vlSelf->core__DOT__id_ex_pl__DOT__immR)),64);
        tracep->fullSData(oldp+76,((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                    >> 0x14U)),12);
        tracep->fullQData(oldp+77,(((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                     >> 0x1fU) ? 0xfffffffffffffULL
                                     : 0ULL)),52);
        tracep->fullQData(oldp+79,(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                       >> 0x1fU) ? 0xfffffffffffffULL
                                       : 0ULL) << 0xcU) 
                                    | (QData)((IData)(
                                                      (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                       >> 0x14U))))),64);
        tracep->fullCData(oldp+81,((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                    >> 0x19U)),7);
        tracep->fullSData(oldp+82,(((0xfe0U & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                               >> 0x14U)) 
                                    | (0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                >> 7U)))),12);
        tracep->fullQData(oldp+83,(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                       >> 0x1fU) ? 0xfffffffffffffULL
                                       : 0ULL) << 0xcU) 
                                    | (QData)((IData)(
                                                      ((0xfe0U 
                                                        & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                           >> 0x14U)) 
                                                       | (0x1fU 
                                                          & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                             >> 7U))))))),64);
        tracep->fullIData(oldp+85,((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                    >> 0xcU)),20);
        tracep->fullQData(oldp+86,(((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                     >> 0x1fU) ? 0xfffffffffffULL
                                     : 0ULL)),44);
        __Vtemp21[0U] = ((IData)(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                     >> 0x1fU) ? 0xfffffffffffULL
                                     : 0ULL) << 0x14U) 
                                  | (QData)((IData)(
                                                    (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                     >> 0xcU))))) 
                         << 0xcU);
        __Vtemp21[1U] = (((IData)(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                      >> 0x1fU) ? 0xfffffffffffULL
                                      : 0ULL) << 0x14U) 
                                   | (QData)((IData)(
                                                     (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                      >> 0xcU))))) 
                          >> 0x14U) | ((IData)(((((
                                                   (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                    >> 0x1fU)
                                                    ? 0xfffffffffffULL
                                                    : 0ULL) 
                                                  << 0x14U) 
                                                 | (QData)((IData)(
                                                                   (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                    >> 0xcU)))) 
                                                >> 0x20U)) 
                                       << 0xcU));
        __Vtemp21[2U] = ((IData)((((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                      >> 0x1fU) ? 0xfffffffffffULL
                                      : 0ULL) << 0x14U) 
                                   | (QData)((IData)(
                                                     (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                      >> 0xcU)))) 
                                  >> 0x20U)) >> 0x14U);
        tracep->fullWData(oldp+88,(__Vtemp21),76);
        tracep->fullBit(oldp+91,((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                  >> 0x1fU)));
        tracep->fullCData(oldp+92,((0xffU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                             >> 0xcU))),8);
        tracep->fullSData(oldp+93,((0x3ffU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                              >> 0x15U))),10);
        tracep->fullBit(oldp+94,((1U & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                        >> 0x14U))));
        tracep->fullIData(oldp+95,(((0x80000U & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                 >> 0xcU)) 
                                    | ((0x7f800U & 
                                        (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                         >> 1U)) | 
                                       (0x7ffU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                  >> 0x14U))))),20);
        tracep->fullQData(oldp+96,(((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                     >> 0x1fU) ? 0x7ffffffffffULL
                                     : 0ULL)),43);
        tracep->fullQData(oldp+98,(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                       >> 0x1fU) ? 0x7ffffffffffULL
                                       : 0ULL) << 0x15U) 
                                    | (QData)((IData)(
                                                      ((0x100000U 
                                                        & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                           >> 0xbU)) 
                                                       | ((0xff000U 
                                                           & vlSelf->core__DOT__if_id_pl__DOT__instR) 
                                                          | ((0xffcU 
                                                              & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                 >> 0x13U)) 
                                                             | (2U 
                                                                & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                   >> 0x13U))))))))),64);
        tracep->fullQData(oldp+100,((QData)((IData)(
                                                    (0x1fU 
                                                     & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                        >> 0xfU))))),64);
        tracep->fullCData(oldp+102,(vlSelf->core__DOT__op1_sel),2);
        tracep->fullCData(oldp+103,(vlSelf->core__DOT__op2_sel),3);
        VL_EXTEND_WQ(76,64, __Vtemp22, ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                           >> 0x1fU)
                                           ? 0xfffffffffffffULL
                                           : 0ULL) 
                                         << 0xcU) | (QData)((IData)(
                                                                    ((0xfe0U 
                                                                      & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                         >> 0x14U)) 
                                                                     | (0x1fU 
                                                                        & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                           >> 7U)))))));
        VL_EXTEND_WQ(76,64, __Vtemp23, ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                           >> 0x1fU)
                                           ? 0x7ffffffffffULL
                                           : 0ULL) 
                                         << 0x15U) 
                                        | (QData)((IData)(
                                                          ((0x100000U 
                                                            & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                               >> 0xbU)) 
                                                           | ((0xff000U 
                                                               & vlSelf->core__DOT__if_id_pl__DOT__instR) 
                                                              | ((0xffcU 
                                                                  & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                     >> 0x13U)) 
                                                                 | (2U 
                                                                    & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                       >> 0x13U)))))))));
        VL_EXTEND_WQ(76,64, __Vtemp25, ((2U == (IData)(vlSelf->core__DOT__op2_sel))
                                         ? ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                               >> 0x1fU)
                                               ? 0xfffffffffffffULL
                                               : 0ULL) 
                                             << 0xcU) 
                                            | (QData)((IData)(
                                                              (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                               >> 0x14U))))
                                         : ((1U == (IData)(vlSelf->core__DOT__op2_sel))
                                             ? vlSelf->core__DOT__rf_io_channel_rdata2
                                             : 0ULL)));
        if ((3U == (IData)(vlSelf->core__DOT__op2_sel))) {
            __Vtemp31[0U] = __Vtemp22[0U];
            __Vtemp31[1U] = __Vtemp22[1U];
            __Vtemp31[2U] = __Vtemp22[2U];
        } else {
            __Vtemp31[0U] = ((5U == (IData)(vlSelf->core__DOT__op2_sel))
                              ? __Vtemp23[0U] : ((4U 
                                                  == (IData)(vlSelf->core__DOT__op2_sel))
                                                  ? 
                                                 ((IData)(
                                                          ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                              >> 0x1fU)
                                                              ? 0xfffffffffffULL
                                                              : 0ULL) 
                                                            << 0x14U) 
                                                           | (QData)((IData)(
                                                                             (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                              >> 0xcU))))) 
                                                  << 0xcU)
                                                  : 
                                                 __Vtemp25[0U]));
            __Vtemp31[1U] = ((5U == (IData)(vlSelf->core__DOT__op2_sel))
                              ? __Vtemp23[1U] : ((4U 
                                                  == (IData)(vlSelf->core__DOT__op2_sel))
                                                  ? 
                                                 (((IData)(
                                                           ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                               >> 0x1fU)
                                                               ? 0xfffffffffffULL
                                                               : 0ULL) 
                                                             << 0x14U) 
                                                            | (QData)((IData)(
                                                                              (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                               >> 0xcU))))) 
                                                   >> 0x14U) 
                                                  | ((IData)(
                                                             (((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                  >> 0x1fU)
                                                                  ? 0xfffffffffffULL
                                                                  : 0ULL) 
                                                                << 0x14U) 
                                                               | (QData)((IData)(
                                                                                (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                                >> 0xcU)))) 
                                                              >> 0x20U)) 
                                                     << 0xcU))
                                                  : 
                                                 __Vtemp25[1U]));
            __Vtemp31[2U] = ((5U == (IData)(vlSelf->core__DOT__op2_sel))
                              ? __Vtemp23[2U] : ((4U 
                                                  == (IData)(vlSelf->core__DOT__op2_sel))
                                                  ? 
                                                 ((IData)(
                                                          (((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                               >> 0x1fU)
                                                               ? 0xfffffffffffULL
                                                               : 0ULL) 
                                                             << 0x14U) 
                                                            | (QData)((IData)(
                                                                              (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                               >> 0xcU)))) 
                                                           >> 0x20U)) 
                                                  >> 0x14U)
                                                  : 
                                                 __Vtemp25[2U]));
        }
        tracep->fullWData(oldp+104,(__Vtemp31),76);
        tracep->fullIData(oldp+107,((IData)(vlSelf->core__DOT__if_id_pl__DOT__pcR)),32);
        tracep->fullQData(oldp+108,((QData)((IData)(vlSelf->core__DOT__mem_wb_pl__DOT__instR))),64);
        tracep->fullQData(oldp+110,(vlSelf->core__DOT__rf__DOT__rfR[0]),64);
        tracep->fullQData(oldp+112,(vlSelf->core__DOT__rf__DOT__rfR[1]),64);
        tracep->fullQData(oldp+114,(vlSelf->core__DOT__rf__DOT__rfR[2]),64);
        tracep->fullQData(oldp+116,(vlSelf->core__DOT__rf__DOT__rfR[3]),64);
        tracep->fullQData(oldp+118,(vlSelf->core__DOT__rf__DOT__rfR[4]),64);
        tracep->fullQData(oldp+120,(vlSelf->core__DOT__rf__DOT__rfR[5]),64);
        tracep->fullQData(oldp+122,(vlSelf->core__DOT__rf__DOT__rfR[6]),64);
        tracep->fullQData(oldp+124,(vlSelf->core__DOT__rf__DOT__rfR[7]),64);
        tracep->fullQData(oldp+126,(vlSelf->core__DOT__rf__DOT__rfR[8]),64);
        tracep->fullQData(oldp+128,(vlSelf->core__DOT__rf__DOT__rfR[9]),64);
        tracep->fullQData(oldp+130,(vlSelf->core__DOT__rf__DOT__rfR[10]),64);
        tracep->fullQData(oldp+132,(vlSelf->core__DOT__rf__DOT__rfR[11]),64);
        tracep->fullQData(oldp+134,(vlSelf->core__DOT__rf__DOT__rfR[12]),64);
        tracep->fullQData(oldp+136,(vlSelf->core__DOT__rf__DOT__rfR[13]),64);
        tracep->fullQData(oldp+138,(vlSelf->core__DOT__rf__DOT__rfR[14]),64);
        tracep->fullQData(oldp+140,(vlSelf->core__DOT__rf__DOT__rfR[15]),64);
        tracep->fullQData(oldp+142,(vlSelf->core__DOT__rf__DOT__rfR[16]),64);
        tracep->fullQData(oldp+144,(vlSelf->core__DOT__rf__DOT__rfR[17]),64);
        tracep->fullQData(oldp+146,(vlSelf->core__DOT__rf__DOT__rfR[18]),64);
        tracep->fullQData(oldp+148,(vlSelf->core__DOT__rf__DOT__rfR[19]),64);
        tracep->fullQData(oldp+150,(vlSelf->core__DOT__rf__DOT__rfR[20]),64);
        tracep->fullQData(oldp+152,(vlSelf->core__DOT__rf__DOT__rfR[21]),64);
        tracep->fullQData(oldp+154,(vlSelf->core__DOT__rf__DOT__rfR[22]),64);
        tracep->fullQData(oldp+156,(vlSelf->core__DOT__rf__DOT__rfR[23]),64);
        tracep->fullQData(oldp+158,(vlSelf->core__DOT__rf__DOT__rfR[24]),64);
        tracep->fullQData(oldp+160,(vlSelf->core__DOT__rf__DOT__rfR[25]),64);
        tracep->fullQData(oldp+162,(vlSelf->core__DOT__rf__DOT__rfR[26]),64);
        tracep->fullQData(oldp+164,(vlSelf->core__DOT__rf__DOT__rfR[27]),64);
        tracep->fullQData(oldp+166,(vlSelf->core__DOT__rf__DOT__rfR[28]),64);
        tracep->fullQData(oldp+168,(vlSelf->core__DOT__rf__DOT__rfR[29]),64);
        tracep->fullQData(oldp+170,(vlSelf->core__DOT__rf__DOT__rfR[30]),64);
        tracep->fullQData(oldp+172,(vlSelf->core__DOT__rf__DOT__rfR[31]),64);
        tracep->fullQData(oldp+174,(vlSelf->core__DOT__rf__DOT__rfR
                                    [(0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                               >> 0xfU))]),64);
        tracep->fullQData(oldp+176,(vlSelf->core__DOT__rf__DOT__rfR
                                    [(0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                               >> 0x14U))]),64);
        tracep->fullBit(oldp+178,(((IData)(vlSelf->core__DOT__mem_wb_pl__DOT__rf_wenR) 
                                   & (0U != (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_addrR)))));
        tracep->fullBit(oldp+179,(vlSelf->clock));
        tracep->fullBit(oldp+180,(vlSelf->reset));
        tracep->fullBit(oldp+181,(vlSelf->io_Imemio_cen));
        tracep->fullQData(oldp+182,(vlSelf->io_Imemio_pc),64);
        tracep->fullIData(oldp+184,(vlSelf->io_Imemio_inst),32);
        tracep->fullIData(oldp+185,(vlSelf->io_DMemio_addr),32);
        tracep->fullQData(oldp+186,(vlSelf->io_DMemio_rdata),64);
        tracep->fullBit(oldp+188,(vlSelf->io_DMemio_wen));
        tracep->fullQData(oldp+189,(vlSelf->io_DMemio_wdata),64);
        tracep->fullBit(oldp+191,(vlSelf->io_Deubug_Debug_rf_wen));
        tracep->fullCData(oldp+192,(vlSelf->io_Deubug_Debug_rf_waddr),5);
        tracep->fullQData(oldp+193,(vlSelf->io_Deubug_Debug_rf_wdata),64);
        tracep->fullQData(oldp+195,(vlSelf->io_Deubug_Debug_pc),64);
        tracep->fullIData(oldp+197,(vlSelf->io_Deubug_Debug_inst),32);
        tracep->fullBit(oldp+198,(1U));
    }
}
