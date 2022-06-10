// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VCore__Syms.h"


void VCore___024root__traceChgSub0(VCore___024root* vlSelf, VerilatedVcd* tracep);

void VCore___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep) {
    VCore___024root* const __restrict vlSelf = static_cast<VCore___024root*>(voidSelf);
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    {
        VCore___024root__traceChgSub0((&vlSymsp->TOP), tracep);
    }
}

void VCore___024root__traceChgSub0(VCore___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
            tracep->chgQData(oldp+0,(vlSelf->Core__DOT__gpr[0]),64);
            tracep->chgQData(oldp+2,(vlSelf->Core__DOT__gpr[1]),64);
            tracep->chgQData(oldp+4,(vlSelf->Core__DOT__gpr[2]),64);
            tracep->chgQData(oldp+6,(vlSelf->Core__DOT__gpr[3]),64);
            tracep->chgQData(oldp+8,(vlSelf->Core__DOT__gpr[4]),64);
            tracep->chgQData(oldp+10,(vlSelf->Core__DOT__gpr[5]),64);
            tracep->chgQData(oldp+12,(vlSelf->Core__DOT__gpr[6]),64);
            tracep->chgQData(oldp+14,(vlSelf->Core__DOT__gpr[7]),64);
            tracep->chgQData(oldp+16,(vlSelf->Core__DOT__gpr[8]),64);
            tracep->chgQData(oldp+18,(vlSelf->Core__DOT__gpr[9]),64);
            tracep->chgQData(oldp+20,(vlSelf->Core__DOT__gpr[10]),64);
            tracep->chgQData(oldp+22,(vlSelf->Core__DOT__gpr[11]),64);
            tracep->chgQData(oldp+24,(vlSelf->Core__DOT__gpr[12]),64);
            tracep->chgQData(oldp+26,(vlSelf->Core__DOT__gpr[13]),64);
            tracep->chgQData(oldp+28,(vlSelf->Core__DOT__gpr[14]),64);
            tracep->chgQData(oldp+30,(vlSelf->Core__DOT__gpr[15]),64);
            tracep->chgQData(oldp+32,(vlSelf->Core__DOT__gpr[16]),64);
            tracep->chgQData(oldp+34,(vlSelf->Core__DOT__gpr[17]),64);
            tracep->chgQData(oldp+36,(vlSelf->Core__DOT__gpr[18]),64);
            tracep->chgQData(oldp+38,(vlSelf->Core__DOT__gpr[19]),64);
            tracep->chgQData(oldp+40,(vlSelf->Core__DOT__gpr[20]),64);
            tracep->chgQData(oldp+42,(vlSelf->Core__DOT__gpr[21]),64);
            tracep->chgQData(oldp+44,(vlSelf->Core__DOT__gpr[22]),64);
            tracep->chgQData(oldp+46,(vlSelf->Core__DOT__gpr[23]),64);
            tracep->chgQData(oldp+48,(vlSelf->Core__DOT__gpr[24]),64);
            tracep->chgQData(oldp+50,(vlSelf->Core__DOT__gpr[25]),64);
            tracep->chgQData(oldp+52,(vlSelf->Core__DOT__gpr[26]),64);
            tracep->chgQData(oldp+54,(vlSelf->Core__DOT__gpr[27]),64);
            tracep->chgQData(oldp+56,(vlSelf->Core__DOT__gpr[28]),64);
            tracep->chgQData(oldp+58,(vlSelf->Core__DOT__gpr[29]),64);
            tracep->chgQData(oldp+60,(vlSelf->Core__DOT__gpr[30]),64);
            tracep->chgQData(oldp+62,(vlSelf->Core__DOT__gpr[31]),64);
            tracep->chgQData(oldp+64,(vlSelf->Core__DOT__gpr
                                      [(0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                                 >> 0xfU))]),64);
            tracep->chgCData(oldp+66,((0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                                >> 0xfU))),5);
            tracep->chgQData(oldp+67,(vlSelf->Core__DOT__gpr
                                      [(0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                                 >> 0x14U))]),64);
            tracep->chgCData(oldp+69,((0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                                >> 0x14U))),5);
            tracep->chgQData(oldp+70,(vlSelf->Core__DOT__wbData),64);
            tracep->chgCData(oldp+72,(vlSelf->Core__DOT__wbAddr),5);
            tracep->chgBit(oldp+73,(((0U != (IData)(vlSelf->Core__DOT__wbAddr)) 
                                     & (IData)(vlSelf->Core__DOT__ctrlSigsWb_rfwen))));
            tracep->chgIData(oldp+74,(vlSelf->Core__DOT__If2IdInst),32);
            tracep->chgCData(oldp+75,((0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                                >> 7U))),5);
            tracep->chgCData(oldp+76,(vlSelf->Core__DOT__exCtrlSigs_excTy),7);
            tracep->chgQData(oldp+77,(vlSelf->Core__DOT__exOpVec_0),64);
            tracep->chgQData(oldp+79,(vlSelf->Core__DOT__exOpVec_1),64);
            tracep->chgQData(oldp+81,(vlSelf->Core__DOT__Alu_io_result),64);
            tracep->chgQData(oldp+83,(vlSelf->Core__DOT__pcreg),64);
            tracep->chgBit(oldp+85,(vlSelf->Core__DOT__cenreg));
            tracep->chgQData(oldp+86,((4ULL + vlSelf->Core__DOT__pcreg)),64);
            tracep->chgBit(oldp+88,(((0x13U != (0x707fU 
                                                & vlSelf->Core__DOT__If2IdInst)) 
                                     & ((0x17U != (0x7fU 
                                                   & vlSelf->Core__DOT__If2IdInst)) 
                                        & ((0x37U != 
                                            (0x7fU 
                                             & vlSelf->Core__DOT__If2IdInst)) 
                                           & ((0x6fU 
                                               != (0x7fU 
                                                   & vlSelf->Core__DOT__If2IdInst)) 
                                              & ((0x67U 
                                                  != 
                                                  (0x707fU 
                                                   & vlSelf->Core__DOT__If2IdInst)) 
                                                 & (0x63U 
                                                    == 
                                                    (0x707fU 
                                                     & vlSelf->Core__DOT__If2IdInst)))))))));
            tracep->chgCData(oldp+89,(((0x13U != (0x707fU 
                                                  & vlSelf->Core__DOT__If2IdInst)) 
                                       & ((0x17U != 
                                           (0x7fU & vlSelf->Core__DOT__If2IdInst)) 
                                          & ((0x37U 
                                              != (0x7fU 
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
                                                       & vlSelf->Core__DOT__If2IdInst)))))))),3);
            tracep->chgCData(oldp+90,(vlSelf->Core__DOT__ctriSigs_deco_2),2);
            tracep->chgQData(oldp+91,(vlSelf->Core__DOT__If2IdPc),64);
            tracep->chgBit(oldp+93,(vlSelf->Core__DOT__exCtrlSigs_rfwen));
            tracep->chgCData(oldp+94,(vlSelf->Core__DOT__exRd),5);
            tracep->chgBit(oldp+95,(vlSelf->Core__DOT__ctrlSigsMem_rfwen));
            tracep->chgCData(oldp+96,(vlSelf->Core__DOT__rdMem),5);
            tracep->chgCData(oldp+97,(vlSelf->Core__DOT__ctrlSigsMem_wbdSel),3);
            tracep->chgQData(oldp+98,(vlSelf->Core__DOT__alu_resultMem),64);
            tracep->chgBit(oldp+100,(vlSelf->Core__DOT__ctrlSigsWb_rfwen));
            tracep->chgQData(oldp+101,(((0U == (0x1fU 
                                                & (vlSelf->Core__DOT__If2IdInst 
                                                   >> 0xfU)))
                                         ? 0ULL : vlSelf->Core__DOT__gpr
                                        [(0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                                   >> 0xfU))])),64);
            tracep->chgCData(oldp+103,(vlSelf->Core__DOT__ctriSigs_deco_3),3);
            tracep->chgCData(oldp+104,(vlSelf->Core__DOT__ctriSigs_deco_0),3);
            tracep->chgIData(oldp+105,(vlSelf->Core__DOT__ctriSigs_deco_0),32);
            tracep->chgBit(oldp+106,(vlSelf->Core__DOT__imm_sigBit));
            tracep->chgQData(oldp+107,(((IData)(vlSelf->Core__DOT__imm_sigBit)
                                         ? 0x1ffffffffULL
                                         : 0ULL)),33);
            tracep->chgSData(oldp+109,((0x7ffU & ((5U 
                                                   == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                                   ? 
                                                  (vlSelf->Core__DOT__If2IdInst 
                                                   >> 0x14U)
                                                   : 
                                                  ((IData)(vlSelf->Core__DOT__imm_sigBit)
                                                    ? 0x7ffU
                                                    : 0U)))),11);
            tracep->chgCData(oldp+110,((0xffU & (((5U 
                                                   != (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                                  & (4U 
                                                     != (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)))
                                                  ? 
                                                 ((IData)(vlSelf->Core__DOT__imm_sigBit)
                                                   ? 0xffU
                                                   : 0U)
                                                  : 
                                                 (vlSelf->Core__DOT__If2IdInst 
                                                  >> 0xcU)))),8);
            tracep->chgBit(oldp+111,((1U & ((2U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                             ? (vlSelf->Core__DOT__If2IdInst 
                                                >> 7U)
                                             : ((4U 
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
                                                 & (IData)(vlSelf->Core__DOT__imm_sigBit)))))));
            tracep->chgCData(oldp+112,((((5U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                         | (6U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)))
                                         ? 0U : (0x3fU 
                                                 & (vlSelf->Core__DOT__If2IdInst 
                                                    >> 0x19U)))),6);
            tracep->chgCData(oldp+113,(((5U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                         ? 0U : (0xfU 
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
                                                      >> 0x15U)))))),4);
            tracep->chgBit(oldp+114,((1U & ((3U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                             ? (vlSelf->Core__DOT__If2IdInst 
                                                >> 7U)
                                             : ((1U 
                                                 == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                                 ? 
                                                (vlSelf->Core__DOT__If2IdInst 
                                                 >> 0x14U)
                                                 : 
                                                ((6U 
                                                  == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                                 & (vlSelf->Core__DOT__If2IdInst 
                                                    >> 0xfU)))))));
            tracep->chgQData(oldp+115,(((0U == (0x1fU 
                                                & (vlSelf->Core__DOT__If2IdInst 
                                                   >> 0x14U)))
                                         ? 0ULL : vlSelf->Core__DOT__gpr
                                        [(0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                                   >> 0x14U))])),64);
            tracep->chgBit(oldp+117,(vlSelf->Core__DOT__exCtrlSigs_memcen));
            tracep->chgCData(oldp+118,(vlSelf->Core__DOT__exCtrlSigs_memwen),4);
            tracep->chgBit(oldp+119,(vlSelf->Core__DOT__load_stall));
            tracep->chgBit(oldp+120,(((0x13U == (0x707fU 
                                                 & vlSelf->Core__DOT__If2IdInst)) 
                                      | ((0x17U == 
                                          (0x7fU & vlSelf->Core__DOT__If2IdInst)) 
                                         | ((0x37U 
                                             == (0x7fU 
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
                                                               & vlSelf->Core__DOT__If2IdInst))))))))))));
            tracep->chgBit(oldp+121,(((0x13U == (0x707fU 
                                                 & vlSelf->Core__DOT__If2IdInst)) 
                                      | ((0x17U == 
                                          (0x7fU & vlSelf->Core__DOT__If2IdInst)) 
                                         | ((0x37U 
                                             == (0x7fU 
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
            tracep->chgCData(oldp+122,(((0x13U == (0x707fU 
                                                   & vlSelf->Core__DOT__If2IdInst))
                                         ? 1U : ((0x17U 
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
                                                       : 0U)))))))),2);
            tracep->chgCData(oldp+123,(vlSelf->Core__DOT__exCtrlSigs_wbdSel),3);
            tracep->chgQData(oldp+124,(vlSelf->Core__DOT__exPc),64);
            tracep->chgIData(oldp+126,(vlSelf->Core__DOT__exInst),32);
            tracep->chgQData(oldp+127,(vlSelf->Core__DOT__exStoreData),64);
            tracep->chgCData(oldp+129,(((0x13U == (0x707fU 
                                                   & vlSelf->Core__DOT__If2IdInst))
                                         ? 1U : ((0x17U 
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
                                                       : 0U)))))))),3);
            tracep->chgCData(oldp+130,(((0x13U == (0x707fU 
                                                   & vlSelf->Core__DOT__If2IdInst)) 
                                        | ((0x17U == 
                                            (0x7fU 
                                             & vlSelf->Core__DOT__If2IdInst)) 
                                           | ((0x37U 
                                               == (0x7fU 
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
                                                                 & vlSelf->Core__DOT__If2IdInst))))))))))),7);
            tracep->chgBit(oldp+131,(vlSelf->Core__DOT__ctrlSigsMem_memcen));
            tracep->chgCData(oldp+132,(vlSelf->Core__DOT__ctrlSigsMem_memwen),4);
            tracep->chgQData(oldp+133,(vlSelf->Core__DOT__pcMem),64);
            tracep->chgIData(oldp+135,(vlSelf->Core__DOT__instMem),32);
            tracep->chgQData(oldp+136,(vlSelf->Core__DOT__storeDataMem),64);
            tracep->chgQData(oldp+138,(vlSelf->Core__DOT__pcWb),64);
            tracep->chgIData(oldp+140,(vlSelf->Core__DOT__instWb),32);
            tracep->chgQData(oldp+141,(vlSelf->Core__DOT__Alu__DOT__op2),64);
            tracep->chgIData(oldp+143,(((1U & (IData)(
                                                      (vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1 
                                                       >> 0x1fU)))
                                         ? 0xffffffffU
                                         : 0U)),32);
            tracep->chgIData(oldp+144,((IData)(vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1)),32);
            tracep->chgQData(oldp+145,((((QData)((IData)(
                                                         ((1U 
                                                           & (IData)(
                                                                     (vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1 
                                                                      >> 0x1fU)))
                                                           ? 0xffffffffU
                                                           : 0U))) 
                                         << 0x20U) 
                                        | (QData)((IData)(vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1)))),64);
            tracep->chgQData(oldp+147,(((4U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                         ? (((QData)((IData)(
                                                             ((1U 
                                                               & (IData)(
                                                                         (vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1 
                                                                          >> 0x1fU)))
                                                               ? 0xffffffffU
                                                               : 0U))) 
                                             << 0x20U) 
                                            | (QData)((IData)(vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1)))
                                         : ((2U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                             ? vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1
                                             : ((1U 
                                                 == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                                 ? vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1
                                                 : 0ULL)))),64);
            tracep->chgQData(oldp+149,(((5U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                         ? (QData)((IData)(
                                                           (vlSelf->Core__DOT__exOpVec_0 
                                                            < vlSelf->Core__DOT__Alu__DOT__op2)))
                                         : ((3U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                             ? (QData)((IData)(
                                                               VL_LTS_IQQ(1,64,64, vlSelf->Core__DOT__exOpVec_0, 
                                                                          ((2U 
                                                                            == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                                                            ? 
                                                                           (1ULL 
                                                                            + 
                                                                            (~ vlSelf->Core__DOT__exOpVec_1))
                                                                            : vlSelf->Core__DOT__exOpVec_1))))
                                             : 0ULL))),64);
        }
        tracep->chgBit(oldp+151,(vlSelf->clock));
        tracep->chgBit(oldp+152,(vlSelf->reset));
        tracep->chgQData(oldp+153,(vlSelf->io_debug_debugPc),64);
        tracep->chgIData(oldp+155,(vlSelf->io_debug_debugInst),32);
        tracep->chgBit(oldp+156,(vlSelf->io_debug_debugwen));
        tracep->chgCData(oldp+157,(vlSelf->io_debug_debugwaddr),5);
        tracep->chgQData(oldp+158,(vlSelf->io_debug_debugdata),64);
        tracep->chgQData(oldp+160,(vlSelf->io_imem_addr),64);
        tracep->chgIData(oldp+162,(vlSelf->io_imem_rdata),32);
        tracep->chgBit(oldp+163,(vlSelf->io_imem_cen));
        tracep->chgBit(oldp+164,(vlSelf->io_imem_wen));
        tracep->chgQData(oldp+165,(vlSelf->io_imem_wdata),64);
        tracep->chgQData(oldp+167,(vlSelf->io_dmem_addr),64);
        tracep->chgQData(oldp+169,(vlSelf->io_dmem_rdata),64);
        tracep->chgBit(oldp+171,(vlSelf->io_dmem_cen));
        tracep->chgBit(oldp+172,(vlSelf->io_dmem_wen));
        tracep->chgQData(oldp+173,(vlSelf->io_dmem_wdata),64);
        tracep->chgQData(oldp+175,(vlSelf->Core__DOT__MemWbData),64);
        tracep->chgBit(oldp+177,(vlSelf->Core__DOT__branchBus_flag));
        tracep->chgQData(oldp+178,((vlSelf->Core__DOT___opVec_0_T 
                                    + vlSelf->Core__DOT___opVec_1_T_1)),64);
        tracep->chgQData(oldp+180,(((0x67U == (0x707fU 
                                               & vlSelf->Core__DOT__If2IdInst))
                                     ? (0xfffffffffffffffeULL 
                                        & (vlSelf->Core__DOT___opVec_0_T 
                                           + vlSelf->Core__DOT___opVec_1_T_1))
                                     : (vlSelf->Core__DOT__If2IdPc 
                                        + vlSelf->Core__DOT___opVec_1_T_1))),64);
    }
}

void VCore___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VCore___024root* const __restrict vlSelf = static_cast<VCore___024root*>(voidSelf);
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        vlSymsp->__Vm_activity = false;
        vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
        vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    }
}
