#ifndef __UTILS_H
#define __UTILS_H
#include <assert.h>
#define FRONT_FONT      "\033[1;33m"
#define END_FONT        "\033[0m"
#define FMT_WORD        "0x%016lx"
#define FMT_HWORD       "0x%08x"
#define MEM_ADDR_START  0x80000000 
#define MEM_SIZE        0x8000

#define SIGNAL(_SIGNAL,_TYPE_FRONT) top->io##_TYPE_FRONT##_SIGNAL
#define excute_max -1 

#define ADDI    0b00000000001000000000000100010011
#define EBREAK  0b00000000000000000000000000010011

#endif