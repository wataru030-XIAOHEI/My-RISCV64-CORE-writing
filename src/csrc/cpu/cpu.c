#include "../include/cpu.h"
u32 inst_fetch(paddr_t *pc, int len) {
    u32 inst = paddr_read(*pc,len);
    return inst ;
}

void store(vaddr_t *addr , int len , u64 data ){
    vaddr_write(*addr , len , data );
}

u64 load(vaddr_t *addr , int len ){
    u64 ret = vaddr_read(*addr, len );
    return ret ;
}
