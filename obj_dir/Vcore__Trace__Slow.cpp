// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VCore__Syms.h"


void VCore___024root__traceInitSub0(VCore___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VCore___024root__traceInitTop(VCore___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VCore___024root__traceInitSub0(vlSelf, tracep);
    }
}

void VCore___024root__traceInitSub0(VCore___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBit(c+152,"clock", false,-1);
        tracep->declBit(c+153,"reset", false,-1);
        tracep->declQuad(c+154,"io_debug_debugPc", false,-1, 63,0);
        tracep->declBus(c+156,"io_debug_debugInst", false,-1, 31,0);
        tracep->declBit(c+157,"io_debug_debugwen", false,-1);
        tracep->declBus(c+158,"io_debug_debugwaddr", false,-1, 4,0);
        tracep->declQuad(c+159,"io_debug_debugdata", false,-1, 63,0);
        tracep->declQuad(c+161,"io_imem_addr", false,-1, 63,0);
        tracep->declBus(c+163,"io_imem_rdata", false,-1, 31,0);
        tracep->declBit(c+164,"io_imem_cen", false,-1);
        tracep->declBit(c+165,"io_imem_wen", false,-1);
        tracep->declQuad(c+166,"io_imem_wdata", false,-1, 63,0);
        tracep->declQuad(c+168,"io_dmem_addr", false,-1, 63,0);
        tracep->declQuad(c+170,"io_dmem_rdata", false,-1, 63,0);
        tracep->declBit(c+172,"io_dmem_cen", false,-1);
        tracep->declBit(c+173,"io_dmem_wen", false,-1);
        tracep->declQuad(c+174,"io_dmem_wdata", false,-1, 63,0);
        tracep->declBit(c+152,"Core clock", false,-1);
        tracep->declBit(c+153,"Core reset", false,-1);
        tracep->declQuad(c+154,"Core io_debug_debugPc", false,-1, 63,0);
        tracep->declBus(c+156,"Core io_debug_debugInst", false,-1, 31,0);
        tracep->declBit(c+157,"Core io_debug_debugwen", false,-1);
        tracep->declBus(c+158,"Core io_debug_debugwaddr", false,-1, 4,0);
        tracep->declQuad(c+159,"Core io_debug_debugdata", false,-1, 63,0);
        tracep->declQuad(c+161,"Core io_imem_addr", false,-1, 63,0);
        tracep->declBus(c+163,"Core io_imem_rdata", false,-1, 31,0);
        tracep->declBit(c+164,"Core io_imem_cen", false,-1);
        tracep->declBit(c+165,"Core io_imem_wen", false,-1);
        tracep->declQuad(c+166,"Core io_imem_wdata", false,-1, 63,0);
        tracep->declQuad(c+168,"Core io_dmem_addr", false,-1, 63,0);
        tracep->declQuad(c+170,"Core io_dmem_rdata", false,-1, 63,0);
        tracep->declBit(c+172,"Core io_dmem_cen", false,-1);
        tracep->declBit(c+173,"Core io_dmem_wen", false,-1);
        tracep->declQuad(c+174,"Core io_dmem_wdata", false,-1, 63,0);
        {int i; for (i=0; i<32; i++) {
                tracep->declQuad(c+1+i*2,"Core gpr", true,(i+0), 63,0);}}
        tracep->declQuad(c+65,"Core gpr_id_rs_ret_MPORT_data", false,-1, 63,0);
        tracep->declBus(c+67,"Core gpr_id_rs_ret_MPORT_addr", false,-1, 4,0);
        tracep->declQuad(c+68,"Core gpr_id_rs_ret_MPORT_1_data", false,-1, 63,0);
        tracep->declBus(c+70,"Core gpr_id_rs_ret_MPORT_1_addr", false,-1, 4,0);
        tracep->declQuad(c+71,"Core gpr_MPORT_data", false,-1, 63,0);
        tracep->declBus(c+73,"Core gpr_MPORT_addr", false,-1, 4,0);
        tracep->declBit(c+183,"Core gpr_MPORT_mask", false,-1);
        tracep->declBit(c+74,"Core gpr_MPORT_en", false,-1);
        tracep->declBus(c+75,"Core GprAddrGen_io_in", false,-1, 31,0);
        tracep->declBus(c+67,"Core GprAddrGen_io_o_rs1", false,-1, 4,0);
        tracep->declBus(c+70,"Core GprAddrGen_io_o_rs2", false,-1, 4,0);
        tracep->declBus(c+76,"Core GprAddrGen_io_o_rd", false,-1, 4,0);
        tracep->declBus(c+77,"Core Alu_io_excTy", false,-1, 6,0);
        tracep->declQuad(c+78,"Core Alu_io_opVec_0", false,-1, 63,0);
        tracep->declQuad(c+80,"Core Alu_io_opVec_1", false,-1, 63,0);
        tracep->declQuad(c+82,"Core Alu_io_result", false,-1, 63,0);
        tracep->declBus(c+156,"Core dpi_inst", false,-1, 31,0);
        tracep->declQuad(c+84,"Core pcreg", false,-1, 63,0);
        tracep->declBit(c+86,"Core cenreg", false,-1);
        tracep->declQuad(c+87,"Core seq_pc", false,-1, 63,0);
        tracep->declBus(c+75,"Core If2IdInst", false,-1, 31,0);
        tracep->declBit(c+89,"Core ctriSigs_deco_10", false,-1);
        tracep->declBus(c+90,"Core ctriSigs_bTy", false,-1, 2,0);
        tracep->declBus(c+91,"Core ctriSigs_deco_2", false,-1, 1,0);
        tracep->declQuad(c+92,"Core If2IdPc", false,-1, 63,0);
        tracep->declBit(c+94,"Core exCtrlSigs_rfwen", false,-1);
        tracep->declBus(c+95,"Core exRd", false,-1, 4,0);
        tracep->declQuad(c+82,"Core exBypassing_wr", false,-1, 63,0);
        tracep->declBit(c+96,"Core ctrlSigsMem_rfwen", false,-1);
        tracep->declBus(c+97,"Core rdMem", false,-1, 4,0);
        tracep->declBus(c+98,"Core ctrlSigsMem_wbdSel", false,-1, 2,0);
        tracep->declQuad(c+99,"Core alu_resultMem", false,-1, 63,0);
        tracep->declQuad(c+176,"Core MemWbData", false,-1, 63,0);
        tracep->declBit(c+101,"Core ctrlSigsWb_rfwen", false,-1);
        tracep->declBus(c+73,"Core wbAddr", false,-1, 4,0);
        tracep->declQuad(c+71,"Core wbData", false,-1, 63,0);
        tracep->declQuad(c+102,"Core id_rs_0", false,-1, 63,0);
        tracep->declBus(c+104,"Core ctriSigs_deco_3", false,-1, 2,0);
        tracep->declBus(c+105,"Core ctriSigs_deco_0", false,-1, 2,0);
        tracep->declBus(c+106,"Core ctriSigs_instTy", false,-1, 31,0);
        tracep->declBit(c+107,"Core imm_sigBit", false,-1);
        tracep->declQuad(c+108,"Core imm_hi_hi_hi", false,-1, 32,0);
        tracep->declBus(c+110,"Core imm_hi_hi_lo", false,-1, 10,0);
        tracep->declBus(c+111,"Core imm_hi_lo_hi", false,-1, 7,0);
        tracep->declBit(c+112,"Core imm_hi_lo_lo", false,-1);
        tracep->declBus(c+113,"Core imm_lo_hi_hi", false,-1, 5,0);
        tracep->declBus(c+114,"Core imm_lo_hi_lo", false,-1, 3,0);
        tracep->declBit(c+115,"Core imm_lo_lo", false,-1);
        tracep->declQuad(c+116,"Core id_rs_1", false,-1, 63,0);
        tracep->declBit(c+178,"Core branchBus_flag", false,-1);
        tracep->declQuad(c+179,"Core jump_target", false,-1, 63,0);
        tracep->declQuad(c+181,"Core branchBus_target", false,-1, 63,0);
        tracep->declBit(c+118,"Core exCtrlSigs_memcen", false,-1);
        tracep->declBus(c+119,"Core exCtrlSigs_memwen", false,-1, 3,0);
        tracep->declBit(c+120,"Core load_stall", false,-1);
        tracep->declBit(c+121,"Core ctriSigs_deco_1", false,-1);
        tracep->declBit(c+122,"Core ctriSigs_deco_6", false,-1);
        tracep->declBus(c+123,"Core ctriSigs_deco_7", false,-1, 1,0);
        tracep->declBus(c+77,"Core exCtrlSigs_excTy", false,-1, 6,0);
        tracep->declBus(c+124,"Core exCtrlSigs_wbdSel", false,-1, 2,0);
        tracep->declQuad(c+78,"Core exOpVec_0", false,-1, 63,0);
        tracep->declQuad(c+80,"Core exOpVec_1", false,-1, 63,0);
        tracep->declQuad(c+125,"Core exPc", false,-1, 63,0);
        tracep->declBus(c+127,"Core exInst", false,-1, 31,0);
        tracep->declQuad(c+128,"Core exStoreData", false,-1, 63,0);
        tracep->declBus(c+130,"Core ctriSigs_wbdSel", false,-1, 2,0);
        tracep->declBus(c+131,"Core ctriSigs_excTy", false,-1, 6,0);
        tracep->declBit(c+132,"Core ctrlSigsMem_memcen", false,-1);
        tracep->declBus(c+133,"Core ctrlSigsMem_memwen", false,-1, 3,0);
        tracep->declQuad(c+134,"Core pcMem", false,-1, 63,0);
        tracep->declBus(c+136,"Core instMem", false,-1, 31,0);
        tracep->declQuad(c+137,"Core storeDataMem", false,-1, 63,0);
        tracep->declQuad(c+139,"Core pcWb", false,-1, 63,0);
        tracep->declBus(c+141,"Core instWb", false,-1, 31,0);
        tracep->declBus(c+75,"Core GprAddrGen io_in", false,-1, 31,0);
        tracep->declBus(c+67,"Core GprAddrGen io_o_rs1", false,-1, 4,0);
        tracep->declBus(c+70,"Core GprAddrGen io_o_rs2", false,-1, 4,0);
        tracep->declBus(c+76,"Core GprAddrGen io_o_rd", false,-1, 4,0);
        tracep->declBus(c+77,"Core Alu io_excTy", false,-1, 6,0);
        tracep->declQuad(c+78,"Core Alu io_opVec_0", false,-1, 63,0);
        tracep->declQuad(c+80,"Core Alu io_opVec_1", false,-1, 63,0);
        tracep->declQuad(c+82,"Core Alu io_result", false,-1, 63,0);
        tracep->declQuad(c+142,"Core Alu op2", false,-1, 63,0);
        tracep->declBus(c+144,"Core Alu add_sub_result_ret_hi", false,-1, 31,0);
        tracep->declBus(c+145,"Core Alu add_sub_result_ret_lo", false,-1, 31,0);
        tracep->declQuad(c+146,"Core Alu add_sub_result_ret", false,-1, 63,0);
        tracep->declQuad(c+148,"Core Alu add_sub_result", false,-1, 63,0);
        tracep->declQuad(c+150,"Core Alu logicShiftResult", false,-1, 63,0);
        tracep->declBus(c+156,"Core dpi inst", false,-1, 31,0);
    }
}

void VCore___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) VL_ATTR_COLD;
void VCore___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep);
void VCore___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/);

void VCore___024root__traceRegister(VCore___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        tracep->addFullCb(&VCore___024root__traceFullTop0, vlSelf);
        tracep->addChgCb(&VCore___024root__traceChgTop0, vlSelf);
        tracep->addCleanupCb(&VCore___024root__traceCleanup, vlSelf);
    }
}

void VCore___024root__traceFullSub0(VCore___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VCore___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) {
    VCore___024root* const __restrict vlSelf = static_cast<VCore___024root*>(voidSelf);
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VCore___024root__traceFullSub0((&vlSymsp->TOP), tracep);
    }
}

void VCore___024root__traceFullSub0(VCore___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VCore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullQData(oldp+1,(vlSelf->Core__DOT__gpr[0]),64);
        tracep->fullQData(oldp+3,(vlSelf->Core__DOT__gpr[1]),64);
        tracep->fullQData(oldp+5,(vlSelf->Core__DOT__gpr[2]),64);
        tracep->fullQData(oldp+7,(vlSelf->Core__DOT__gpr[3]),64);
        tracep->fullQData(oldp+9,(vlSelf->Core__DOT__gpr[4]),64);
        tracep->fullQData(oldp+11,(vlSelf->Core__DOT__gpr[5]),64);
        tracep->fullQData(oldp+13,(vlSelf->Core__DOT__gpr[6]),64);
        tracep->fullQData(oldp+15,(vlSelf->Core__DOT__gpr[7]),64);
        tracep->fullQData(oldp+17,(vlSelf->Core__DOT__gpr[8]),64);
        tracep->fullQData(oldp+19,(vlSelf->Core__DOT__gpr[9]),64);
        tracep->fullQData(oldp+21,(vlSelf->Core__DOT__gpr[10]),64);
        tracep->fullQData(oldp+23,(vlSelf->Core__DOT__gpr[11]),64);
        tracep->fullQData(oldp+25,(vlSelf->Core__DOT__gpr[12]),64);
        tracep->fullQData(oldp+27,(vlSelf->Core__DOT__gpr[13]),64);
        tracep->fullQData(oldp+29,(vlSelf->Core__DOT__gpr[14]),64);
        tracep->fullQData(oldp+31,(vlSelf->Core__DOT__gpr[15]),64);
        tracep->fullQData(oldp+33,(vlSelf->Core__DOT__gpr[16]),64);
        tracep->fullQData(oldp+35,(vlSelf->Core__DOT__gpr[17]),64);
        tracep->fullQData(oldp+37,(vlSelf->Core__DOT__gpr[18]),64);
        tracep->fullQData(oldp+39,(vlSelf->Core__DOT__gpr[19]),64);
        tracep->fullQData(oldp+41,(vlSelf->Core__DOT__gpr[20]),64);
        tracep->fullQData(oldp+43,(vlSelf->Core__DOT__gpr[21]),64);
        tracep->fullQData(oldp+45,(vlSelf->Core__DOT__gpr[22]),64);
        tracep->fullQData(oldp+47,(vlSelf->Core__DOT__gpr[23]),64);
        tracep->fullQData(oldp+49,(vlSelf->Core__DOT__gpr[24]),64);
        tracep->fullQData(oldp+51,(vlSelf->Core__DOT__gpr[25]),64);
        tracep->fullQData(oldp+53,(vlSelf->Core__DOT__gpr[26]),64);
        tracep->fullQData(oldp+55,(vlSelf->Core__DOT__gpr[27]),64);
        tracep->fullQData(oldp+57,(vlSelf->Core__DOT__gpr[28]),64);
        tracep->fullQData(oldp+59,(vlSelf->Core__DOT__gpr[29]),64);
        tracep->fullQData(oldp+61,(vlSelf->Core__DOT__gpr[30]),64);
        tracep->fullQData(oldp+63,(vlSelf->Core__DOT__gpr[31]),64);
        tracep->fullQData(oldp+65,(vlSelf->Core__DOT__gpr
                                   [(0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                              >> 0xfU))]),64);
        tracep->fullCData(oldp+67,((0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                             >> 0xfU))),5);
        tracep->fullQData(oldp+68,(vlSelf->Core__DOT__gpr
                                   [(0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                              >> 0x14U))]),64);
        tracep->fullCData(oldp+70,((0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                             >> 0x14U))),5);
        tracep->fullQData(oldp+71,(vlSelf->Core__DOT__wbData),64);
        tracep->fullCData(oldp+73,(vlSelf->Core__DOT__wbAddr),5);
        tracep->fullBit(oldp+74,(((0U != (IData)(vlSelf->Core__DOT__wbAddr)) 
                                  & (IData)(vlSelf->Core__DOT__ctrlSigsWb_rfwen))));
        tracep->fullIData(oldp+75,(vlSelf->Core__DOT__If2IdInst),32);
        tracep->fullCData(oldp+76,((0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                             >> 7U))),5);
        tracep->fullCData(oldp+77,(vlSelf->Core__DOT__exCtrlSigs_excTy),7);
        tracep->fullQData(oldp+78,(vlSelf->Core__DOT__exOpVec_0),64);
        tracep->fullQData(oldp+80,(vlSelf->Core__DOT__exOpVec_1),64);
        tracep->fullQData(oldp+82,(vlSelf->Core__DOT__Alu_io_result),64);
        tracep->fullQData(oldp+84,(vlSelf->Core__DOT__pcreg),64);
        tracep->fullBit(oldp+86,(vlSelf->Core__DOT__cenreg));
        tracep->fullQData(oldp+87,((4ULL + vlSelf->Core__DOT__pcreg)),64);
        tracep->fullBit(oldp+89,(((0x13U != (0x707fU 
                                             & vlSelf->Core__DOT__If2IdInst)) 
                                  & ((0x17U != (0x7fU 
                                                & vlSelf->Core__DOT__If2IdInst)) 
                                     & ((0x37U != (0x7fU 
                                                   & vlSelf->Core__DOT__If2IdInst)) 
                                        & ((0x6fU != 
                                            (0x7fU 
                                             & vlSelf->Core__DOT__If2IdInst)) 
                                           & ((0x67U 
                                               != (0x707fU 
                                                   & vlSelf->Core__DOT__If2IdInst)) 
                                              & (0x63U 
                                                 == 
                                                 (0x707fU 
                                                  & vlSelf->Core__DOT__If2IdInst)))))))));
        tracep->fullCData(oldp+90,(((0x13U != (0x707fU 
                                               & vlSelf->Core__DOT__If2IdInst)) 
                                    & ((0x17U != (0x7fU 
                                                  & vlSelf->Core__DOT__If2IdInst)) 
                                       & ((0x37U != 
                                           (0x7fU & vlSelf->Core__DOT__If2IdInst)) 
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
                                                    & vlSelf->Core__DOT__If2IdInst)))))))),3);
        tracep->fullCData(oldp+91,(vlSelf->Core__DOT__ctriSigs_deco_2),2);
        tracep->fullQData(oldp+92,(vlSelf->Core__DOT__If2IdPc),64);
        tracep->fullBit(oldp+94,(vlSelf->Core__DOT__exCtrlSigs_rfwen));
        tracep->fullCData(oldp+95,(vlSelf->Core__DOT__exRd),5);
        tracep->fullBit(oldp+96,(vlSelf->Core__DOT__ctrlSigsMem_rfwen));
        tracep->fullCData(oldp+97,(vlSelf->Core__DOT__rdMem),5);
        tracep->fullCData(oldp+98,(vlSelf->Core__DOT__ctrlSigsMem_wbdSel),3);
        tracep->fullQData(oldp+99,(vlSelf->Core__DOT__alu_resultMem),64);
        tracep->fullBit(oldp+101,(vlSelf->Core__DOT__ctrlSigsWb_rfwen));
        tracep->fullQData(oldp+102,(((0U == (0x1fU 
                                             & (vlSelf->Core__DOT__If2IdInst 
                                                >> 0xfU)))
                                      ? 0ULL : vlSelf->Core__DOT__gpr
                                     [(0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                                >> 0xfU))])),64);
        tracep->fullCData(oldp+104,(vlSelf->Core__DOT__ctriSigs_deco_3),3);
        tracep->fullCData(oldp+105,(vlSelf->Core__DOT__ctriSigs_deco_0),3);
        tracep->fullIData(oldp+106,(vlSelf->Core__DOT__ctriSigs_deco_0),32);
        tracep->fullBit(oldp+107,(vlSelf->Core__DOT__imm_sigBit));
        tracep->fullQData(oldp+108,(((IData)(vlSelf->Core__DOT__imm_sigBit)
                                      ? 0x1ffffffffULL
                                      : 0ULL)),33);
        tracep->fullSData(oldp+110,((0x7ffU & ((5U 
                                                == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                                ? (vlSelf->Core__DOT__If2IdInst 
                                                   >> 0x14U)
                                                : ((IData)(vlSelf->Core__DOT__imm_sigBit)
                                                    ? 0x7ffU
                                                    : 0U)))),11);
        tracep->fullCData(oldp+111,((0xffU & (((5U 
                                                != (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                               & (4U 
                                                  != (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)))
                                               ? ((IData)(vlSelf->Core__DOT__imm_sigBit)
                                                   ? 0xffU
                                                   : 0U)
                                               : (vlSelf->Core__DOT__If2IdInst 
                                                  >> 0xcU)))),8);
        tracep->fullBit(oldp+112,((1U & ((2U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                          ? (vlSelf->Core__DOT__If2IdInst 
                                             >> 7U)
                                          : ((4U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                              ? (vlSelf->Core__DOT__If2IdInst 
                                                 >> 0x14U)
                                              : ((~ 
                                                  ((5U 
                                                    == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                                   | (6U 
                                                      == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)))) 
                                                 & (IData)(vlSelf->Core__DOT__imm_sigBit)))))));
        tracep->fullCData(oldp+113,((((5U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                      | (6U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)))
                                      ? 0U : (0x3fU 
                                              & (vlSelf->Core__DOT__If2IdInst 
                                                 >> 0x19U)))),6);
        tracep->fullCData(oldp+114,(((5U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
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
        tracep->fullBit(oldp+115,((1U & ((3U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                          ? (vlSelf->Core__DOT__If2IdInst 
                                             >> 7U)
                                          : ((1U == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0))
                                              ? (vlSelf->Core__DOT__If2IdInst 
                                                 >> 0x14U)
                                              : ((6U 
                                                  == (IData)(vlSelf->Core__DOT__ctriSigs_deco_0)) 
                                                 & (vlSelf->Core__DOT__If2IdInst 
                                                    >> 0xfU)))))));
        tracep->fullQData(oldp+116,(((0U == (0x1fU 
                                             & (vlSelf->Core__DOT__If2IdInst 
                                                >> 0x14U)))
                                      ? 0ULL : vlSelf->Core__DOT__gpr
                                     [(0x1fU & (vlSelf->Core__DOT__If2IdInst 
                                                >> 0x14U))])),64);
        tracep->fullBit(oldp+118,(vlSelf->Core__DOT__exCtrlSigs_memcen));
        tracep->fullCData(oldp+119,(vlSelf->Core__DOT__exCtrlSigs_memwen),4);
        tracep->fullBit(oldp+120,(vlSelf->Core__DOT__load_stall));
        tracep->fullBit(oldp+121,(((0x13U == (0x707fU 
                                              & vlSelf->Core__DOT__If2IdInst)) 
                                   | ((0x17U == (0x7fU 
                                                 & vlSelf->Core__DOT__If2IdInst)) 
                                      | ((0x37U == 
                                          (0x7fU & vlSelf->Core__DOT__If2IdInst)) 
                                         | ((0x6fU 
                                             == (0x7fU 
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
        tracep->fullBit(oldp+122,(((0x13U == (0x707fU 
                                              & vlSelf->Core__DOT__If2IdInst)) 
                                   | ((0x17U == (0x7fU 
                                                 & vlSelf->Core__DOT__If2IdInst)) 
                                      | ((0x37U == 
                                          (0x7fU & vlSelf->Core__DOT__If2IdInst)) 
                                         | ((0x6fU 
                                             == (0x7fU 
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
        tracep->fullCData(oldp+123,(((0x13U == (0x707fU 
                                                & vlSelf->Core__DOT__If2IdInst))
                                      ? 1U : ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->Core__DOT__If2IdInst))
                                               ? 1U
                                               : ((0x37U 
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
        tracep->fullCData(oldp+124,(vlSelf->Core__DOT__exCtrlSigs_wbdSel),3);
        tracep->fullQData(oldp+125,(vlSelf->Core__DOT__exPc),64);
        tracep->fullIData(oldp+127,(vlSelf->Core__DOT__exInst),32);
        tracep->fullQData(oldp+128,(vlSelf->Core__DOT__exStoreData),64);
        tracep->fullCData(oldp+130,(((0x13U == (0x707fU 
                                                & vlSelf->Core__DOT__If2IdInst))
                                      ? 1U : ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->Core__DOT__If2IdInst))
                                               ? 1U
                                               : ((0x37U 
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
        tracep->fullCData(oldp+131,(((0x13U == (0x707fU 
                                                & vlSelf->Core__DOT__If2IdInst)) 
                                     | ((0x17U == (0x7fU 
                                                   & vlSelf->Core__DOT__If2IdInst)) 
                                        | ((0x37U == 
                                            (0x7fU 
                                             & vlSelf->Core__DOT__If2IdInst)) 
                                           | ((0x6fU 
                                               == (0x7fU 
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
        tracep->fullBit(oldp+132,(vlSelf->Core__DOT__ctrlSigsMem_memcen));
        tracep->fullCData(oldp+133,(vlSelf->Core__DOT__ctrlSigsMem_memwen),4);
        tracep->fullQData(oldp+134,(vlSelf->Core__DOT__pcMem),64);
        tracep->fullIData(oldp+136,(vlSelf->Core__DOT__instMem),32);
        tracep->fullQData(oldp+137,(vlSelf->Core__DOT__storeDataMem),64);
        tracep->fullQData(oldp+139,(vlSelf->Core__DOT__pcWb),64);
        tracep->fullIData(oldp+141,(vlSelf->Core__DOT__instWb),32);
        tracep->fullQData(oldp+142,(vlSelf->Core__DOT__Alu__DOT__op2),64);
        tracep->fullIData(oldp+144,(((1U & (IData)(
                                                   (vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1 
                                                    >> 0x1fU)))
                                      ? 0xffffffffU
                                      : 0U)),32);
        tracep->fullIData(oldp+145,((IData)(vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1)),32);
        tracep->fullQData(oldp+146,((((QData)((IData)(
                                                      ((1U 
                                                        & (IData)(
                                                                  (vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1 
                                                                   >> 0x1fU)))
                                                        ? 0xffffffffU
                                                        : 0U))) 
                                      << 0x20U) | (QData)((IData)(vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1)))),64);
        tracep->fullQData(oldp+148,(((4U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
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
                                          : ((1U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
                                              ? vlSelf->Core__DOT__Alu__DOT___add_sub_result_T_1
                                              : 0ULL)))),64);
        tracep->fullQData(oldp+150,(((5U == (IData)(vlSelf->Core__DOT__exCtrlSigs_excTy))
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
        tracep->fullBit(oldp+152,(vlSelf->clock));
        tracep->fullBit(oldp+153,(vlSelf->reset));
        tracep->fullQData(oldp+154,(vlSelf->io_debug_debugPc),64);
        tracep->fullIData(oldp+156,(vlSelf->io_debug_debugInst),32);
        tracep->fullBit(oldp+157,(vlSelf->io_debug_debugwen));
        tracep->fullCData(oldp+158,(vlSelf->io_debug_debugwaddr),5);
        tracep->fullQData(oldp+159,(vlSelf->io_debug_debugdata),64);
        tracep->fullQData(oldp+161,(vlSelf->io_imem_addr),64);
        tracep->fullIData(oldp+163,(vlSelf->io_imem_rdata),32);
        tracep->fullBit(oldp+164,(vlSelf->io_imem_cen));
        tracep->fullBit(oldp+165,(vlSelf->io_imem_wen));
        tracep->fullQData(oldp+166,(vlSelf->io_imem_wdata),64);
        tracep->fullQData(oldp+168,(vlSelf->io_dmem_addr),64);
        tracep->fullQData(oldp+170,(vlSelf->io_dmem_rdata),64);
        tracep->fullBit(oldp+172,(vlSelf->io_dmem_cen));
        tracep->fullBit(oldp+173,(vlSelf->io_dmem_wen));
        tracep->fullQData(oldp+174,(vlSelf->io_dmem_wdata),64);
        tracep->fullQData(oldp+176,(vlSelf->Core__DOT__MemWbData),64);
        tracep->fullBit(oldp+178,(vlSelf->Core__DOT__branchBus_flag));
        tracep->fullQData(oldp+179,((vlSelf->Core__DOT___opVec_0_T 
                                     + vlSelf->Core__DOT___opVec_1_T_1)),64);
        tracep->fullQData(oldp+181,(((0x67U == (0x707fU 
                                                & vlSelf->Core__DOT__If2IdInst))
                                      ? (0xfffffffffffffffeULL 
                                         & (vlSelf->Core__DOT___opVec_0_T 
                                            + vlSelf->Core__DOT___opVec_1_T_1))
                                      : (vlSelf->Core__DOT__If2IdPc 
                                         + vlSelf->Core__DOT___opVec_1_T_1))),64);
        tracep->fullBit(oldp+183,(1U));
    }
}
