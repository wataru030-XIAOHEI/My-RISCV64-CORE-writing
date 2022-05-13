#include "../include/cpu.h"
u32 inst_fetch(paddr_t *pc, int len) {
    u32 inst = paddr_read(*pc,len);
    return inst ;
}