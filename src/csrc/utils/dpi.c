#include "svdpi.h"
#include "VCore__Dpi.h"
#include <stdio.h>
#include "utils.h"
extern void print_gpr();
svBit is_ebreak(int inst , long long int gpr_10 ){//DPI-C
    if(inst == EBREAK){
        printf("\n\33[1;34mebreak!\33[0m\n");
        if( gpr_10 == 0 ){
            print_gpr();
            printf("\n\33[1;32m" "NPC : " "HIT GOOD TRAP !!! " "\033[0m\n");
        }else{
            print_gpr();
            printf("\n\33[1;31m" "NPC : " "HIT BAD  TRAP !!! " "\033[0m\n");
        }
        return 1;
    }
    return 0;
}