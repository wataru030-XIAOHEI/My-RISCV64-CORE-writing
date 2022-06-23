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


svBit is_ebreak(int inst);
// #include <assert.h>

// extern void sdb_mainloop();

// void disassemble(char *str , int size , u64 pc , u8* code , int nbyte) ;

#ifdef TARGET_AM
#define SEED_END 2 
static void load_img() {
    char img_file[] = "/home/wataru/Desktop/ysyx-workbench/npc/image.bin";
    FILE *fp = fopen(img_file , "rb") ;
    // assert(fp);
    fseek(fp,0,SEED_END);
    long long size = ftell(fp);
    fseek(fp,0,0);
    int ret = fread(guest_to_host(RESET_VECTOR),size,1,fp);
    assert(ret == 1);
    fclose(fp);
}
#else
void init_isa();
#endif



#ifdef TARGET_AM 
    void welcomeAM(){
        printf("\n\33[1;34muse the img from AM !\33[0m\n");
    }
#endif
int main(int argc, char** argv, char** env) {
    sim_init(argc,argv ); //top and tfp init 

//=======load image =============================
    #ifdef TARGET_AM
    welcomeAM() ; 
    load_img();
    #else
    init_isa();
    #endif


//=======reset , boot .================ 
    signal_reset() ;//  signal reset , pc . inst and so on . 

//======debug model of excute all 
    #ifdef SDB

    #else 
    excute(excute_max);
    #endif 

//=====finish 
    vsim_final();

    VL_PRINTF( FRONT_FONT "simu over!!!" END_FONT "\n");
    
    return 0;
}

