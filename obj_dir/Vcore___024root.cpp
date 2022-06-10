// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VCore.h for the primary calling header

#include "VCore___024root.h"
#include "VCore__Syms.h"

#include "verilated_dpi.h"

//==========

extern "C" svBit is_ebreak(int inst);

VL_INLINE_OPT void VCore___024root____Vdpiimwrap_Core__DOT__dpi__DOT__is_ebreak_TOP(IData/*31:0*/ inst, CData/*0:0*/ &is_ebreak__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root____Vdpiimwrap_Core__DOT__dpi__DOT__is_ebreak_TOP\n"); );
    // Body
    int inst__Vcvt;
    for (size_t inst__Vidx = 0; inst__Vidx < 1; ++inst__Vidx) inst__Vcvt = inst;
    svBit is_ebreak__Vfuncrtn__Vcvt;
    is_ebreak__Vfuncrtn__Vcvt = is_ebreak(inst__Vcvt);
    is_ebreak__Vfuncrtn = (1U & is_ebreak__Vfuncrtn__Vcvt);
}

VL_INLINE_OPT void VCore___024root___sequent__TOP__2(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___sequent__TOP__2\n"); );
    // Variables
    CData/*4:0*/ __Vdlyvdim0__Core__DOT__gpr__v0;
    CData/*0:0*/ __Vdlyvset__Core__DOT__gpr__v0;
    QData/*63:0*/ __Vdly__Core__DOT__pcreg;
    QData/*63:0*/ __Vdlyvval__Core__DOT__gpr__v0;
    // Body
    __Vdly__Core__DOT__pcreg = vlSelf->Core__DOT__pcreg;
    __Vdlyvset__Core__DOT__gpr__v0 = 0U;
    if (vlSelf->reset) {
        vlSelf->Core__DOT__storeDataMem = 0ULL;
        vlSelf->Core__DOT__pcWb = 0ULL;
    } else {
        vlSelf->Core__DOT__storeDataMem = vlSelf->Core__DOT__exStoreData;
        vlSelf->Core__DOT__pcWb = vlSelf->Core__DOT__pcMem;
    }
    vlSelf->Core__DOT__ctrlSigsMem_memcen = ((~ (IData)(vlSelf->reset)) 
                                             & (IData)(vlSelf->Core__DOT__exCtrlSigs_memcen));
    if (vlSelf->reset) {
        vlSelf->Core__DOT__ctrlSigsMem_memwen = 0U;
        vlSelf->Core__DOT__instWb = 0x13U;
    } else {
        vlSelf->Core__DOT__ctrlSigsMem_memwen = vlSelf->Core__DOT__exCtrlSigs_memwen;
        vlSelf->Core__DOT__instWb = vlSelf->Core__DOT__instMem;
    }
    if (vlSelf->reset) {
        __Vdly__Core__DOT__pcreg = 0x80000000ULL;
    } else if (vlSelf->Core__DOT__cenreg) {
        if ((1U & (~ (IData)(vlSelf->Core__DOT__load_stall)))) {
            __Vdly__Core__DOT__pcreg = ((IData)(vlSelf->Core__DOT__branchBus_flag)
                                         ? ((0x67U 
                                             == (0x707fU 
                                                 & vlSelf->Core__DOT__If2IdInst))
                                             ? (0xfffffffffffffffeULL 
                                                & (vlSelf->Core__DOT___opVec_0_T 
                                                   + vlSelf->Core__DOT___opVec_1_T_1))
                                             : (vlSelf->Core__DOT__If2IdPc 
                                                + vlSelf->Core__DOT___opVec_1_T_1))
                                         : vlSelf->Core__DOT__seq_pc);
        }
    }
    if (vlSelf->reset) {
        vlSelf->Core__DOT__exOpVec_1 = 0ULL;
        vlSelf->Core__DOT__exCtrlSigs_excTy = 1U;
    } else {
        vlSelf->Core__DOT__exOpVec_1 = ((IData)(vlSelf->Core__DOT__load_stall)
                                         ? 0ULL : (
                                                   (3U 
                                                    == (IData)(vlSelf->Core__DOT__ctriSigs_deco_3))
                                                    ? 0ULL
                                                    : 
                                                   ((4U 
                                                     == (IData)(vlSelf->Core__DOT__ctriSigs_deco_3))
                                                     ? 4ULL
                                                     : vlSelf->Core__DOT___opVec_1_T_5)));
        vlSelf->Core__DOT__exCtrlSigs_excTy = ((IData)(vlSelf->Core__DOT__load_stall)
                                                ? 1U
                                                : (
                                                   (0x13U 
                                                    == 
                                                    (0x707fU 
                                                     & vlSelf->Core__DOT__If2IdInst)) 
                                                   | ((0x17U 
                                                       == 
                                                       (0x7fU 
                                                        & vlSelf->Core__DOT__If2IdInst)) 
                                                      | ((0x37U 
                                                          == 
                                                          (0x7fU 
                                                           & vlSelf->Core__DOT__If2IdInst)) 
                                                         | ((0x6fU 
                                                             == 
                                                             (0x7fU 
                                                              & vlSelf->Core__DOT__If2IdInst)) 
                                                            | ((0x67U 
                                                                == 
                                                                (0x707fU 
                                                                 & vlSelf->Core__DOT__If2IdInst)) 
                                                               | ((0x63U 
                                                                   == 
                                                                   (0x707fU 
                                                                    & vlSelf->Core__DOT__If2IdInst)) 
                                                                  | ((0x2003U 
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
                                                                            & vlSelf->Core__DOT__If2IdInst)))))))))));
    }
    if (((0U != (IData)(vlSelf->Core__DOT__wbAddr)) 
         & (IData)(vlSelf->Core__DOT__ctrlSigsWb_rfwen))) {
        __Vdlyvval__Core__DOT__gpr__v0 = vlSelf->Core__DOT__wbData;
        __Vdlyvset__Core__DOT__gpr__v0 = 1U;
        __Vdlyvdim0__Core__DOT__gpr__v0 = vlSelf->Core__DOT__wbAddr;
    }
    if (__Vdlyvset__Core__DOT__gpr__v0) {
        vlSelf->Core__DOT__gpr[__Vdlyvdim0__Core__DOT__gpr__v0] 
            = __Vdlyvval__Core__DOT__gpr__v0;
    }
    vlSelf->io_dmem_wdata = vlSelf->Core__DOT__storeDataMem;
    vlSelf->Core__DOT__exStoreData = ((IData)(vlSelf->reset)
                                       ? 0ULL : ((IData)(vlSelf->Core__DOT__load_stall)
                                                  ? 0ULL
                                                  : vlSelf->Core__DOT___opVec_1_T));
    vlSelf->io_debug_debugPc = vlSelf->Core__DOT__pcWb;
    vlSelf->Core__DOT__pcMem = ((IData)(vlSelf->reset)
                                 ? 0ULL : vlSelf->Core__DOT__exPc);
    vlSelf->io_dmem_cen = vlSelf->Core__DOT__ctrlSigsMem_memcen;
    vlSelf->Core__DOT__exCtrlSigs_memcen = ((~ (IData)(vlSelf->reset)) 
                                            & ((~ (IData)(vlSelf->Core__DOT__load_stall)) 
                                               & ((0x13U 
                                                   != 
                                                   (0x707fU 
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
                                                              & ((0x63U 
                                                                  != 
                                                                  (0x707fU 
                                                                   & vlSelf->Core__DOT__If2IdInst)) 
                                                                 & ((0x2003U 
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
                                                                           & vlSelf->Core__DOT__If2IdInst))))))))))));
    vlSelf->io_dmem_wen = (0U != (IData)(vlSelf->Core__DOT__ctrlSigsMem_memwen));
    vlSelf->Core__DOT__exCtrlSigs_memwen = ((IData)(vlSelf->reset)
                                             ? 0U : 
                                            ((IData)(vlSelf->Core__DOT__load_stall)
                                              ? 0U : 
                                             ((0x13U 
                                               == (0x707fU 
                                                   & vlSelf->Core__DOT__If2IdInst))
                                               ? 0U
                                               : ((0x17U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->Core__DOT__If2IdInst))
                                                   ? 0U
                                                   : 
                                                  ((0x37U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->Core__DOT__If2IdInst))
                                                    ? 0U
                                                    : 
                                                   ((0x6fU 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->Core__DOT__If2IdInst))
                                                     ? 0U
                                                     : 
                                                    ((0x67U 
                                                      == 
                                                      (0x707fU 
                                                       & vlSelf->Core__DOT__If2IdInst))
                                                      ? 0U
                                                      : 
                                                     ((0x63U 
                                                       == 
                                                       (0x707fU 
                                                        & vlSelf->Core__DOT__If2IdInst))
                                                       ? 0U
                                                       : 
                                                      ((0x2003U 
                                                        == 
                                                        (0x707fU 
                                                         & vlSelf->Core__DOT__If2IdInst))
                                                        ? 0U
                                                        : 
                                                       ((0x2023U 
                                                         == 
                                                         (0x707fU 
                                                          & vlSelf->Core__DOT__If2IdInst))
                                                         ? 0xfU
                                                         : 
                                                        ((0x3023U 
                                                          == 
                                                          (0x707fU 
                                                           & vlSelf->Core__DOT__If2IdInst))
                                                          ? 0xfU
                                                          : 0U)))))))))));
    vlSelf->io_debug_debugInst = vlSelf->Core__DOT__instWb;
    vlSelf->Core__DOT__instMem = ((IData)(vlSelf->reset)
                                   ? 0x13U : vlSelf->Core__DOT__exInst);
    vlSelf->Core__DOT__cenreg = (1U & (~ (IData)(vlSelf->reset)));
    vlSelf->Core__DOT__Alu__DOT__op2 = ((2U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                         ? (1ULL + 
                                            (~ vlSelf->Core__DOT__exOpVec_1))
                                         : vlSelf->Core__DOT__exOpVec_1);
    vlSelf->Core__DOT__wbAddr = ((IData)(vlSelf->reset)
                                  ? 0U : (IData)(vlSelf->Core__DOT__rdMem));
    vlSelf->Core__DOT__ctrlSigsWb_rfwen = ((IData)(vlSelf->reset) 
                                           | (IData)(vlSelf->Core__DOT__ctrlSigsMem_rfwen));
    vlSelf->Core__DOT__wbData = ((IData)(vlSelf->reset)
                                  ? 0ULL : ((2U == (IData)(vlSelf->Core__DOT__ctrlSigsMem_wbdSel))
                                             ? vlSelf->io_dmem_rdata
                                             : vlSelf->Core__DOT__alu_resultMem));
    VCore___024root____Vdpiimwrap_Core__DOT__dpi__DOT__is_ebreak_TOP(vlSelf->io_debug_debugInst, vlSelf->__Vfunc_Core__DOT__dpi__DOT__is_ebreak__0__Vfuncout);
    if (VL_UNLIKELY(vlSelf->__Vfunc_Core__DOT__dpi__DOT__is_ebreak__0__Vfuncout)) {
        VL_WRITEF("\n\033[1;34mebreak! inst : 0x%016x\n\033[0m\n\n",
                  32,vlSelf->io_debug_debugInst);
        VL_FINISH_MT("src/vsrc/dpi.v", 8, "");
    }
    if (vlSelf->reset) {
        vlSelf->Core__DOT__exOpVec_0 = 0ULL;
        vlSelf->Core__DOT__exPc = 0ULL;
        vlSelf->Core__DOT__exInst = 0x13U;
    } else {
        vlSelf->Core__DOT__exOpVec_0 = ((IData)(vlSelf->Core__DOT__load_stall)
                                         ? 0ULL : (
                                                   (3U 
                                                    == (IData)(vlSelf->Core__DOT__ctriSigs_deco_2))
                                                    ? 0ULL
                                                    : 
                                                   ((2U 
                                                     == (IData)(vlSelf->Core__DOT__ctriSigs_deco_2))
                                                     ? vlSelf->Core__DOT__If2IdPc
                                                     : vlSelf->Core__DOT___opVec_0_T)));
        vlSelf->Core__DOT__exPc = ((IData)(vlSelf->Core__DOT__load_stall)
                                    ? 0ULL : vlSelf->Core__DOT__If2IdPc);
        vlSelf->Core__DOT__exInst = ((IData)(vlSelf->Core__DOT__load_stall)
                                      ? 0x13U : vlSelf->Core__DOT__If2IdInst);
    }
    vlSelf->io_imem_cen = vlSelf->Core__DOT__cenreg;
    vlSelf->io_debug_debugwaddr = vlSelf->Core__DOT__wbAddr;
    vlSelf->Core__DOT__rdMem = ((IData)(vlSelf->reset)
                                 ? 0U : (IData)(vlSelf->Core__DOT__exRd));
    vlSelf->io_debug_debugwen = vlSelf->Core__DOT__ctrlSigsWb_rfwen;
    vlSelf->Core__DOT__ctrlSigsMem_rfwen = ((IData)(vlSelf->reset) 
                                            | (IData)(vlSelf->Core__DOT__exCtrlSigs_rfwen));
    vlSelf->io_debug_debugdata = vlSelf->Core__DOT__wbData;
    if (vlSelf->reset) {
        vlSelf->Core__DOT__alu_resultMem = 0ULL;
        vlSelf->Core__DOT__ctrlSigsMem_wbdSel = 1U;
    } else {
        vlSelf->Core__DOT__alu_resultMem = vlSelf->Core__DOT__Alu_io_result;
        vlSelf->Core__DOT__ctrlSigsMem_wbdSel = vlSelf->Core__DOT__exCtrlSigs_wbdSel;
    }
    if (vlSelf->reset) {
        vlSelf->Core__DOT__If2IdPc = 0ULL;
    } else if (vlSelf->Core__DOT__branchBus_flag) {
        vlSelf->Core__DOT__If2IdPc = 0ULL;
    } else if ((1U & (~ (IData)(vlSelf->Core__DOT__load_stall)))) {
        vlSelf->Core__DOT__If2IdPc = vlSelf->Core__DOT__pcreg;
    }
    vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1 
        = (vlSelf->Core__DOT__exOpVec_0 + vlSelf->Core__DOT__Alu__DOT__op2);
    vlSelf->Core__DOT__exRd = ((IData)(vlSelf->reset)
                                ? 0U : ((IData)(vlSelf->Core__DOT__load_stall)
                                         ? 0U : (0x1fU 
                                                 & (vlSelf->Core__DOT__If2IdInst 
                                                    >> 7U))));
    vlSelf->Core__DOT__exCtrlSigs_rfwen = ((IData)(vlSelf->reset) 
                                           | ((IData)(vlSelf->Core__DOT__load_stall) 
                                              | ((0x13U 
                                                  == 
                                                  (0x707fU 
                                                   & vlSelf->Core__DOT__If2IdInst)) 
                                                 | ((0x17U 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->Core__DOT__If2IdInst)) 
                                                    | ((0x37U 
                                                        == 
                                                        (0x7fU 
                                                         & vlSelf->Core__DOT__If2IdInst)) 
                                                       | ((0x6fU 
                                                           == 
                                                           (0x7fU 
                                                            & vlSelf->Core__DOT__If2IdInst)) 
                                                          | ((0x67U 
                                                              == 
                                                              (0x707fU 
                                                               & vlSelf->Core__DOT__If2IdInst)) 
                                                             | ((0x63U 
                                                                 != 
                                                                 (0x707fU 
                                                                  & vlSelf->Core__DOT__If2IdInst)) 
                                                                & (0x2003U 
                                                                   == 
                                                                   (0x707fU 
                                                                    & vlSelf->Core__DOT__If2IdInst))))))))));
    vlSelf->io_dmem_addr = vlSelf->Core__DOT__alu_resultMem;
    vlSelf->Core__DOT__exCtrlSigs_wbdSel = ((IData)(vlSelf->reset)
                                             ? 1U : 
                                            ((IData)(vlSelf->Core__DOT__load_stall)
                                              ? 1U : 
                                             ((0x13U 
                                               == (0x707fU 
                                                   & vlSelf->Core__DOT__If2IdInst))
                                               ? 1U
                                               : ((0x17U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->Core__DOT__If2IdInst))
                                                   ? 1U
                                                   : 
                                                  ((0x37U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->Core__DOT__If2IdInst))
                                                    ? 1U
                                                    : 
                                                   ((0x6fU 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->Core__DOT__If2IdInst))
                                                     ? 1U
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
                                                       ? 0U
                                                       : 
                                                      ((0x2003U 
                                                        == 
                                                        (0x707fU 
                                                         & vlSelf->Core__DOT__If2IdInst))
                                                        ? 2U
                                                        : 0U)))))))));
    vlSelf->Core__DOT__pcreg = __Vdly__Core__DOT__pcreg;
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
    vlSelf->Core__DOT__seq_pc = (4ULL + vlSelf->Core__DOT__pcreg);
    vlSelf->io_imem_addr = vlSelf->Core__DOT__pcreg;
    if (vlSelf->reset) {
        vlSelf->Core__DOT__If2IdInst = 0x13U;
    } else if (vlSelf->Core__DOT__branchBus_flag) {
        vlSelf->Core__DOT__If2IdInst = 0x13U;
    } else if ((1U & (~ (IData)(vlSelf->Core__DOT__load_stall)))) {
        vlSelf->Core__DOT__If2IdInst = vlSelf->io_imem_rdata;
    }
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
    vlSelf->Core__DOT__imm_sigBit = ((6U != (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                     & (vlSelf->Core__DOT__If2IdInst 
                                        >> 0x1fU));
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
}

VL_INLINE_OPT void VCore___024root___combo__TOP__4(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___combo__TOP__4\n"); );
    // Variables
    QData/*63:0*/ Core__DOT___opVec_0_T_4;
    QData/*63:0*/ Core__DOT___branchBus_flag_T;
    QData/*63:0*/ Core__DOT___opVec_1_T_7;
    QData/*63:0*/ Core__DOT___branchBus_flag_T_1;
    // Body
    vlSelf->Core__DOT__MemWbData = ((2U == (IData)(vlSelf->Core__DOT__ctrlSigsMem_wbdSel))
                                     ? vlSelf->io_dmem_rdata
                                     : vlSelf->Core__DOT__alu_resultMem);
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

void VCore___024root___eval(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___eval\n"); );
    // Body
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        VCore___024root___sequent__TOP__2(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
    VCore___024root___combo__TOP__4(vlSelf);
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

QData VCore___024root___change_request_1(VCore___024root* vlSelf);

VL_INLINE_OPT QData VCore___024root___change_request(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___change_request\n"); );
    // Body
    return (VCore___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData VCore___024root___change_request_1(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VCore___024root___eval_debug_assertions(VCore___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCore___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
