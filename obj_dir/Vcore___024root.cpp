// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcore.h for the primary calling header

#include "Vcore___024root.h"
#include "Vcore__Syms.h"

#include "verilated_dpi.h"

//==========

extern "C" svBit is_ebreak(int inst);

VL_INLINE_OPT void Vcore___024root____Vdpiimwrap_core__DOT__dpi__DOT__is_ebreak_TOP(IData/*31:0*/ inst, CData/*0:0*/ &is_ebreak__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore___024root____Vdpiimwrap_core__DOT__dpi__DOT__is_ebreak_TOP\n"); );
    // Body
    int inst__Vcvt;
    for (size_t inst__Vidx = 0; inst__Vidx < 1; ++inst__Vidx) inst__Vcvt = inst;
    svBit is_ebreak__Vfuncrtn__Vcvt;
    is_ebreak__Vfuncrtn__Vcvt = is_ebreak(inst__Vcvt);
    is_ebreak__Vfuncrtn = (1U & is_ebreak__Vfuncrtn__Vcvt);
}

VL_INLINE_OPT void Vcore___024root___sequent__TOP__1(Vcore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore___024root___sequent__TOP__1\n"); );
    // Variables
    CData/*4:0*/ __Vdlyvdim0__core__DOT__rf__DOT__rfR__v0;
    CData/*0:0*/ __Vdlyvset__core__DOT__rf__DOT__rfR__v0;
    VlWide<3>/*95:0*/ __Vtemp1;
    VlWide<3>/*95:0*/ __Vtemp2;
    VlWide<3>/*95:0*/ __Vtemp4;
    QData/*63:0*/ core__DOT___alu_out_T_7;
    QData/*63:0*/ __Vdly__core__DOT__pc_reg;
    QData/*63:0*/ __Vdlyvval__core__DOT__rf__DOT__rfR__v0;
    // Body
    __Vdlyvset__core__DOT__rf__DOT__rfR__v0 = 0U;
    __Vdly__core__DOT__pc_reg = vlSelf->core__DOT__pc_reg;
    vlSelf->core__DOT__ImemCenR = (1U & (~ (IData)(vlSelf->reset)));
    vlSelf->core__DOT__ex_mem_pl__DOT__Dmem_wdataR 
        = ((IData)(vlSelf->reset) ? 0ULL : vlSelf->core__DOT__id_ex_pl__DOT__Dmem_wdataR);
    vlSelf->core__DOT__ex_mem_pl__DOT__mem_wenR = (
                                                   (~ (IData)(vlSelf->reset)) 
                                                   & (IData)(vlSelf->core__DOT__id_ex_pl__DOT__memwenR));
    if (vlSelf->reset) {
        vlSelf->core__DOT__mem_wb_pl__DOT__pcR = 0ULL;
        vlSelf->core__DOT__mem_wb_pl__DOT__pcplus4R = 0ULL;
        vlSelf->core__DOT__mem_wb_pl__DOT__instR = 0U;
        vlSelf->core__DOT__mem_wb_pl__DOT__aluR = 0ULL;
    } else {
        vlSelf->core__DOT__mem_wb_pl__DOT__pcR = vlSelf->core__DOT__ex_mem_pl__DOT__pcR;
        vlSelf->core__DOT__mem_wb_pl__DOT__pcplus4R 
            = (4ULL + vlSelf->core__DOT__ex_mem_pl__DOT__pcR);
        vlSelf->core__DOT__mem_wb_pl__DOT__instR = vlSelf->core__DOT__ex_mem_pl__DOT__instR;
        vlSelf->core__DOT__mem_wb_pl__DOT__aluR = vlSelf->core__DOT__ex_mem_pl__DOT__alu_outR;
    }
    if (((IData)(vlSelf->core__DOT__mem_wb_pl__DOT__rf_wenR) 
         & (0U != (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_addrR)))) {
        __Vdlyvval__core__DOT__rf__DOT__rfR__v0 = (
                                                   (3U 
                                                    == (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR))
                                                    ? vlSelf->core__DOT__mem_wb_pl__DOT__Dmem_rdataR
                                                    : vlSelf->core__DOT___wb_data_T_3);
        __Vdlyvset__core__DOT__rf__DOT__rfR__v0 = 1U;
        __Vdlyvdim0__core__DOT__rf__DOT__rfR__v0 = vlSelf->core__DOT__mem_wb_pl__DOT__wb_addrR;
    }
    __Vdly__core__DOT__pc_reg = ((IData)(vlSelf->io_Imemio_cen)
                                  ? ((IData)(vlSelf->core__DOT__id_ex_pl__DOT__inst_is_j_flagR)
                                      ? ((IData)(vlSelf->core__DOT__id_ex_pl__DOT__inst_is_j_flagR)
                                          ? ((5U == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                              ? vlSelf->core__DOT___alu_out_T_10
                                              : vlSelf->core__DOT___alu_out_T_20)
                                          : 0ULL) : 
                                     ((1U & ((0xfU 
                                              == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                              ? (IData)(vlSelf->core__DOT___hi_T_11)
                                              : ((0x10U 
                                                  == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                                  ? 
                                                 (~ (IData)(vlSelf->core__DOT___hi_T_11))
                                                  : 
                                                 ((0xeU 
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
                                                        == vlSelf->core__DOT__id_ex_pl__DOT__src2R))))))))
                                       ? (vlSelf->core__DOT__id_ex_pl__DOT__pcR 
                                          + vlSelf->core__DOT__id_ex_pl__DOT__immR)
                                       : vlSelf->core__DOT__pc_plus4))
                                  : 0x80000000ULL);
    vlSelf->io_Imemio_cen = vlSelf->core__DOT__ImemCenR;
    vlSelf->io_DMemio_wdata = vlSelf->core__DOT__ex_mem_pl__DOT__Dmem_wdataR;
    vlSelf->core__DOT__id_ex_pl__DOT__Dmem_wdataR = 
        ((IData)(vlSelf->reset) ? 0ULL : vlSelf->core__DOT__rf_io_channel_rdata2);
    vlSelf->io_DMemio_wen = vlSelf->core__DOT__ex_mem_pl__DOT__mem_wenR;
    vlSelf->core__DOT__id_ex_pl__DOT__memwenR = ((~ (IData)(vlSelf->reset)) 
                                                 & ((0x13U 
                                                     != 
                                                     (0x707fU 
                                                      & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                    & ((0x33U 
                                                        != 
                                                        (0xfe00707fU 
                                                         & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                       & ((0x40000033U 
                                                           != 
                                                           (0xfe00707fU 
                                                            & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                          & ((0x37U 
                                                              != 
                                                              (0x7fU 
                                                               & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                             & ((0x6fU 
                                                                 != 
                                                                 (0x7fU 
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
                                                                          & vlSelf->core__DOT__if_id_pl__DOT__instR))))))))));
    vlSelf->io_Deubug_Debug_pc = vlSelf->core__DOT__mem_wb_pl__DOT__pcR;
    vlSelf->core__DOT__ex_mem_pl__DOT__pcR = ((IData)(vlSelf->reset)
                                               ? 0ULL
                                               : vlSelf->core__DOT__id_ex_pl__DOT__pcR);
    vlSelf->io_Deubug_Debug_inst = vlSelf->core__DOT__mem_wb_pl__DOT__instR;
    Vcore___024root____Vdpiimwrap_core__DOT__dpi__DOT__is_ebreak_TOP(vlSelf->core__DOT__mem_wb_pl__DOT__instR, vlSelf->__Vfunc_core__DOT__dpi__DOT__is_ebreak__0__Vfuncout);
    if (VL_UNLIKELY(vlSelf->__Vfunc_core__DOT__dpi__DOT__is_ebreak__0__Vfuncout)) {
        VL_WRITEF("\n\033[1;34mebreak! inst : 0x%016x\n\033[0m\n\n",
                  32,vlSelf->core__DOT__mem_wb_pl__DOT__instR);
        VL_FINISH_MT("src/vsrc/dpi.v", 8, "");
    }
    if (vlSelf->reset) {
        vlSelf->core__DOT__ex_mem_pl__DOT__instR = 0U;
        vlSelf->core__DOT__ex_mem_pl__DOT__alu_outR = 0ULL;
        vlSelf->core__DOT__mem_wb_pl__DOT__Dmem_rdataR = 0ULL;
    } else {
        vlSelf->core__DOT__ex_mem_pl__DOT__instR = vlSelf->core__DOT__id_ex_pl__DOT__instR;
        vlSelf->core__DOT__ex_mem_pl__DOT__alu_outR 
            = ((5U == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                ? vlSelf->core__DOT___alu_out_T_10 : vlSelf->core__DOT___alu_out_T_20);
        vlSelf->core__DOT__mem_wb_pl__DOT__Dmem_rdataR 
            = vlSelf->io_DMemio_rdata;
    }
    vlSelf->core__DOT__mem_wb_pl__DOT__rf_wenR = ((~ (IData)(vlSelf->reset)) 
                                                  & (IData)(vlSelf->core__DOT__ex_mem_pl__DOT__rf_wenR));
    if (vlSelf->reset) {
        vlSelf->core__DOT__mem_wb_pl__DOT__wb_addrR = 0U;
        vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR = 0U;
        vlSelf->core__DOT__id_ex_pl__DOT__immR = 0ULL;
    } else {
        vlSelf->core__DOT__mem_wb_pl__DOT__wb_addrR 
            = vlSelf->core__DOT__ex_mem_pl__DOT__wb_addrR;
        vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR 
            = vlSelf->core__DOT__ex_mem_pl__DOT__wb_selR;
        vlSelf->core__DOT__id_ex_pl__DOT__immR = vlSelf->core__DOT__id_ex_pl_io_src_in_imm;
    }
    vlSelf->core__DOT__id_ex_pl__DOT__inst_is_j_flagR 
        = ((~ (IData)(vlSelf->reset)) & ((0x6fU == 
                                          (0x7fU & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                         | (0x67U == 
                                            (0x707fU 
                                             & vlSelf->core__DOT__if_id_pl__DOT__instR))));
    VL_EXTEND_WQ(76,64, __Vtemp1, ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                      >> 0x1fU) ? 0xfffffffffffffULL
                                      : 0ULL) << 0xcU) 
                                   | (QData)((IData)(
                                                     ((0xfe0U 
                                                       & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                          >> 0x14U)) 
                                                      | (0x1fU 
                                                         & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                            >> 7U)))))));
    VL_EXTEND_WQ(76,64, __Vtemp2, ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
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
                                                                  >> 0x13U)))))))));
    VL_EXTEND_WQ(76,64, __Vtemp4, ((2U == (IData)(vlSelf->core__DOT__op2_sel))
                                    ? ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                          >> 0x1fU)
                                          ? 0xfffffffffffffULL
                                          : 0ULL) << 0xcU) 
                                       | (QData)((IData)(
                                                         (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                          >> 0x14U))))
                                    : ((1U == (IData)(vlSelf->core__DOT__op2_sel))
                                        ? vlSelf->core__DOT__rf_io_channel_rdata2
                                        : 0ULL)));
    if (vlSelf->reset) {
        vlSelf->core__DOT__id_ex_pl__DOT__src2R = 0ULL;
        vlSelf->core__DOT__id_ex_pl__DOT__src1R = 0ULL;
    } else {
        vlSelf->core__DOT__id_ex_pl__DOT__src2R = (
                                                   ((QData)((IData)(
                                                                    ((3U 
                                                                      == (IData)(vlSelf->core__DOT__op2_sel))
                                                                      ? 
                                                                     __Vtemp1[1U]
                                                                      : 
                                                                     ((5U 
                                                                       == (IData)(vlSelf->core__DOT__op2_sel))
                                                                       ? 
                                                                      __Vtemp2[1U]
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
                                                                       __Vtemp4[1U]))))) 
                                                    << 0x20U) 
                                                   | (QData)((IData)(
                                                                     ((3U 
                                                                       == (IData)(vlSelf->core__DOT__op2_sel))
                                                                       ? 
                                                                      __Vtemp1[0U]
                                                                       : 
                                                                      ((5U 
                                                                        == (IData)(vlSelf->core__DOT__op2_sel))
                                                                        ? 
                                                                       __Vtemp2[0U]
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
                                                                        __Vtemp4[0U]))))));
        vlSelf->core__DOT__id_ex_pl__DOT__src1R = (
                                                   (3U 
                                                    == (IData)(vlSelf->core__DOT__op1_sel))
                                                    ? (QData)((IData)(
                                                                      (0x1fU 
                                                                       & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                          >> 0xfU))))
                                                    : 
                                                   ((1U 
                                                     == (IData)(vlSelf->core__DOT__op1_sel))
                                                     ? vlSelf->core__DOT__pc_reg
                                                     : 
                                                    ((0U 
                                                      == (IData)(vlSelf->core__DOT__op1_sel))
                                                      ? 
                                                     ((0U 
                                                       == 
                                                       (0x1fU 
                                                        & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                           >> 0xfU)))
                                                       ? 0ULL
                                                       : 
                                                      vlSelf->core__DOT__rf__DOT__rfR
                                                      [
                                                      (0x1fU 
                                                       & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                          >> 0xfU))])
                                                      : 0ULL)));
    }
    if (__Vdlyvset__core__DOT__rf__DOT__rfR__v0) {
        vlSelf->core__DOT__rf__DOT__rfR[__Vdlyvdim0__core__DOT__rf__DOT__rfR__v0] 
            = __Vdlyvval__core__DOT__rf__DOT__rfR__v0;
    }
    if (vlSelf->reset) {
        vlSelf->core__DOT__id_ex_pl__DOT__pcR = 0ULL;
        vlSelf->core__DOT__id_ex_pl__DOT__instR = 0U;
    } else {
        vlSelf->core__DOT__id_ex_pl__DOT__pcR = (QData)((IData)(vlSelf->core__DOT__if_id_pl__DOT__pcR));
        vlSelf->core__DOT__id_ex_pl__DOT__instR = vlSelf->core__DOT__if_id_pl__DOT__instR;
    }
    vlSelf->io_DMemio_addr = (IData)(vlSelf->core__DOT__ex_mem_pl__DOT__alu_outR);
    vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR 
        = ((IData)(vlSelf->reset) ? 0U : ((0x13U == 
                                           (0x707fU 
                                            & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                           ? 1U : (
                                                   (0x33U 
                                                    == 
                                                    (0xfe00707fU 
                                                     & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                    ? 1U
                                                    : 
                                                   ((0x40000033U 
                                                     == 
                                                     (0xfe00707fU 
                                                      & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                     ? 2U
                                                     : 
                                                    ((0x37U 
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
                                                           : 0U))))))))));
    vlSelf->io_Deubug_Debug_rf_wen = vlSelf->core__DOT__mem_wb_pl__DOT__rf_wenR;
    vlSelf->core__DOT__ex_mem_pl__DOT__rf_wenR = ((~ (IData)(vlSelf->reset)) 
                                                  & (IData)(vlSelf->core__DOT__id_ex_pl__DOT__wenR));
    vlSelf->io_Deubug_Debug_rf_waddr = vlSelf->core__DOT__mem_wb_pl__DOT__wb_addrR;
    vlSelf->core__DOT__ex_mem_pl__DOT__wb_addrR = ((IData)(vlSelf->reset)
                                                    ? 0U
                                                    : (IData)(vlSelf->core__DOT__id_ex_pl__DOT__wb_addrR));
    vlSelf->core__DOT___wb_data_T_3 = ((2U == (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR))
                                        ? vlSelf->core__DOT__mem_wb_pl__DOT__pcplus4R
                                        : ((1U == (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR))
                                            ? vlSelf->core__DOT__mem_wb_pl__DOT__aluR
                                            : 0ULL));
    vlSelf->core__DOT__ex_mem_pl__DOT__wb_selR = ((IData)(vlSelf->reset)
                                                   ? 0U
                                                   : (IData)(vlSelf->core__DOT__id_ex_pl__DOT__wtypeR));
    vlSelf->core__DOT__id_ex_pl_io_src_in_imm = vlSelf->core__DOT__id_ex_pl__DOT__immR;
    vlSelf->core__DOT___hi_T_11 = (vlSelf->core__DOT__id_ex_pl__DOT__src1R 
                                   < vlSelf->core__DOT__id_ex_pl__DOT__src2R);
    vlSelf->core__DOT___alu_out_T_10 = (vlSelf->core__DOT__id_ex_pl__DOT__src1R 
                                        ^ vlSelf->core__DOT__id_ex_pl__DOT__src2R);
    core__DOT___alu_out_T_7 = (vlSelf->core__DOT__id_ex_pl__DOT__src1R 
                               + vlSelf->core__DOT__id_ex_pl__DOT__src2R);
    vlSelf->io_Deubug_Debug_rf_wdata = ((3U == (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR))
                                         ? vlSelf->core__DOT__mem_wb_pl__DOT__Dmem_rdataR
                                         : vlSelf->core__DOT___wb_data_T_3);
    vlSelf->core__DOT__if_id_pl__DOT__pcR = ((IData)(vlSelf->reset)
                                              ? 0ULL
                                              : vlSelf->core__DOT__pc_reg);
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
    vlSelf->core__DOT__id_ex_pl__DOT__wenR = ((~ (IData)(vlSelf->reset)) 
                                              & ((0x13U 
                                                  == 
                                                  (0x707fU 
                                                   & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                 | ((0x33U 
                                                     == 
                                                     (0xfe00707fU 
                                                      & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                    | ((0x40000033U 
                                                        == 
                                                        (0xfe00707fU 
                                                         & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                       | ((0x37U 
                                                           == 
                                                           (0x7fU 
                                                            & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                          | ((0x6fU 
                                                              == 
                                                              (0x7fU 
                                                               & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                             | ((0x67U 
                                                                 == 
                                                                 (0x707fU 
                                                                  & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                                                | (0x17U 
                                                                   == 
                                                                   (0x7fU 
                                                                    & vlSelf->core__DOT__if_id_pl__DOT__instR)))))))));
    if (vlSelf->reset) {
        vlSelf->core__DOT__id_ex_pl__DOT__wb_addrR = 0U;
        vlSelf->core__DOT__id_ex_pl__DOT__wtypeR = 0U;
    } else {
        vlSelf->core__DOT__id_ex_pl__DOT__wb_addrR 
            = (0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                        >> 7U));
        vlSelf->core__DOT__id_ex_pl__DOT__wtypeR = 
            ((0x13U == (0x707fU & vlSelf->core__DOT__if_id_pl__DOT__instR))
              ? 1U : ((0x33U == (0xfe00707fU & vlSelf->core__DOT__if_id_pl__DOT__instR))
                       ? 1U : ((0x40000033U == (0xfe00707fU 
                                                & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                ? 1U : ((0x37U == (0x7fU 
                                                   & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                         ? 1U : ((0x6fU 
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
                                                    : 0U)))))));
    }
    vlSelf->core__DOT__pc_reg = __Vdly__core__DOT__pc_reg;
    vlSelf->core__DOT__pc_plus4 = (4ULL + vlSelf->core__DOT__pc_reg);
    vlSelf->io_Imemio_pc = vlSelf->core__DOT__pc_reg;
    vlSelf->core__DOT__if_id_pl__DOT__instR = ((IData)(vlSelf->reset)
                                                ? 0U
                                                : vlSelf->io_Imemio_inst);
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
}

void Vcore___024root___eval(Vcore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore___024root___eval\n"); );
    // Body
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        Vcore___024root___sequent__TOP__1(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

QData Vcore___024root___change_request_1(Vcore___024root* vlSelf);

VL_INLINE_OPT QData Vcore___024root___change_request(Vcore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore___024root___change_request\n"); );
    // Body
    return (Vcore___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData Vcore___024root___change_request_1(Vcore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vcore___024root___eval_debug_assertions(Vcore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
