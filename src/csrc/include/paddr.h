#ifndef __MEMORY_PADDR_H__
#define __MEMORY_PADDR_H__
#include "common.h"
#include <string.h>
#include "host.h"



u8* guest_to_host(paddr_t paddr);
paddr_t host_to_guest(u8 *haddr);

static inline _Bool in_pmem (paddr_t addr) {
    return ((addr >= MEMORY_BASE) && (addr < (paddr_t)MEMORY_BASE + MEMORT_SIZE));
}

word_t paddr_read(paddr_t addr , int len);
void paddr_write(paddr_t adr ,int len , word_t data);
word_t vaddr_read(vaddr_t addr , int len );
void vaddr_write(vaddr_t addr , int len, word_t data);
#endif