#ifndef __HOST_H__
#define __HOST_H__
#include "common.h"

static inline word_t host_read(void *addr, int len) {
    switch (len)
    {
    case 1 : return *(u8  * )addr ;
    case 2 : return *(u16 * )addr ;
    case 4 : return *(u32 * )addr ;
    case 8 : return *(u64 * )addr ; 
    
    default:return 0 ;
    }   
}
static inline word_t host_write(void *addr, int len , word_t data) {
    switch (len)
    {
    case 1 :  *(u8  * )addr = data ;
    case 2 :  *(u16 * )addr = data ;
    case 4 :  *(u32 * )addr = data ;
    case 8 :  *(u64 * )addr = data ; 
    
    default:assert(0) ;
    }   
}

#endif