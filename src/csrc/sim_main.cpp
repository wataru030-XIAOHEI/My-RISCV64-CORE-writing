// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2017 by Wilson Snyder.
// SPDX-License-Identifier: CC0-1.0
//======================================================================


// #include "utils.h"
// Include model header, generated from Verilating "top.v"
#include "include/verilator_sim_tools.h"

// #include <common/common.h>



// #include <assert.h>

// extern void sdb_mainloop();

// void disassemble(char *str , int size , u64 pc , u8* code , int nbyte) ;
void init_monitor(int , char *[]);



svBit is_ebreak(int inst){//DPI-C
    if(inst == EBREAK){
        printf("\n\33[1;34mebreak!\33[0m\n");
        return 1;
    }
    return 0;
}


int main(int argc, char** argv, char** env) {
    #ifdef CONFIG_TARGET_AM
        am_init_monitor();
    #else
        init_monitor(argc,argv);
    #endif

    sim_init(argc,argv ); //top and tfp init 

    signal_reset() ;//  signal reset , pc . inst and so on . 

    #ifdef SDB
    sdb_mainloop();
    #else 
    excute(excute_max);
    #endif 

    vsim_final();
    VL_PRINTF( FRONT_FONT "simu over!!!" END_FONT "\n");
    
    return 0;
}

