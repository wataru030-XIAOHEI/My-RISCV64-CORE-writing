#include "../include/paddr.h"



#include "../include/utils.h"
#include <stdio.h>
#define SEED_END 2
extern void mem_init();
extern void init_isa();
void init_isa();
void init_rand(){
    srand(0);
}
// #ifndef CONFIG_TARGET_AM
static char *log_file = NULL;
static char *img_file = NULL;
static char *diff_so_file = NULL;
static int difftest_port=1234;

static void load_img() {
    // img_file = "../image.bin";
    if(img_file == NULL) {
      printf(FRONT_FONT "used the deault image " END_FONT "\n") ;
      init_isa();
    }
    FILE *fp = fopen(img_file , "rb") ;
    assert(fp);
    fseek(fp,0,SEED_END);
    long size = ftell(fp);

    int ret = fread(guest_to_host(RESET_VECTOR),size,1,fp);
    assert(ret == 1);
    fclose(fp);
}
// #endif 
