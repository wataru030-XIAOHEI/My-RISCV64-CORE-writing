// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vcore.h"
#include "Vcore__Syms.h"
#include "verilated_vcd_c.h"
#include "verilated_dpi.h"

//============================================================
// Constructors

Vcore::Vcore(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new Vcore__Syms(_vcontextp__, _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_Imemio_cen{vlSymsp->TOP.io_Imemio_cen}
    , io_Imemio_pc{vlSymsp->TOP.io_Imemio_pc}
    , io_Imemio_inst{vlSymsp->TOP.io_Imemio_inst}
    , io_DMemio_addr{vlSymsp->TOP.io_DMemio_addr}
    , io_DMemio_rdata{vlSymsp->TOP.io_DMemio_rdata}
    , io_DMemio_wen{vlSymsp->TOP.io_DMemio_wen}
    , io_DMemio_wdata{vlSymsp->TOP.io_DMemio_wdata}
    , io_Deubug_Debug_rf_wen{vlSymsp->TOP.io_Deubug_Debug_rf_wen}
    , io_Deubug_Debug_rf_waddr{vlSymsp->TOP.io_Deubug_Debug_rf_waddr}
    , io_Deubug_Debug_rf_wdata{vlSymsp->TOP.io_Deubug_Debug_rf_wdata}
    , io_Deubug_Debug_pc{vlSymsp->TOP.io_Deubug_Debug_pc}
    , io_Deubug_Debug_inst{vlSymsp->TOP.io_Deubug_Debug_inst}
    , rootp{&(vlSymsp->TOP)}
{
}

Vcore::Vcore(const char* _vcname__)
    : Vcore(nullptr, _vcname__)
{
}

//============================================================
// Destructor

Vcore::~Vcore() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void Vcore___024root___eval_initial(Vcore___024root* vlSelf);
void Vcore___024root___eval_settle(Vcore___024root* vlSelf);
void Vcore___024root___eval(Vcore___024root* vlSelf);
QData Vcore___024root___change_request(Vcore___024root* vlSelf);
#ifdef VL_DEBUG
void Vcore___024root___eval_debug_assertions(Vcore___024root* vlSelf);
#endif  // VL_DEBUG
void Vcore___024root___final(Vcore___024root* vlSelf);

static void _eval_initial_loop(Vcore__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    Vcore___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        Vcore___024root___eval_settle(&(vlSymsp->TOP));
        Vcore___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = Vcore___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("src/vsrc/core.v", 654, "",
                "Verilated model didn't DC converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = Vcore___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vcore::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vcore::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vcore___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        Vcore___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = Vcore___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("src/vsrc/core.v", 654, "",
                "Verilated model didn't converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = Vcore___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

//============================================================
// Invoke final blocks

void Vcore::final() {
    Vcore___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* Vcore::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* Vcore::name() const {
    return vlSymsp->name();
}

//============================================================
// Trace configuration

void Vcore___024root__traceInitTop(Vcore___024root* vlSelf, VerilatedVcd* tracep);

static void traceInit(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vcore___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vcore___024root*>(voidSelf);
    Vcore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->module(vlSymsp->name());
    tracep->scopeEscape(' ');
    Vcore___024root__traceInitTop(vlSelf, tracep);
    tracep->scopeEscape('.');
}

void Vcore___024root__traceRegister(Vcore___024root* vlSelf, VerilatedVcd* tracep);

void Vcore::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addInitCb(&traceInit, &(vlSymsp->TOP));
    Vcore___024root__traceRegister(&(vlSymsp->TOP), tfp->spTrace());
}
