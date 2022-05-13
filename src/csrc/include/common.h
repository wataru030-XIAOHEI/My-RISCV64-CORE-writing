#ifndef __COMMON_H__
#define __COMMON_H__
#include <assert.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

#define likely(cond) __builtin_expect(cond,1)

typedef unsigned int u32  ;
typedef unsigned long u64 ;
typedef unsigned short int u16 ;
typedef unsigned char u8 ;

typedef u32 half_word ;
typedef u64 word_t ;
typedef u64 paddr_t ;
typedef u64 vadr_t ;

#define MEMORY_BASE     0x80000000
#define PC_RESET_OFFSET 0x0
#define MEMORT_SIZE     0x8000000
#define RESET_VECTOR    (MEMORY_BASE+PC_RESET_OFFSET)
#define PG_ALIGN  __attribute((aligned(4096)))


#define MUX(COND,A,B) COND?A:B
#endif