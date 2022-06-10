// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VCore.h for the primary calling header

#ifndef VERILATED_VCORE___024ROOT_H_
#define VERILATED_VCORE___024ROOT_H_  // guard

#include "verilated_heavy.h"

//==========

class VCore__Syms;
class VCore_VerilatedVcd;


//----------

VL_MODULE(VCore___024root) {
  public:

    // PORTS
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_OUT8(io_debug_debugwen,0,0);
    VL_OUT8(io_debug_debugwaddr,4,0);
    VL_OUT8(io_imem_cen,0,0);
    VL_OUT8(io_imem_wen,0,0);
    VL_OUT8(io_dmem_cen,0,0);
    VL_OUT8(io_dmem_wen,0,0);
    VL_OUT(io_debug_debugInst,31,0);
    VL_IN(io_imem_rdata,31,0);
    VL_OUT64(io_debug_debugPc,63,0);
    VL_OUT64(io_debug_debugdata,63,0);
    VL_OUT64(io_imem_addr,63,0);
    VL_OUT64(io_imem_wdata,63,0);
    VL_OUT64(io_dmem_addr,63,0);
    VL_IN64(io_dmem_rdata,63,0);
    VL_OUT64(io_dmem_wdata,63,0);

    // LOCAL SIGNALS
    CData/*0:0*/ Core__DOT__cenreg;
    CData/*1:0*/ Core__DOT__ctriSigs_deco_2;
    CData/*0:0*/ Core__DOT__exCtrlSigs_rfwen;
    CData/*4:0*/ Core__DOT__exRd;
    CData/*0:0*/ Core__DOT__ctrlSigsMem_rfwen;
    CData/*4:0*/ Core__DOT__rdMem;
    CData/*2:0*/ Core__DOT__ctrlSigsMem_wbdSel;
    CData/*0:0*/ Core__DOT__ctrlSigsWb_rfwen;
    CData/*4:0*/ Core__DOT__wbAddr;
    CData/*2:0*/ Core__DOT__ctriSigs_deco_3;
    CData/*2:0*/ Core__DOT__ctriSigs_deco_0;
    CData/*0:0*/ Core__DOT__imm_sigBit;
    CData/*0:0*/ Core__DOT__branchBus_flag;
    CData/*0:0*/ Core__DOT__exCtrlSigs_memcen;
    CData/*3:0*/ Core__DOT__exCtrlSigs_memwen;
    CData/*0:0*/ Core__DOT__load_stall;
    CData/*6:0*/ Core__DOT__exCtrlSigs_excTy;
    CData/*2:0*/ Core__DOT__exCtrlSigs_wbdSel;
    CData/*0:0*/ Core__DOT__ctrlSigsMem_memcen;
    CData/*3:0*/ Core__DOT__ctrlSigsMem_memwen;
    IData/*31:0*/ Core__DOT__If2IdInst;
    IData/*31:0*/ Core__DOT__exInst;
    IData/*31:0*/ Core__DOT__instMem;
    IData/*31:0*/ Core__DOT__instWb;
    QData/*63:0*/ Core__DOT__Alu_io_result;
    QData/*63:0*/ Core__DOT__pcreg;
    QData/*63:0*/ Core__DOT__seq_pc;
    QData/*63:0*/ Core__DOT__If2IdPc;
    QData/*63:0*/ Core__DOT__alu_resultMem;
    QData/*63:0*/ Core__DOT__MemWbData;
    QData/*63:0*/ Core__DOT__wbData;
    QData/*63:0*/ Core__DOT___opVec_0_T;
    QData/*63:0*/ Core__DOT___opVec_1_T_1;
    QData/*63:0*/ Core__DOT___opVec_1_T;
    QData/*63:0*/ Core__DOT___opVec_1_T_5;
    QData/*63:0*/ Core__DOT__exOpVec_0;
    QData/*63:0*/ Core__DOT__exOpVec_1;
    QData/*63:0*/ Core__DOT__exPc;
    QData/*63:0*/ Core__DOT__exStoreData;
    QData/*63:0*/ Core__DOT__pcMem;
    QData/*63:0*/ Core__DOT__storeDataMem;
    QData/*63:0*/ Core__DOT__pcWb;
    QData/*63:0*/ Core__DOT__Alu__DOT__op2;
    QData/*63:0*/ Core__DOT__Alu__DOT___add_sub_result_T_1;
    VlUnpacked<QData/*63:0*/, 32> Core__DOT__gpr;

    // LOCAL VARIABLES
    CData/*0:0*/ __Vfunc_Core__DOT__dpi__DOT__is_ebreak__0__Vfuncout;
    CData/*0:0*/ __Vclklast__TOP__clock;
    VlUnpacked<CData/*0:0*/, 2> __Vm_traceActivity;

    // INTERNAL VARIABLES
    VCore__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VCore___024root);  ///< Copying not allowed
  public:
    VCore___024root(const char* name);
    ~VCore___024root();

    // INTERNAL METHODS
    void __Vconfigure(VCore__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
