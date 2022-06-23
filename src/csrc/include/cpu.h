#ifndef __CPU_H__
#define __CPU_H__
#include "paddr.h"
//====itrace===========
// char logbuf[128] ;
u32 inst_fetch(paddr_t *pc, int len);


typedef struct{
    paddr_t pc ;
    word_t  gpr[32] ;
}CPU_T ;
// extern CPU_T npc_cpu ;
#endif