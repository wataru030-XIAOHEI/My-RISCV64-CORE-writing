// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcore.h for the primary calling header

#include "Vcore___024root.h"
#include "Vcore__Syms.h"

#include "verilated_dpi.h"

//==========


void Vcore___024root___ctor_var_reset(Vcore___024root* vlSelf);

Vcore___024root::Vcore___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    Vcore___024root___ctor_var_reset(this);
}

void Vcore___024root::__Vconfigure(Vcore__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

Vcore___024root::~Vcore___024root() {
}

void Vcore___024root____Vdpiimwrap_core__DOT__dpi__DOT__is_ebreak_TOP(IData/*31:0*/ inst, CData/*0:0*/ &is_ebreak__Vfuncrtn);

void Vcore___024root___settle__TOP__2(Vcore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore___024root___settle__TOP__2\n"); );
    // Variables
    QData/*63:0*/ core__DOT___alu_out_T_7;
    // Body
    vlSelf->io_Imemio_cen = vlSelf->core__DOT__ImemCenR;
    vlSelf->io_DMemio_wen = vlSelf->core__DOT__ex_mem_pl__DOT__mem_wenR;
    vlSelf->io_DMemio_wdata = vlSelf->core__DOT__ex_mem_pl__DOT__Dmem_wdataR;
    vlSelf->io_Deubug_Debug_pc = vlSelf->core__DOT__mem_wb_pl__DOT__pcR;
    vlSelf->io_Deubug_Debug_inst = vlSelf->core__DOT__mem_wb_pl__DOT__instR;
    Vcore___024root____Vdpiimwrap_core__DOT__dpi__DOT__is_ebreak_TOP(vlSelf->core__DOT__mem_wb_pl__DOT__instR, vlSelf->__Vfunc_core__DOT__dpi__DOT__is_ebreak__0__Vfuncout);
    if (VL_UNLIKELY(vlSelf->__Vfunc_core__DOT__dpi__DOT__is_ebreak__0__Vfuncout)) {
        VL_WRITEF("\n\033[1;34mebreak! inst : 0x%016x\n\033[0m\n\n",
                  32,vlSelf->core__DOT__mem_wb_pl__DOT__instR);
        VL_FINISH_MT("src/vsrc/dpi.v", 8, "");
    }
    vlSelf->io_DMemio_addr = (IData)(vlSelf->core__DOT__ex_mem_pl__DOT__alu_outR);
    vlSelf->io_Deubug_Debug_rf_wen = vlSelf->core__DOT__mem_wb_pl__DOT__rf_wenR;
    vlSelf->io_Deubug_Debug_rf_waddr = vlSelf->core__DOT__mem_wb_pl__DOT__wb_addrR;
    vlSelf->core__DOT__id_ex_pl_io_src_in_imm = vlSelf->core__DOT__id_ex_pl__DOT__immR;
    vlSelf->core__DOT___hi_T_11 = (vlSelf->core__DOT__id_ex_pl__DOT__src1R 
                                   < vlSelf->core__DOT__id_ex_pl__DOT__src2R);
    vlSelf->core__DOT___alu_out_T_10 = (vlSelf->core__DOT__id_ex_pl__DOT__src1R 
                                        ^ vlSelf->core__DOT__id_ex_pl__DOT__src2R);
    vlSelf->core__DOT___wb_data_T_3 = ((2U == (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR))
                                        ? vlSelf->core__DOT__mem_wb_pl__DOT__pcplus4R
                                        : ((1U == (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR))
                                            ? vlSelf->core__DOT__mem_wb_pl__DOT__aluR
                                            : 0ULL));
    core__DOT___alu_out_T_7 = (vlSelf->core__DOT__id_ex_pl__DOT__src1R 
                               + vlSelf->core__DOT__id_ex_pl__DOT__src2R);
    vlSelf->core__DOT__pc_plus4 = (4ULL + vlSelf->core__DOT__pc_reg);
    vlSelf->io_Imemio_pc = vlSelf->core__DOT__pc_reg;
    if ((0x13U == (0x707fU & vlSelf->core__DOT__if_id_pl__DOT__instR))) {
        vlSelf->core__DOT__op1_sel = 0U;
        vlSelf->core__DOT__op2_sel = 2U;
    } else {
        vlSelf->core__DOT__op1_sel = ((0x33U == (0xfe00707fU 
                                                 & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                       ? 0U : ((0x40000033U 
                                                == 
                                                (0xfe00707fU 
                                                 & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                ? 0U
                                                : (
                                                   (0x37U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                    ? 2U
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
                                                      ? 0U
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
                                                        ? 0U
                                                        : 
                                                       ((0x63U 
                                                         == 
                                                         (0x707fU 
                                                          & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                         ? 0U
                                                         : 2U))))))));
        vlSelf->core__DOT__op2_sel = ((0x33U == (0xfe00707fU 
                                                 & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                       ? 1U : ((0x40000033U 
                                                == 
                                                (0xfe00707fU 
                                                 & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                ? 1U
                                                : (
                                                   (0x37U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                    ? 4U
                                                    : 
                                                   ((0x6fU 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                     ? 5U
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
                                                       ? 4U
                                                       : 
                                                      ((0x3023U 
                                                        == 
                                                        (0x707fU 
                                                         & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                        ? 3U
                                                        : 
                                                       ((0x63U 
                                                         == 
                                                         (0x707fU 
                                                          & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                         ? 1U
                                                         : 0U))))))));
    }
    vlSelf->core__DOT__rf_io_channel_rdata2 = ((0U 
                                                == 
                                                (0x1fU 
                                                 & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                    >> 0x14U)))
                                                ? 0ULL
                                                : vlSelf->core__DOT__rf__DOT__rfR
                                               [(0x1fU 
                                                 & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                    >> 0x14U))]);
    vlSelf->io_Deubug_Debug_rf_wdata = ((3U == (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR))
                                         ? vlSelf->core__DOT__mem_wb_pl__DOT__Dmem_rdataR
                                         : vlSelf->core__DOT___wb_data_T_3);
    vlSelf->core__DOT___alu_out_T_20 = ((0x11U == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                         ? (0xfffffffffffffffeULL 
                                            & core__DOT___alu_out_T_7)
                                         : ((4U == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                             ? (vlSelf->core__DOT__id_ex_pl__DOT__src1R 
                                                | vlSelf->core__DOT__id_ex_pl__DOT__src2R)
                                             : ((3U 
                                                 == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                                 ? 
                                                (vlSelf->core__DOT__id_ex_pl__DOT__src1R 
                                                 & vlSelf->core__DOT__id_ex_pl__DOT__src2R)
                                                 : 
                                                ((2U 
                                                  == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                                  ? 
                                                 (vlSelf->core__DOT__id_ex_pl__DOT__src1R 
                                                  - vlSelf->core__DOT__id_ex_pl__DOT__src2R)
                                                  : 
                                                 ((1U 
                                                   == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                                   ? core__DOT___alu_out_T_7
                                                   : 0ULL)))));
}

void Vcore___024root___eval_initial(Vcore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

void Vcore___024root___eval_settle(Vcore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore___024root___eval_settle\n"); );
    // Body
    Vcore___024root___settle__TOP__2(vlSelf);
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
}

void Vcore___024root___final(Vcore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore___024root___final\n"); );
}

void Vcore___024root___ctor_var_reset(Vcore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_Imemio_cen = VL_RAND_RESET_I(1);
    vlSelf->io_Imemio_pc = VL_RAND_RESET_Q(64);
    vlSelf->io_Imemio_inst = VL_RAND_RESET_I(32);
    vlSelf->io_DMemio_addr = VL_RAND_RESET_I(32);
    vlSelf->io_DMemio_rdata = VL_RAND_RESET_Q(64);
    vlSelf->io_DMemio_wen = VL_RAND_RESET_I(1);
    vlSelf->io_DMemio_wdata = VL_RAND_RESET_Q(64);
    vlSelf->io_Deubug_Debug_rf_wen = VL_RAND_RESET_I(1);
    vlSelf->io_Deubug_Debug_rf_waddr = VL_RAND_RESET_I(5);
    vlSelf->io_Deubug_Debug_rf_wdata = VL_RAND_RESET_Q(64);
    vlSelf->io_Deubug_Debug_pc = VL_RAND_RESET_Q(64);
    vlSelf->io_Deubug_Debug_inst = VL_RAND_RESET_I(32);
    vlSelf->core__DOT__id_ex_pl_io_src_in_imm = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__rf_io_channel_rdata2 = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__ImemCenR = VL_RAND_RESET_I(1);
    vlSelf->core__DOT__pc_reg = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__pc_plus4 = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT___hi_T_11 = VL_RAND_RESET_I(1);
    vlSelf->core__DOT___alu_out_T_10 = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT___alu_out_T_20 = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__op1_sel = VL_RAND_RESET_I(2);
    vlSelf->core__DOT__op2_sel = VL_RAND_RESET_I(3);
    vlSelf->core__DOT___wb_data_T_3 = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__if_id_pl__DOT__pcR = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__if_id_pl__DOT__instR = VL_RAND_RESET_I(32);
    vlSelf->core__DOT__id_ex_pl__DOT__pcR = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__id_ex_pl__DOT__instR = VL_RAND_RESET_I(32);
    vlSelf->core__DOT__id_ex_pl__DOT__immR = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__id_ex_pl__DOT__src1R = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__id_ex_pl__DOT__src2R = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__id_ex_pl__DOT__wb_addrR = VL_RAND_RESET_I(5);
    vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR = VL_RAND_RESET_I(5);
    vlSelf->core__DOT__id_ex_pl__DOT__memwenR = VL_RAND_RESET_I(1);
    vlSelf->core__DOT__id_ex_pl__DOT__wenR = VL_RAND_RESET_I(1);
    vlSelf->core__DOT__id_ex_pl__DOT__wtypeR = VL_RAND_RESET_I(2);
    vlSelf->core__DOT__id_ex_pl__DOT__Dmem_wdataR = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__id_ex_pl__DOT__inst_is_j_flagR = VL_RAND_RESET_I(1);
    for (int __Vi0=0; __Vi0<32; ++__Vi0) {
        vlSelf->core__DOT__rf__DOT__rfR[__Vi0] = VL_RAND_RESET_Q(64);
    }
    vlSelf->core__DOT__ex_mem_pl__DOT__pcR = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__ex_mem_pl__DOT__instR = VL_RAND_RESET_I(32);
    vlSelf->core__DOT__ex_mem_pl__DOT__mem_wenR = VL_RAND_RESET_I(1);
    vlSelf->core__DOT__ex_mem_pl__DOT__rf_wenR = VL_RAND_RESET_I(1);
    vlSelf->core__DOT__ex_mem_pl__DOT__wb_selR = VL_RAND_RESET_I(2);
    vlSelf->core__DOT__ex_mem_pl__DOT__wb_addrR = VL_RAND_RESET_I(5);
    vlSelf->core__DOT__ex_mem_pl__DOT__alu_outR = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__ex_mem_pl__DOT__Dmem_wdataR = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__mem_wb_pl__DOT__pcR = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__mem_wb_pl__DOT__instR = VL_RAND_RESET_I(32);
    vlSelf->core__DOT__mem_wb_pl__DOT__wb_addrR = VL_RAND_RESET_I(5);
    vlSelf->core__DOT__mem_wb_pl__DOT__rf_wenR = VL_RAND_RESET_I(1);
    vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR = VL_RAND_RESET_I(2);
    vlSelf->core__DOT__mem_wb_pl__DOT__Dmem_rdataR = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__mem_wb_pl__DOT__pcplus4R = VL_RAND_RESET_Q(64);
    vlSelf->core__DOT__mem_wb_pl__DOT__aluR = VL_RAND_RESET_Q(64);
    vlSelf->__Vfunc_core__DOT__dpi__DOT__is_ebreak__0__Vfuncout = 0;
    for (int __Vi0=0; __Vi0<2; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = VL_RAND_RESET_I(1);
    }
}
