#include "include/paddr.h"
#include "include/utils.h"




static const u32 img[] = {
    0xffffffff,
    0xdeadbeee,
    ADDI,
    ADDI,
    ADDI,
    ADDI,
    ADDI,
    EBREAK,
};

void init_isa() {//load the img 
    memcpy(guest_to_host(RESET_VECTOR), img , sizeof(img));
}
