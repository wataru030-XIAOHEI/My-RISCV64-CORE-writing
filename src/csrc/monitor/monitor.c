#include "../include/paddr.h"



#include "../include/utils.h"
#include <stdio.h>
#define SEED_END 2
extern void mem_init();
extern void init_isa();

void init_rand(){
    srand(0);
}
#ifndef CONFIG_TARGET_AM
#include <getopt.h>
static char *log_file = NULL;
static char *img_file = NULL;
static char *diff_so_file = NULL;
static int difftest_port=1234;

static long load_img() {
    if(img_file == NULL) {
      printf(FRONT_FONT "used the deault image " END_FONT "\n") ;
      return 4096 ;
    }
    FILE *fp = fopen(img_file , "rb") ;
    assert(fp);
    fseek(fp,0,SEED_END);
    long size = ftell(fp);

    int ret = fread(guest_to_host(RESET_VECTOR),size,1,fp);
    assert(ret == 1);
    fclose(fp);
    return size ;
}

static int parse_args(int argc, char *argv[]) {
  const struct option table[] = {
    {"batch"    , no_argument      , NULL, 'b'},
    {"log"      , required_argument, NULL, 'l'},
    {"diff"     , required_argument, NULL, 'd'},
    {"port"     , required_argument, NULL, 'p'},
    {"help"     , no_argument      , NULL, 'h'},
    {0          , 0                , NULL,  0 },
  };
  int o;
  while ( (o = getopt_long(argc, argv, "-bhl:d:p:", table, NULL)) != -1) {
    switch (o) {
    //   case 'b': sdb_set_batch_mode(); break;
      case 'p': sscanf(optarg, "%d", &difftest_port); break;
      case 'l': log_file = optarg; break;
      case 'd': diff_so_file = optarg; break;
      case 1: img_file = optarg; return 0;
      default:
        printf("Usage: %s [OPTION...] IMAGE [args]\n\n", argv[0]);
        printf("\t-b,--batch              run with batch mode\n");
        printf("\t-l,--log=FILE           output log to FILE\n");
        printf("\t-d,--diff=REF_SO        run DiffTest with reference REF_SO\n");
        printf("\t-p,--port=PORT          run DiffTest with port PORT\n");
        printf("\n");
        exit(0);
    }
  }
  return 0;
}

void init_monitor(int argc, char* argv[]){
    parse_args(argc,argv);
    init_rand();

    mem_init();
    init_isa();
    long img_size = load_img();

}
#else
static long load_img () {
  extern char bin_start , bin_end ;
  size_t size = &bin_end - &bin_start ;
  printf(FRONT_FONT "img size is %ld" END_FONT , size) ;
  memcpy(guest_to_host(RESET_VECTOR), &bin_start , size) ;
  return size ;
}

void am_init_monitor () {
  init_rand();
  mem_init() ;
  init_isa () ;
  load_img() ;
}
#endif