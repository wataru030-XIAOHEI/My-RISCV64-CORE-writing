#include "../include/paddr.h"
static u8 pmem[MEMORT_SIZE] PG_ALIGN = {} ;
u8 * guest_to_host(u64 paddr) { return pmem + paddr - MEMORY_BASE ; }
paddr_t host_to_guest(u8 *haddr)  { return haddr - pmem + MEMORY_BASE ; }

static word_t pmem_read(paddr_t addr , int len) {
    word_t ret = host_read(guest_to_host(addr),len);
    return ret ;
}

static void pmem_write(paddr_t addr , int len , word_t data) {
    host_write(guest_to_host(addr),len ,data);
}
static void out_of_bound(paddr_t addr) {
    // ("out of bound\n");
    return ;
}

void mem_init() { 
   return;
}

word_t paddr_read(paddr_t addr ,  int len) {
    if (likely(in_pmem(addr))) return pmem_read(addr,len);
    out_of_bound(addr);
    return 0 ;
}

void paddr_write(paddr_t addr , int len ,word_t data ) {
    if(likely(in_pmem(addr))) {pmem_write(addr,len,data); return;}
    out_of_bound(addr); 
}
