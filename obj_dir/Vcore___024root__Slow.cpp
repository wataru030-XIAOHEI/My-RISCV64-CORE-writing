// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VCore.h for the primary calling header

#include "VCore___024root.h"
#include "VCore__Syms.h"

#include "verilated_dpi.h"

//==========


void VCore___024root___ctor_var_reset(VCore___024root* vlSelf);

VCore___024root::VCore___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VCore___024root___ctor_var_reset(this);
}

void VCore___024root::__Vconfigure(VCore__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VCore___024root::~VCore___024root() {
}

void VCore___024root___initial__TOP__1(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___initial__TOP__1\n"); );
    // Body
    vlSelf->io_imem_wen = 0U;
    vlSelf->io_imem_wdata = 0ULL;
}

void VCore___024root____Vdpiimwrap_Core__DOT__dpi__DOT__is_ebreak_TOP(IData/*31:0*/ inst, CData/*0:0*/ &is_ebreak__Vfuncrtn);

void VCore___024root___settle__TOP__3(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___settle__TOP__3\n"); );
    // Variables
    QData/*63:0*/ Core__DOT___opVec_0_T_4;
    QData/*63:0*/ Core__DOT___branchBus_flag_T;
    QData/*63:0*/ Core__DOT___opVec_1_T_7;
    QData/*63:0*/ Core__DOT___branchBus_flag_T_1;
    // Body
    vlSelf->io_debug_debugPc = vlSelf->Core__DOT__pcWb;
    vlSelf->io_dmem_cen = vlSelf->Core__DOT__ctrlSigsMem_memcen;
    vlSelf->io_dmem_wen = (0U != (IData)(vlSelf->Core__DOT__ctrlSigsMem_memwen));
    vlSelf->io_dmem_wdata = vlSelf->Core__DOT__storeDataMem;
    vlSelf->io_debug_debugInst = vlSelf->Core__DOT__instWb;
    vlSelf->Core__DOT__Alu__DOT__op2 = ((2U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                         ? (1ULL + 
                                            (~ vlSelf->Core__DOT__exOpVec_1))
                                         : vlSelf->Core__DOT__exOpVec_1);
    vlSelf->io_debug_debugwen = vlSelf->Core__DOT__ctrlSigsWb_rfwen;
    vlSelf->io_debug_debugwaddr = vlSelf->Core__DOT__wbAddr;
    vlSelf->io_debug_debugdata = vlSelf->Core__DOT__wbData;
    vlSelf->io_imem_cen = vlSelf->Core__DOT__cenreg;
    vlSelf->io_dmem_addr = vlSelf->Core__DOT__alu_resultMem;
    vlSelf->Core__DOT__MemWbData = ((2U == (IData)(vlSelf->Core__DOT__ctrlSigsMem_wbdSel))
                                     ? vlSelf->io_dmem_rdata
                                     : vlSelf->Core__DOT__alu_resultMem);
    vlSelf->Core__DOT__seq_pc = (4ULL + vlSelf->Core__DOT__pcreg);
    vlSelf->io_imem_addr = vlSelf->Core__DOT__pcreg;
    vlSelf->Core__DOT__load_stall = ((IData)(vlSelf->Core__DOT__exCtrlSigs_memcen) 
                                     & (0U == (IData)(vlSelf->Core__DOT__exCtrlSigs_memwen)));
    if ((0x13U == (0x707fU & vlSelf->Core__DOT__If2IdInst))) {
        vlSelf->Core__DOT__ctriSigs_deco_2 = 1U;
        vlSelf->Core__DOT__ctriSigs_deco_3 = 2U;
        vlSelf->Core__DOT__ctriSigs_deco_0 = 1U;
    } else {
        vlSelf->Core__DOT__ctriSigs_deco_2 = ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->Core__DOT__If2IdInst))
                                               ? 2U
                                               : ((0x37U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->Core__DOT__If2IdInst))
                                                   ? 3U
                                                   : 
                                                  ((0x6fU 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->Core__DOT__If2IdInst))
                                                    ? 2U
                                                    : 
                                                   ((0x67U 
                                                     == 
                                                     (0x707fU 
                                                      & vlSelf->Core__DOT__If2IdInst))
                                                     ? 2U
                                                     : 
                                                    ((0x63U 
                                                      == 
                                                      (0x707fU 
                                                       & vlSelf->Core__DOT__If2IdInst))
                                                      ? 3U
                                                      : 
                                                     ((0x2003U 
                                                       == 
                                                       (0x707fU 
                                                        & vlSelf->Core__DOT__If2IdInst)) 
                                                      | ((0x2023U 
                                                          == 
                                                          (0x707fU 
                                                           & vlSelf->Core__DOT__If2IdInst)) 
                                                         | (0x3023U 
                                                            == 
                                                            (0x707fU 
                                                             & vlSelf->Core__DOT__If2IdInst)))))))));
        vlSelf->Core__DOT__ctriSigs_deco_3 = ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->Core__DOT__If2IdInst))
                                               ? 3U
                                               : ((0x37U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->Core__DOT__If2IdInst))
                                                   ? 2U
                                                   : 
                                                  ((0x6fU 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->Core__DOT__If2IdInst))
                                                    ? 4U
                                                    : 
                                                   ((0x67U 
                                                     == 
                                                     (0x707fU 
                                                      & vlSelf->Core__DOT__If2IdInst))
                                                     ? 2U
                                                     : 
                                                    ((0x63U 
                                                      == 
                                                      (0x707fU 
                                                       & vlSelf->Core__DOT__If2IdInst))
                                                      ? 3U
                                                      : 
                                                     ((0x2003U 
                                                       == 
                                                       (0x707fU 
                                                        & vlSelf->Core__DOT__If2IdInst))
                                                       ? 2U
                                                       : 
                                                      ((0x2023U 
                                                        == 
                                                        (0x707fU 
                                                         & vlSelf->Core__DOT__If2IdInst))
                                                        ? 2U
                                                        : 
                                                       ((0x3023U 
                                                         == 
                                                         (0x707fU 
                                                          & vlSelf->Core__DOT__If2IdInst))
                                                         ? 2U
                                                         : 0U))))))));
        vlSelf->Core__DOT__ctriSigs_deco_0 = ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->Core__DOT__If2IdInst))
                                               ? 5U
                                               : ((0x37U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->Core__DOT__If2IdInst))
                                                   ? 5U
                                                   : 
                                                  ((0x6fU 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->Core__DOT__If2IdInst))
                                                    ? 4U
                                                    : 
                                                   ((0x67U 
                                                     == 
                                                     (0x707fU 
                                                      & vlSelf->Core__DOT__If2IdInst))
                                                     ? 1U
                                                     : 
                                                    ((0x63U 
                                                      == 
                                                      (0x707fU 
                                                       & vlSelf->Core__DOT__If2IdInst))
                                                      ? 2U
                                                      : 
                                                     ((0x2003U 
                                                       == 
                                                       (0x707fU 
                                                        & vlSelf->Core__DOT__If2IdInst))
                                                       ? 1U
                                                       : 
                                                      ((0x2023U 
                                                        == 
                                                        (0x707fU 
                                                         & vlSelf->Core__DOT__If2IdInst))
                                                        ? 1U
                                                        : 
                                                       ((0x3023U 
                                                         == 
                                                         (0x707fU 
                                                          & vlSelf->Core__DOT__If2IdInst))
                                                         ? 3U
                                                         : 0U))))))));
    }
    VCore___024root____Vdpiimwrap_Core__DOT__dpi__DOT__is_ebreak_TOP(vlSelf->io_debug_debugInst, vlSelf->__Vfunc_Core__DOT__dpi__DOT__is_ebreak__0__Vfuncout);
    if (VL_UNLIKELY(vlSelf->__Vfunc_Core__DOT__dpi__DOT__is_ebreak__0__Vfuncout)) {
        VL_WRITEF("\n\033[1;34mebreak! inst : 0x%016x\n\033[0m\n\n",
                  32,vlSelf->io_debug_debugInst);
        VL_FINISH_MT("src/vsrc/dpi.v", 8, "");
    }
    vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1 
        = (vlSelf->Core__DOT__exOpVec_0 + vlSelf->Core__DOT__Alu__DOT__op2);
    vlSelf->Core__DOT__imm_sigBit = ((6U != (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                     & (vlSelf->Core__DOT__If2IdInst 
                                        >> 0x1fU));
    vlSelf->Core__DOT__Alu_io_result = (((3U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy)) 
                                         | (5U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy)))
                                         ? ((5U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                             ? (QData)((IData)(
                                                               (vlSelf->Core__DOT__exOpVec_0 
                                                                < vlSelf->Core__DOT__Alu__DOT__op2)))
                                             : ((3U 
                                                 == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                                 ? (QData)((IData)(
                                                                   VL_LTS_IQQ(1,64,64, vlSelf->Core__DOT__exOpVec_0, 
                                                                              ((2U 
                                                                                == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                                                                ? 
                                                                               (1ULL 
                                                                                + 
                                                                                (~ vlSelf->Core__DOT__exOpVec_1))
                                                                                : vlSelf->Core__DOT__exOpVec_1))))
                                                 : 0ULL))
                                         : ((4U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                             ? (((QData)((IData)(
                                                                 ((1U 
                                                                   & (IData)(
                                                                             (vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1 
                                                                              >> 0x1fU)))
                                                                   ? 0xffffffffU
                                                                   : 0U))) 
                                                 << 0x20U) 
                                                | (QData)((IData)(vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1)))
                                             : ((2U 
                                                 == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                                 ? vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1
                                                 : 
                                                ((1U 
                                                  == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                                  ? vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1
                                                  : 0ULL))));
    vlSelf->Core__DOT___opVec_1_T_1 = ((((IData)(vlSelf->Core__DOT__imm_sigBit)
                                          ? 0x1ffffffffULL
                                          : 0ULL) << 0x1fU) 
                                       | (QData)((IData)(
                                                         ((0x7ff00000U 
                                                           & (((5U 
                                                                == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                                                ? 
                                                               (vlSelf->Core__DOT__If2IdInst 
                                                                >> 0x14U)
                                                                : 
                                                               ((IData)(vlSelf->Core__DOT__imm_sigBit)
                                                                 ? 0x7ffU
                                                                 : 0U)) 
                                                              << 0x14U)) 
                                                          | ((0xff000U 
                                                              & ((((5U 
                                                                    != (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                                                   & (4U 
                                                                      != (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)))
                                                                   ? 
                                                                  ((IData)(vlSelf->Core__DOT__imm_sigBit)
                                                                    ? 0xffU
                                                                    : 0U)
                                                                   : 
                                                                  (vlSelf->Core__DOT__If2IdInst 
                                                                   >> 0xcU)) 
                                                                 << 0xcU)) 
                                                             | ((0x800U 
                                                                 & (((2U 
                                                                      == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                                                      ? 
                                                                     (vlSelf->Core__DOT__If2IdInst 
                                                                      >> 7U)
                                                                      : 
                                                                     ((4U 
                                                                       == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                                                       ? 
                                                                      (vlSelf->Core__DOT__If2IdInst 
                                                                       >> 0x14U)
                                                                       : 
                                                                      ((~ 
                                                                        ((5U 
                                                                          == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                                                         | (6U 
                                                                            == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)))) 
                                                                       & (IData)(vlSelf->Core__DOT__imm_sigBit)))) 
                                                                    << 0xbU)) 
                                                                | (((((5U 
                                                                       == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                                                      | (6U 
                                                                         == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)))
                                                                      ? 0U
                                                                      : 
                                                                     (0x3fU 
                                                                      & (vlSelf->Core__DOT__If2IdInst 
                                                                         >> 0x19U))) 
                                                                    << 5U) 
                                                                   | ((((5U 
                                                                         == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                                                         ? 0U
                                                                         : 
                                                                        (0xfU 
                                                                         & (((3U 
                                                                              == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                                                             | (2U 
                                                                                == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)))
                                                                             ? 
                                                                            (vlSelf->Core__DOT__If2IdInst 
                                                                             >> 8U)
                                                                             : 
                                                                            ((6U 
                                                                              == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                                                              ? 
                                                                             (vlSelf->Core__DOT__If2IdInst 
                                                                              >> 0x10U)
                                                                              : 
                                                                             (vlSelf->Core__DOT__If2IdInst 
                                                                              >> 0x15U))))) 
                                                                       << 1U) 
                                                                      | (1U 
                                                                         & ((3U 
                                                                             == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                                                             ? 
                                                                            (vlSelf->Core__DOT__If2IdInst 
                                                                             >> 7U)
                                                                             : 
                                                                            ((1U 
                                                                              == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                                                              ? 
                                                                             (vlSelf->Core__DOT__If2IdInst 
                                                                              >> 0x14U)
                                                                              : 
                                                                             ((6U 
                                                                               == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                                                              & (vlSelf->Core__DOT__If2IdInst 
                                                                                >> 0xfU)))))))))))));
    vlSelf->Core__DOT___opVec_0_T = (((IData)(vlSelf->Core__DOT__exCtrlSigs_rfwen) 
                                      & ((IData)(vlSelf->Core__DOT__exRd) 
                                         == (0x1fU 
                                             & (vlSelf->Core__DOT__If2IdInst 
                                                >> 0xfU))))
                                      ? vlSelf->Core__DOT__Alu_io_result
                                      : (((IData)(vlSelf->Core__DOT__ctrlSigsMem_rfwen) 
                                          & ((IData)(vlSelf->Core__DOT__rdMem) 
                                             == (0x1fU 
                                                 & (vlSelf->Core__DOT__If2IdInst 
                                                    >> 0xfU))))
                                          ? vlSelf->Core__DOT__MemWbData
                                          : (((IData)(vlSelf->Core__DOT__ctrlSigsWb_rfwen) 
                                              & ((IData)(vlSelf->Core__DOT__wbAddr) 
                                                 == 
                                                 (0x1fU 
                                                  & (vlSelf->Core__DOT__If2IdInst 
                                                     >> 0xfU))))
                                              ? vlSelf->Core__DOT__wbData
                                              : ((0U 
                                                  == 
                                                  (0x1fU 
                                                   & (vlSelf->Core__DOT__If2IdInst 
                                                      >> 0xfU)))
                                                  ? 0ULL
                                                  : 
                                                 vlSelf->Core__DOT__gpr
                                                 [(0x1fU 
                                                   & (vlSelf->Core__DOT__If2IdInst 
                                                      >> 0xfU))]))));
    vlSelf->Core__DOT___opVec_1_T = (((IData)(vlSelf->Core__DOT__exCtrlSigs_rfwen) 
                                      & ((IData)(vlSelf->Core__DOT__exRd) 
                                         == (0x1fU 
                                             & (vlSelf->Core__DOT__If2IdInst 
                                                >> 0x14U))))
                                      ? vlSelf->Core__DOT__Alu_io_result
                                      : (((IData)(vlSelf->Core__DOT__ctrlSigsMem_rfwen) 
                                          & ((IData)(vlSelf->Core__DOT__rdMem) 
                                             == (0x1fU 
                                                 & (vlSelf->Core__DOT__If2IdInst 
                                                    >> 0x14U))))
                                          ? vlSelf->Core__DOT__MemWbData
                                          : (((IData)(vlSelf->Core__DOT__ctrlSigsWb_rfwen) 
                                              & ((IData)(vlSelf->Core__DOT__wbAddr) 
                                                 == 
                                                 (0x1fU 
                                                  & (vlSelf->Core__DOT__If2IdInst 
                                                     >> 0x14U))))
                                              ? vlSelf->Core__DOT__wbData
                                              : ((0U 
                                                  == 
                                                  (0x1fU 
                                                   & (vlSelf->Core__DOT__If2IdInst 
                                                      >> 0x14U)))
                                                  ? 0ULL
                                                  : 
                                                 vlSelf->Core__DOT__gpr
                                                 [(0x1fU 
                                                   & (vlSelf->Core__DOT__If2IdInst 
                                                      >> 0x14U))]))));
    Core__DOT___opVec_0_T_4 = ((2U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_2))
                                ? vlSelf->Core__DOT__If2IdPc
                                : vlSelf->Core__DOT___opVec_0_T);
    vlSelf->Core__DOT___opVec_1_T_5 = ((2U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_3))
                                        ? vlSelf->Core__DOT___opVec_1_T_1
                                        : vlSelf->Core__DOT___opVec_1_T);
    Core__DOT___branchBus_flag_T = ((3U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_2))
                                     ? 0ULL : Core__DOT___opVec_0_T_4);
    Core__DOT___opVec_1_T_7 = ((4U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_3))
                                ? 4ULL : vlSelf->Core__DOT___opVec_1_T_5);
    Core__DOT___branchBus_flag_T_1 = ((3U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_3))
                                       ? 0ULL : Core__DOT___opVec_1_T_7);
    vlSelf->Core__DOT__branchBus_flag = (((((0x13U 
                                             != (0x707fU 
                                                 & vlSelf->Core__DOT__If2IdInst)) 
                                            & ((0x17U 
                                                != 
                                                (0x7fU 
                                                 & vlSelf->Core__DOT__If2IdInst)) 
                                               & ((0x37U 
                                                   != 
                                                   (0x7fU 
                                                    & vlSelf->Core__DOT__If2IdInst)) 
                                                  & ((0x6fU 
                                                      != 
                                                      (0x7fU 
                                                       & vlSelf->Core__DOT__If2IdInst)) 
                                                     & ((0x67U 
                                                         != 
                                                         (0x707fU 
                                                          & vlSelf->Core__DOT__If2IdInst)) 
                                                        & (0x63U 
                                                           == 
                                                           (0x707fU 
                                                            & vlSelf->Core__DOT__If2IdInst))))))) 
                                           & (Core__DOT___branchBus_flag_T 
                                              == Core__DOT___branchBus_flag_T_1)) 
                                          | (0x67U 
                                             == (0x707fU 
                                                 & vlSelf->Core__DOT__If2IdInst))) 
                                         | (0x6fU == 
                                            (0x7fU 
                                             & vlSelf->Core__DOT__If2IdInst)));
}

void VCore___024root___eval_initial(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___eval_initial\n"); );
    // Body
    VCore___024root___initial__TOP__1(vlSelf);
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

void VCore___024root___eval_settle(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___eval_settle\n"); );
    // Body
    VCore___024root___settle__TOP__3(vlSelf);
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
}

void VCore___024root___final(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___final\n"); );
}

void VCore___024root___ctor_var_reset(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_debug_debugPc = VL_RAND_RESET_Q(64);
    vlSelf->io_debug_debugInst = VL_RAND_RESET_I(32);
    vlSelf->io_debug_debugwen = VL_RAND_RESET_I(1);
    vlSelf->io_debug_debugwaddr = VL_RAND_RESET_I(5);
    vlSelf->io_debug_debugdata = VL_RAND_RESET_Q(64);
    vlSelf->io_imem_addr = VL_RAND_RESET_Q(64);
    vlSelf->io_imem_rdata = VL_RAND_RESET_I(32);
    vlSelf->io_imem_cen = VL_RAND_RESET_I(1);
    vlSelf->io_imem_wen = VL_RAND_RESET_I(1);
    vlSelf->io_imem_wdata = VL_RAND_RESET_Q(64);
    vlSelf->io_dmem_addr = VL_RAND_RESET_Q(64);
    vlSelf->io_dmem_rdata = VL_RAND_RESET_Q(64);
    vlSelf->io_dmem_cen = VL_RAND_RESET_I(1);
    vlSelf->io_dmem_wen = VL_RAND_RESET_I(1);
    vlSelf->io_dmem_wdata = VL_RAND_RESET_Q(64);
    for (int __Vi0=0; __Vi0<32; ++__Vi0) {
        vlSelf->Core__DOT__gpr[__Vi0] = VL_RAND_RESET_Q(64);
    }
    vlSelf->Core__DOT__Alu_io_result = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__pcreg = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__cenreg = VL_RAND_RESET_I(1);
    vlSelf->Core__DOT__seq_pc = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__If2IdInst = VL_RAND_RESET_I(32);
    vlSelf->Core__DOT__ctriSigs_deco_2 = VL_RAND_RESET_I(2);
    vlSelf->Core__DOT__If2IdPc = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__exCtrlSigs_rfwen = VL_RAND_RESET_I(1);
    vlSelf->Core__DOT__exRd = VL_RAND_RESET_I(5);
    vlSelf->Core__DOT__ctrlSigsMem_rfwen = VL_RAND_RESET_I(1);
    vlSelf->Core__DOT__rdMem = VL_RAND_RESET_I(5);
    vlSelf->Core__DOT__ctrlSigsMem_wbdSel = VL_RAND_RESET_I(3);
    vlSelf->Core__DOT__alu_resultMem = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__MemWbData = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__ctrlSigsWb_rfwen = VL_RAND_RESET_I(1);
    vlSelf->Core__DOT__wbAddr = VL_RAND_RESET_I(5);
    vlSelf->Core__DOT__wbData = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT___opVec_0_T = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__ctriSigs_deco_3 = VL_RAND_RESET_I(3);
    vlSelf->Core__DOT__ctriSigs_deco_0 = VL_RAND_RESET_I(3);
    vlSelf->Core__DOT__imm_sigBit = VL_RAND_RESET_I(1);
    vlSelf->Core__DOT___opVec_1_T_1 = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT___opVec_1_T = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT___opVec_1_T_5 = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__branchBus_flag = VL_RAND_RESET_I(1);
    vlSelf->Core__DOT__exCtrlSigs_memcen = VL_RAND_RESET_I(1);
    vlSelf->Core__DOT__exCtrlSigs_memwen = VL_RAND_RESET_I(4);
    vlSelf->Core__DOT__load_stall = VL_RAND_RESET_I(1);
    vlSelf->Core__DOT__exCtrlSigs_excTy = VL_RAND_RESET_I(7);
    vlSelf->Core__DOT__exCtrlSigs_wbdSel = VL_RAND_RESET_I(3);
    vlSelf->Core__DOT__exOpVec_0 = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__exOpVec_1 = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__exPc = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__exInst = VL_RAND_RESET_I(32);
    vlSelf->Core__DOT__exStoreData = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__ctrlSigsMem_memcen = VL_RAND_RESET_I(1);
    vlSelf->Core__DOT__ctrlSigsMem_memwen = VL_RAND_RESET_I(4);
    vlSelf->Core__DOT__pcMem = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__instMem = VL_RAND_RESET_I(32);
    vlSelf->Core__DOT__storeDataMem = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__pcWb = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__instWb = VL_RAND_RESET_I(32);
    vlSelf->Core__DOT__Alu__DOT__op2 = VL_RAND_RESET_Q(64);
    vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1 = VL_RAND_RESET_Q(64);
    vlSelf->__Vfunc_Core__DOT__dpi__DOT__is_ebreak__0__Vfuncout = 0;
    for (int __Vi0=0; __Vi0<2; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = VL_RAND_RESET_I(1);
    }
}
