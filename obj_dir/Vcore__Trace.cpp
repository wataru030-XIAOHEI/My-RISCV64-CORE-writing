// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vcore__Syms.h"


void Vcore___024root__traceChgSub0(Vcore___024root* vlSelf, VerilatedVcd* tracep);

void Vcore___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep) {
    Vcore___024root* const __restrict vlSelf = static_cast<Vcore___024root*>(voidSelf);
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    {
        Vcore___024root__traceChgSub0((&vlSymsp->TOP), tracep);
    }
}

void Vcore___024root__traceChgSub0(Vcore___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VlWide<3>/*95:0*/ __Vtemp32;
    VlWide<3>/*95:0*/ __Vtemp33;
    VlWide<3>/*95:0*/ __Vtemp35;
    VlWide<3>/*95:0*/ __Vtemp42;
    VlWide<3>/*95:0*/ __Vtemp43;
    VlWide<3>/*95:0*/ __Vtemp44;
    VlWide<3>/*95:0*/ __Vtemp46;
    VlWide<3>/*95:0*/ __Vtemp52;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
            tracep->chgQData(oldp+0,(vlSelf->core__DOT__pc_reg),64);
            tracep->chgQData(oldp+2,(vlSelf->core__DOT__if_id_pl__DOT__pcR),64);
            tracep->chgIData(oldp+4,(vlSelf->core__DOT__if_id_pl__DOT__instR),32);
            tracep->chgQData(oldp+5,((QData)((IData)(vlSelf->core__DOT__if_id_pl__DOT__pcR))),64);
            tracep->chgQData(oldp+7,(vlSelf->core__DOT__id_ex_pl__DOT__pcR),64);
            tracep->chgIData(oldp+9,(vlSelf->core__DOT__id_ex_pl__DOT__instR),32);
            tracep->chgBit(oldp+10,(((0x6fU == (0x7fU 
                                                & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                     | (0x67U == (0x707fU 
                                                  & vlSelf->core__DOT__if_id_pl__DOT__instR)))));
            tracep->chgBit(oldp+11,(vlSelf->core__DOT__id_ex_pl__DOT__inst_is_j_flagR));
            tracep->chgQData(oldp+12,(((3U == (IData)(vlSelf->core__DOT__op1_sel))
                                        ? (QData)((IData)(
                                                          (0x1fU 
                                                           & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                              >> 0xfU))))
                                        : ((1U == (IData)(vlSelf->core__DOT__op1_sel))
                                            ? vlSelf->core__DOT__pc_reg
                                            : ((0U 
                                                == (IData)(vlSelf->core__DOT__op1_sel))
                                                ? (
                                                   (0U 
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
                                                : 0ULL)))),64);
            VL_EXTEND_WQ(76,64, __Vtemp32, ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                               >> 0x1fU)
                                               ? 0xfffffffffffffULL
                                               : 0ULL) 
                                             << 0xcU) 
                                            | (QData)((IData)(
                                                              ((0xfe0U 
                                                                & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                   >> 0x14U)) 
                                                               | (0x1fU 
                                                                  & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                     >> 7U)))))));
            VL_EXTEND_WQ(76,64, __Vtemp33, ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
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
            VL_EXTEND_WQ(76,64, __Vtemp35, ((2U == (IData)(vlSelf->core__DOT__op2_sel))
                                             ? ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                   >> 0x1fU)
                                                   ? 0xfffffffffffffULL
                                                   : 0ULL) 
                                                 << 0xcU) 
                                                | (QData)((IData)(
                                                                  (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                   >> 0x14U))))
                                             : ((1U 
                                                 == (IData)(vlSelf->core__DOT__op2_sel))
                                                 ? vlSelf->core__DOT__rf_io_channel_rdata2
                                                 : 0ULL)));
            tracep->chgQData(oldp+14,((((QData)((IData)(
                                                        ((3U 
                                                          == (IData)(vlSelf->core__DOT__op2_sel))
                                                          ? 
                                                         __Vtemp32[1U]
                                                          : 
                                                         ((5U 
                                                           == (IData)(vlSelf->core__DOT__op2_sel))
                                                           ? 
                                                          __Vtemp33[1U]
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
                                                           __Vtemp35[1U]))))) 
                                        << 0x20U) | (QData)((IData)(
                                                                    ((3U 
                                                                      == (IData)(vlSelf->core__DOT__op2_sel))
                                                                      ? 
                                                                     __Vtemp32[0U]
                                                                      : 
                                                                     ((5U 
                                                                       == (IData)(vlSelf->core__DOT__op2_sel))
                                                                       ? 
                                                                      __Vtemp33[0U]
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
                                                                       __Vtemp35[0U]))))))),64);
            tracep->chgQData(oldp+16,(vlSelf->core__DOT__id_ex_pl__DOT__immR),64);
            tracep->chgQData(oldp+18,(vlSelf->core__DOT__id_ex_pl__DOT__src1R),64);
            tracep->chgQData(oldp+20,(vlSelf->core__DOT__id_ex_pl__DOT__src2R),64);
            tracep->chgCData(oldp+22,((0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                >> 7U))),5);
            tracep->chgCData(oldp+23,(vlSelf->core__DOT__id_ex_pl__DOT__wb_addrR),5);
            tracep->chgQData(oldp+24,(vlSelf->core__DOT__rf_io_channel_rdata2),64);
            tracep->chgQData(oldp+26,(vlSelf->core__DOT__id_ex_pl__DOT__Dmem_wdataR),64);
            tracep->chgCData(oldp+28,(((0x13U == (0x707fU 
                                                  & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                        ? 1U : ((0x33U 
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
                                                        : 0U)))))))))),5);
            tracep->chgCData(oldp+29,(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR),5);
            tracep->chgBit(oldp+30,(((0x13U != (0x707fU 
                                                & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                     & ((0x33U != (0xfe00707fU 
                                                   & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                        & ((0x40000033U 
                                            != (0xfe00707fU 
                                                & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                           & ((0x37U 
                                               != (0x7fU 
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
                                                           & vlSelf->core__DOT__if_id_pl__DOT__instR)))))))))));
            tracep->chgBit(oldp+31,(vlSelf->core__DOT__id_ex_pl__DOT__memwenR));
            tracep->chgBit(oldp+32,(((0x13U == (0x707fU 
                                                & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                     | ((0x33U == (0xfe00707fU 
                                                   & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                        | ((0x40000033U 
                                            == (0xfe00707fU 
                                                & vlSelf->core__DOT__if_id_pl__DOT__instR)) 
                                           | ((0x37U 
                                               == (0x7fU 
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
                                                        & vlSelf->core__DOT__if_id_pl__DOT__instR))))))))));
            tracep->chgBit(oldp+33,(vlSelf->core__DOT__id_ex_pl__DOT__wenR));
            tracep->chgCData(oldp+34,(((0x13U == (0x707fU 
                                                  & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                        ? 1U : ((0x33U 
                                                 == 
                                                 (0xfe00707fU 
                                                  & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                 ? 1U
                                                 : 
                                                ((0x40000033U 
                                                  == 
                                                  (0xfe00707fU 
                                                   & vlSelf->core__DOT__if_id_pl__DOT__instR))
                                                  ? 1U
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
            tracep->chgCData(oldp+35,(vlSelf->core__DOT__id_ex_pl__DOT__wtypeR),2);
            tracep->chgCData(oldp+36,((0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                >> 0xfU))),5);
            tracep->chgCData(oldp+37,((0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                >> 0x14U))),5);
            tracep->chgQData(oldp+38,(((0U == (0x1fU 
                                               & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                  >> 0xfU)))
                                        ? 0ULL : vlSelf->core__DOT__rf__DOT__rfR
                                       [(0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                  >> 0xfU))])),64);
            tracep->chgBit(oldp+40,(vlSelf->core__DOT__mem_wb_pl__DOT__rf_wenR));
            tracep->chgCData(oldp+41,(vlSelf->core__DOT__mem_wb_pl__DOT__wb_addrR),5);
            tracep->chgQData(oldp+42,(((3U == (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR))
                                        ? vlSelf->core__DOT__mem_wb_pl__DOT__Dmem_rdataR
                                        : vlSelf->core__DOT___wb_data_T_3)),64);
            tracep->chgQData(oldp+44,(vlSelf->core__DOT__ex_mem_pl__DOT__pcR),64);
            tracep->chgIData(oldp+46,(vlSelf->core__DOT__ex_mem_pl__DOT__instR),32);
            tracep->chgQData(oldp+47,(((5U == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                        ? vlSelf->core__DOT___alu_out_T_10
                                        : vlSelf->core__DOT___alu_out_T_20)),64);
            tracep->chgQData(oldp+49,(vlSelf->core__DOT__ex_mem_pl__DOT__alu_outR),64);
            tracep->chgCData(oldp+51,(vlSelf->core__DOT__ex_mem_pl__DOT__wb_addrR),5);
            tracep->chgQData(oldp+52,(vlSelf->core__DOT__ex_mem_pl__DOT__Dmem_wdataR),64);
            tracep->chgBit(oldp+54,(vlSelf->core__DOT__ex_mem_pl__DOT__mem_wenR));
            tracep->chgBit(oldp+55,(vlSelf->core__DOT__ex_mem_pl__DOT__rf_wenR));
            tracep->chgCData(oldp+56,(vlSelf->core__DOT__ex_mem_pl__DOT__wb_selR),2);
            tracep->chgQData(oldp+57,(vlSelf->core__DOT__mem_wb_pl__DOT__pcR),64);
            tracep->chgIData(oldp+59,(vlSelf->core__DOT__mem_wb_pl__DOT__instR),32);
            tracep->chgQData(oldp+60,((4ULL + vlSelf->core__DOT__ex_mem_pl__DOT__pcR)),64);
            tracep->chgQData(oldp+62,(vlSelf->core__DOT__mem_wb_pl__DOT__pcplus4R),64);
            tracep->chgQData(oldp+64,(vlSelf->core__DOT__mem_wb_pl__DOT__aluR),64);
            tracep->chgCData(oldp+66,(vlSelf->core__DOT__mem_wb_pl__DOT__wb_selR),2);
            tracep->chgQData(oldp+67,(vlSelf->core__DOT__mem_wb_pl__DOT__Dmem_rdataR),64);
            tracep->chgBit(oldp+69,(vlSelf->core__DOT__ImemCenR));
            tracep->chgQData(oldp+70,((4ULL + vlSelf->core__DOT__pc_reg)),64);
            tracep->chgBit(oldp+72,((1U & ((0xfU == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                            ? (IData)(vlSelf->core__DOT___hi_T_11)
                                            : ((0x10U 
                                                == (IData)(vlSelf->core__DOT__id_ex_pl__DOT__exeu_op_selR))
                                                ? (~ (IData)(vlSelf->core__DOT___hi_T_11))
                                                : (
                                                   (0xeU 
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
            tracep->chgQData(oldp+73,((vlSelf->core__DOT__id_ex_pl__DOT__pcR 
                                       + vlSelf->core__DOT__id_ex_pl__DOT__immR)),64);
            tracep->chgSData(oldp+75,((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                       >> 0x14U)),12);
            tracep->chgQData(oldp+76,(((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                        >> 0x1fU) ? 0xfffffffffffffULL
                                        : 0ULL)),52);
            tracep->chgQData(oldp+78,(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                          >> 0x1fU)
                                          ? 0xfffffffffffffULL
                                          : 0ULL) << 0xcU) 
                                       | (QData)((IData)(
                                                         (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                          >> 0x14U))))),64);
            tracep->chgCData(oldp+80,((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                       >> 0x19U)),7);
            tracep->chgSData(oldp+81,(((0xfe0U & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                  >> 0x14U)) 
                                       | (0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                   >> 7U)))),12);
            tracep->chgQData(oldp+82,(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                          >> 0x1fU)
                                          ? 0xfffffffffffffULL
                                          : 0ULL) << 0xcU) 
                                       | (QData)((IData)(
                                                         ((0xfe0U 
                                                           & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                              >> 0x14U)) 
                                                          | (0x1fU 
                                                             & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                >> 7U))))))),64);
            tracep->chgIData(oldp+84,((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                       >> 0xcU)),20);
            tracep->chgQData(oldp+85,(((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                        >> 0x1fU) ? 0xfffffffffffULL
                                        : 0ULL)),44);
            __Vtemp42[0U] = ((IData)(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                         >> 0x1fU) ? 0xfffffffffffULL
                                         : 0ULL) << 0x14U) 
                                      | (QData)((IData)(
                                                        (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                         >> 0xcU))))) 
                             << 0xcU);
            __Vtemp42[1U] = (((IData)(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                          >> 0x1fU)
                                          ? 0xfffffffffffULL
                                          : 0ULL) << 0x14U) 
                                       | (QData)((IData)(
                                                         (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                          >> 0xcU))))) 
                              >> 0x14U) | ((IData)(
                                                   (((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                        >> 0x1fU)
                                                        ? 0xfffffffffffULL
                                                        : 0ULL) 
                                                      << 0x14U) 
                                                     | (QData)((IData)(
                                                                       (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                        >> 0xcU)))) 
                                                    >> 0x20U)) 
                                           << 0xcU));
            __Vtemp42[2U] = ((IData)((((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                          >> 0x1fU)
                                          ? 0xfffffffffffULL
                                          : 0ULL) << 0x14U) 
                                       | (QData)((IData)(
                                                         (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                          >> 0xcU)))) 
                                      >> 0x20U)) >> 0x14U);
            tracep->chgWData(oldp+87,(__Vtemp42),76);
            tracep->chgBit(oldp+90,((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                     >> 0x1fU)));
            tracep->chgCData(oldp+91,((0xffU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                >> 0xcU))),8);
            tracep->chgSData(oldp+92,((0x3ffU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                 >> 0x15U))),10);
            tracep->chgBit(oldp+93,((1U & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                           >> 0x14U))));
            tracep->chgIData(oldp+94,(((0x80000U & 
                                        (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                         >> 0xcU)) 
                                       | ((0x7f800U 
                                           & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                              >> 1U)) 
                                          | (0x7ffU 
                                             & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                >> 0x14U))))),20);
            tracep->chgQData(oldp+95,(((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                        >> 0x1fU) ? 0x7ffffffffffULL
                                        : 0ULL)),43);
            tracep->chgQData(oldp+97,(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                          >> 0x1fU)
                                          ? 0x7ffffffffffULL
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
            tracep->chgQData(oldp+99,((QData)((IData)(
                                                      (0x1fU 
                                                       & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                          >> 0xfU))))),64);
            tracep->chgCData(oldp+101,(vlSelf->core__DOT__op1_sel),2);
            tracep->chgCData(oldp+102,(vlSelf->core__DOT__op2_sel),3);
            VL_EXTEND_WQ(76,64, __Vtemp43, ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                               >> 0x1fU)
                                               ? 0xfffffffffffffULL
                                               : 0ULL) 
                                             << 0xcU) 
                                            | (QData)((IData)(
                                                              ((0xfe0U 
                                                                & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                   >> 0x14U)) 
                                                               | (0x1fU 
                                                                  & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                     >> 7U)))))));
            VL_EXTEND_WQ(76,64, __Vtemp44, ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
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
            VL_EXTEND_WQ(76,64, __Vtemp46, ((2U == (IData)(vlSelf->core__DOT__op2_sel))
                                             ? ((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                   >> 0x1fU)
                                                   ? 0xfffffffffffffULL
                                                   : 0ULL) 
                                                 << 0xcU) 
                                                | (QData)((IData)(
                                                                  (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                   >> 0x14U))))
                                             : ((1U 
                                                 == (IData)(vlSelf->core__DOT__op2_sel))
                                                 ? vlSelf->core__DOT__rf_io_channel_rdata2
                                                 : 0ULL)));
            if ((3U == (IData)(vlSelf->core__DOT__op2_sel))) {
                __Vtemp52[0U] = __Vtemp43[0U];
                __Vtemp52[1U] = __Vtemp43[1U];
                __Vtemp52[2U] = __Vtemp43[2U];
            } else {
                __Vtemp52[0U] = ((5U == (IData)(vlSelf->core__DOT__op2_sel))
                                  ? __Vtemp44[0U] : 
                                 ((4U == (IData)(vlSelf->core__DOT__op2_sel))
                                   ? ((IData)(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                  >> 0x1fU)
                                                  ? 0xfffffffffffULL
                                                  : 0ULL) 
                                                << 0x14U) 
                                               | (QData)((IData)(
                                                                 (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                  >> 0xcU))))) 
                                      << 0xcU) : __Vtemp46[0U]));
                __Vtemp52[1U] = ((5U == (IData)(vlSelf->core__DOT__op2_sel))
                                  ? __Vtemp44[1U] : 
                                 ((4U == (IData)(vlSelf->core__DOT__op2_sel))
                                   ? (((IData)(((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                   >> 0x1fU)
                                                   ? 0xfffffffffffULL
                                                   : 0ULL) 
                                                 << 0x14U) 
                                                | (QData)((IData)(
                                                                  (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                   >> 0xcU))))) 
                                       >> 0x14U) | 
                                      ((IData)(((((
                                                   (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                    >> 0x1fU)
                                                    ? 0xfffffffffffULL
                                                    : 0ULL) 
                                                  << 0x14U) 
                                                 | (QData)((IData)(
                                                                   (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                    >> 0xcU)))) 
                                                >> 0x20U)) 
                                       << 0xcU)) : 
                                  __Vtemp46[1U]));
                __Vtemp52[2U] = ((5U == (IData)(vlSelf->core__DOT__op2_sel))
                                  ? __Vtemp44[2U] : 
                                 ((4U == (IData)(vlSelf->core__DOT__op2_sel))
                                   ? ((IData)((((((vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                   >> 0x1fU)
                                                   ? 0xfffffffffffULL
                                                   : 0ULL) 
                                                 << 0x14U) 
                                                | (QData)((IData)(
                                                                  (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                                   >> 0xcU)))) 
                                               >> 0x20U)) 
                                      >> 0x14U) : __Vtemp46[2U]));
            }
            tracep->chgWData(oldp+103,(__Vtemp52),76);
            tracep->chgIData(oldp+106,((IData)(vlSelf->core__DOT__if_id_pl__DOT__pcR)),32);
            tracep->chgQData(oldp+107,((QData)((IData)(vlSelf->core__DOT__mem_wb_pl__DOT__instR))),64);
            tracep->chgQData(oldp+109,(vlSelf->core__DOT__rf__DOT__rfR[0]),64);
            tracep->chgQData(oldp+111,(vlSelf->core__DOT__rf__DOT__rfR[1]),64);
            tracep->chgQData(oldp+113,(vlSelf->core__DOT__rf__DOT__rfR[2]),64);
            tracep->chgQData(oldp+115,(vlSelf->core__DOT__rf__DOT__rfR[3]),64);
            tracep->chgQData(oldp+117,(vlSelf->core__DOT__rf__DOT__rfR[4]),64);
            tracep->chgQData(oldp+119,(vlSelf->core__DOT__rf__DOT__rfR[5]),64);
            tracep->chgQData(oldp+121,(vlSelf->core__DOT__rf__DOT__rfR[6]),64);
            tracep->chgQData(oldp+123,(vlSelf->core__DOT__rf__DOT__rfR[7]),64);
            tracep->chgQData(oldp+125,(vlSelf->core__DOT__rf__DOT__rfR[8]),64);
            tracep->chgQData(oldp+127,(vlSelf->core__DOT__rf__DOT__rfR[9]),64);
            tracep->chgQData(oldp+129,(vlSelf->core__DOT__rf__DOT__rfR[10]),64);
            tracep->chgQData(oldp+131,(vlSelf->core__DOT__rf__DOT__rfR[11]),64);
            tracep->chgQData(oldp+133,(vlSelf->core__DOT__rf__DOT__rfR[12]),64);
            tracep->chgQData(oldp+135,(vlSelf->core__DOT__rf__DOT__rfR[13]),64);
            tracep->chgQData(oldp+137,(vlSelf->core__DOT__rf__DOT__rfR[14]),64);
            tracep->chgQData(oldp+139,(vlSelf->core__DOT__rf__DOT__rfR[15]),64);
            tracep->chgQData(oldp+141,(vlSelf->core__DOT__rf__DOT__rfR[16]),64);
            tracep->chgQData(oldp+143,(vlSelf->core__DOT__rf__DOT__rfR[17]),64);
            tracep->chgQData(oldp+145,(vlSelf->core__DOT__rf__DOT__rfR[18]),64);
            tracep->chgQData(oldp+147,(vlSelf->core__DOT__rf__DOT__rfR[19]),64);
            tracep->chgQData(oldp+149,(vlSelf->core__DOT__rf__DOT__rfR[20]),64);
            tracep->chgQData(oldp+151,(vlSelf->core__DOT__rf__DOT__rfR[21]),64);
            tracep->chgQData(oldp+153,(vlSelf->core__DOT__rf__DOT__rfR[22]),64);
            tracep->chgQData(oldp+155,(vlSelf->core__DOT__rf__DOT__rfR[23]),64);
            tracep->chgQData(oldp+157,(vlSelf->core__DOT__rf__DOT__rfR[24]),64);
            tracep->chgQData(oldp+159,(vlSelf->core__DOT__rf__DOT__rfR[25]),64);
            tracep->chgQData(oldp+161,(vlSelf->core__DOT__rf__DOT__rfR[26]),64);
            tracep->chgQData(oldp+163,(vlSelf->core__DOT__rf__DOT__rfR[27]),64);
            tracep->chgQData(oldp+165,(vlSelf->core__DOT__rf__DOT__rfR[28]),64);
            tracep->chgQData(oldp+167,(vlSelf->core__DOT__rf__DOT__rfR[29]),64);
            tracep->chgQData(oldp+169,(vlSelf->core__DOT__rf__DOT__rfR[30]),64);
            tracep->chgQData(oldp+171,(vlSelf->core__DOT__rf__DOT__rfR[31]),64);
            tracep->chgQData(oldp+173,(vlSelf->core__DOT__rf__DOT__rfR
                                       [(0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                  >> 0xfU))]),64);
            tracep->chgQData(oldp+175,(vlSelf->core__DOT__rf__DOT__rfR
                                       [(0x1fU & (vlSelf->core__DOT__if_id_pl__DOT__instR 
                                                  >> 0x14U))]),64);
            tracep->chgBit(oldp+177,(((IData)(vlSelf->core__DOT__mem_wb_pl__DOT__rf_wenR) 
                                      & (0U != (IData)(vlSelf->core__DOT__mem_wb_pl__DOT__wb_addrR)))));
        }
        tracep->chgBit(oldp+178,(vlSelf->clock));
        tracep->chgBit(oldp+179,(vlSelf->reset));
        tracep->chgBit(oldp+180,(vlSelf->io_Imemio_cen));
        tracep->chgQData(oldp+181,(vlSelf->io_Imemio_pc),64);
        tracep->chgIData(oldp+183,(vlSelf->io_Imemio_inst),32);
        tracep->chgIData(oldp+184,(vlSelf->io_DMemio_addr),32);
        tracep->chgQData(oldp+185,(vlSelf->io_DMemio_rdata),64);
        tracep->chgBit(oldp+187,(vlSelf->io_DMemio_wen));
        tracep->chgQData(oldp+188,(vlSelf->io_DMemio_wdata),64);
        tracep->chgBit(oldp+190,(vlSelf->io_Deubug_Debug_rf_wen));
        tracep->chgCData(oldp+191,(vlSelf->io_Deubug_Debug_rf_waddr),5);
        tracep->chgQData(oldp+192,(vlSelf->io_Deubug_Debug_rf_wdata),64);
        tracep->chgQData(oldp+194,(vlSelf->io_Deubug_Debug_pc),64);
        tracep->chgIData(oldp+196,(vlSelf->io_Deubug_Debug_inst),32);
    }
}

void Vcore___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    Vcore___024root* const __restrict vlSelf = static_cast<Vcore___024root*>(voidSelf);
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        vlSymsp->__Vm_activity = false;
        vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
        vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    }
}
