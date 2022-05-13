// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vcore.h for the primary calling header

#ifndef VERILATED_VCORE___024ROOT_H_
#define VERILATED_VCORE___024ROOT_H_  // guard

#include "verilated_heavy.h"

//==========

class Vcore__Syms;
class Vcore_VerilatedVcd;


//----------

VL_MODULE(Vcore___024root) {
  public:

    // PORTS
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_OUT8(io_Imemio_cen,0,0);
    VL_OUT8(io_DMemio_wen,0,0);
    VL_OUT8(io_Deubug_Debug_rf_wen,0,0);
    VL_OUT8(io_Deubug_Debug_rf_waddr,4,0);
    VL_IN(io_Imemio_inst,31,0);
    VL_OUT(io_DMemio_addr,31,0);
    VL_OUT(io_Deubug_Debug_inst,31,0);
    VL_OUT64(io_Imemio_pc,63,0);
    VL_IN64(io_DMemio_rdata,63,0);
    VL_OUT64(io_DMemio_wdata,63,0);
    VL_OUT64(io_Deubug_Debug_rf_wdata,63,0);
    VL_OUT64(io_Deubug_Debug_pc,63,0);

    // LOCAL SIGNALS
    CData/*0:0*/ core__DOT__ImemCenR;
    CData/*0:0*/ core__DOT___hi_T_11;
    CData/*1:0*/ core__DOT__op1_sel;
    CData/*2:0*/ core__DOT__op2_sel;
    CData/*4:0*/ core__DOT__id_ex_pl__DOT__wb_addrR;
    CData/*4:0*/ core__DOT__id_ex_pl__DOT__exeu_op_selR;
    CData/*0:0*/ core__DOT__id_ex_pl__DOT__memwenR;
    CData/*0:0*/ core__DOT__id_ex_pl__DOT__wenR;
    CData/*1:0*/ core__DOT__id_ex_pl__DOT__wtypeR;
    CData/*0:0*/ core__DOT__id_ex_pl__DOT__inst_is_j_flagR;
    CData/*0:0*/ core__DOT__ex_mem_pl__DOT__mem_wenR;
    CData/*0:0*/ core__DOT__ex_mem_pl__DOT__rf_wenR;
    CData/*1:0*/ core__DOT__ex_mem_pl__DOT__wb_selR;
    CData/*4:0*/ core__DOT__ex_mem_pl__DOT__wb_addrR;
    CData/*4:0*/ core__DOT__mem_wb_pl__DOT__wb_addrR;
    CData/*0:0*/ core__DOT__mem_wb_pl__DOT__rf_wenR;
    CData/*1:0*/ core__DOT__mem_wb_pl__DOT__wb_selR;
    IData/*31:0*/ core__DOT__if_id_pl__DOT__instR;
    IData/*31:0*/ core__DOT__id_ex_pl__DOT__instR;
    IData/*31:0*/ core__DOT__ex_mem_pl__DOT__instR;
    IData/*31:0*/ core__DOT__mem_wb_pl__DOT__instR;
    QData/*63:0*/ core__DOT__id_ex_pl_io_src_in_imm;
    QData/*63:0*/ core__DOT__rf_io_channel_rdata2;
    QData/*63:0*/ core__DOT__pc_reg;
    QData/*63:0*/ core__DOT__pc_plus4;
    QData/*63:0*/ core__DOT___alu_out_T_10;
    QData/*63:0*/ core__DOT___alu_out_T_20;
    QData/*63:0*/ core__DOT___wb_data_T_3;
    QData/*63:0*/ core__DOT__if_id_pl__DOT__pcR;
    QData/*63:0*/ core__DOT__id_ex_pl__DOT__pcR;
    QData/*63:0*/ core__DOT__id_ex_pl__DOT__immR;
    QData/*63:0*/ core__DOT__id_ex_pl__DOT__src1R;
    QData/*63:0*/ core__DOT__id_ex_pl__DOT__src2R;
    QData/*63:0*/ core__DOT__id_ex_pl__DOT__Dmem_wdataR;
    QData/*63:0*/ core__DOT__ex_mem_pl__DOT__pcR;
    QData/*63:0*/ core__DOT__ex_mem_pl__DOT__alu_outR;
    QData/*63:0*/ core__DOT__ex_mem_pl__DOT__Dmem_wdataR;
    QData/*63:0*/ core__DOT__mem_wb_pl__DOT__pcR;
    QData/*63:0*/ core__DOT__mem_wb_pl__DOT__Dmem_rdataR;
    QData/*63:0*/ core__DOT__mem_wb_pl__DOT__pcplus4R;
    QData/*63:0*/ core__DOT__mem_wb_pl__DOT__aluR;
    VlUnpacked<QData/*63:0*/, 32> core__DOT__rf__DOT__rfR;

    // LOCAL VARIABLES
    CData/*0:0*/ __Vfunc_core__DOT__dpi__DOT__is_ebreak__0__Vfuncout;
    CData/*0:0*/ __Vclklast__TOP__clock;
    VlUnpacked<CData/*0:0*/, 2> __Vm_traceActivity;

    // INTERNAL VARIABLES
    Vcore__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vcore___024root);  ///< Copying not allowed
  public:
    Vcore___024root(const char* name);
    ~Vcore___024root();

    // INTERNAL METHODS
    void __Vconfigure(Vcore__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
