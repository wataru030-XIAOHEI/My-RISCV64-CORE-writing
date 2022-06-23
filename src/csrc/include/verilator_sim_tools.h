#ifndef __VERILATOR_SIM_TOOLS_H_
#define __VERILATOR_SIM_TOOLS_H_ 
// For std::unique_ptr
#include <memory>
// Include common routines
#include <verilated.h>
#ifdef CONFIG_VCD_TRACE_COND
#include <verilated_vcd_c.h>
#endif 

#include "VCore.h"
#include "common.h"
#include "utils.h"
#include "cpu.h"

static char logbuf[128];
// void hit_trap(CPU_T npc );
CPU_T npc_cpu ;
void print_gpr(){
    printf(COLOR_FONT "==========================gpr's result ===========================" END_FONT );
    putchar('\n');
    for(int i = 1 ; i < 33 ;i++){
        printf(COLOR_FONT "   ""gpr[%2d] :" " 0x%016lx " END_FONT ,i-1,npc_cpu.gpr[i-1] );
        if( i%4==0 || i == 32 ) putchar('\n');
        // if(i == 32 )putchar('\n');
    }
    printf(COLOR_FONT "==================================================================" END_FONT "\n");
}

const std::unique_ptr<VerilatedContext> contextp(new VerilatedContext);
const std::unique_ptr<VCore> top{new VCore{contextp.get(),"TOP"}}; 
#ifdef CONFIG_VCD_TRACE_COND
VerilatedVcdC * tfp = new VerilatedVcdC ;
#endif 
#ifdef CONFIG_DIFF_COND
void write_ref_npc_cpu(){
    if(top->io_debug_debugwen){
    npc_cpu.gpr[MUX((!(top->io_debug_debugwaddr)),(word_t)0,top->io_debug_debugwaddr)] 
        = top->io_debug_debugdata ; 
    npc_cpu.pc = top->io_debug_debugPc ;
    }
}
#endif


void sim_init(int argc , char** argv) {
    contextp->commandArgs(argc,argv);
    
    #ifdef CONFIG_VCD_TRACE_COND   
    putchar('\n');
    printf( FRONT_FONT "init the vcd !" END_FONT "\n");
    putchar('\n');
    Verilated::traceEverOn(true);
    top->trace(tfp,99);
    tfp->open("wave/sim_wave.vcd");
    #endif
}

void signal_reset () {
    top->reset = 1;
    top->clock = 0;
}
void dump_wave() {
    #ifdef CONFIG_VCD_TRACE_COND
    tfp->dump(contextp->time());
    #endif 
}
void eval_clk(){
    top->clock = !top->clock ;
    top->eval();
}

void restart_npc() {//reset and after reset
    if(contextp->time()>0 && contextp->time()<10) {
        top->reset = 1 ; 
        if(top->clock==1){   
            top->io_imem_rdata = inst_fetch(&top->io_debug_debugPc,4);
        }
    }else {
        if(top->clock == 1 ) {
            top->reset = 0; 
        }
        if(top->io_imem_cen == 1){
            top->io_imem_rdata = inst_fetch(&top->io_imem_addr,4);
        }else{
            top->io_imem_rdata = (u32)0x0 ;
        }
    }
}

void printf_debug_info() {
    if(top->clock == 1 && top->io_imem_cen==1 && 
    top->io_debug_debugInst != EBREAK && top->io_debug_debugwen && top->io_debug_debugPc != 0x0 ){
    #ifdef PTR_EXCUTE
        VL_PRINTF(FRONT_FONT "debug_pc is " FMT_WORD " " \
                    ",debug_inst is " FMT_HWORD  " "\
                    ", debug_waddr is 0x%02x" \
                    ", debug_wdata is "  FMT_WORD  " "\
                        END_FONT "\n",
            top->io_debug_debugPc,top->io_debug_debugInst,\
            top->io_debug_debugwaddr,top->io_debug_debugdata
            );
    #endif 
    }
}
void excute_once () {
    contextp->timeInc(1);  // 1 timeprecision period passes...
    eval_clk(); 
    restart_npc(); 
    printf_debug_info();
    //======ITRACE ============
    #ifdef CONFIG_ITRACE
    char *p = logbuf ;
    p += snprintf(p,sizeof(logbuf), "\t" "0x%016lx" "0x%8x" ":" , top->io_debug_debugPc , top->io_debug_debugInst );
    int ilen = 4 ; //4 byte 
    int i ;
    u8 *inst = (u8 *)top->io_debug_debugInst ;
    for(i = 0 ; i < ilen ; i++) { // print the inst by byte 
        p += snprintf(p,4," %02x" , inst[i]);
    }
    int ilen_max = 4 ;
    int space_len = ilen_max - ilen ;
    if(space_len < 0 ) space_len = 0 ;
    space_len = space_len * 3 + 1 ;
    memset(p,' ',space_len);
    p += space_len ;
    disassemble(p,logbuf+sizeof(logbuf)-p , top->io_debug_debugPc , (u8  *)&inst ,ilen);
    #endif 
    dump_wave(); 

    #ifdef CONFIG_DIFF_COND
        write_ref_npc_cpu();
    #endif

}

void excute(u32 n) {
   while(!contextp->gotFinish() && n > 0 ){
       excute_once();
       n-- ;
   } 
    
}
void vsim_final() {
    #ifdef CONFIG_VCD_TRACE_COND
    tfp->close();    
    #endif

    #ifdef CONFIG_DIFF_COND
    #endif 
    top->final();
}

#ifdef SDB
#include <readline/readline.h>
#include <readline/history.h>   


static int is_batch_mode = 0 ;

static char* rl_get(){
    static char *line_read = NULL;

    //read the cmd by readline
    if(line_read){
        free(line_read);
        line_read = NULL ;
    }
    line_read = readline("(my_sdb) ");
    if(line_read && *line_read) {
        add_history(line_read);
    }
    return line_read ;
}

static int cmd_c(char *args){
    excute(-1);
    return 0 ;
}
static int cmd_s(char *args){
    excute(1);
    return 0 ;
}

static int cmd_help(char *args);

static struct 
{
    const char *name ;
    const char *description ;
    int (*handler) (char *);
} cmd_table [] = {
    {"help"     , "Display all supported cmd ."             , cmd_help  },
    {"c"        , "Continue the execution of the program ." , cmd_c     },
    {"s"        , "execute once ."                          , cmd_s     },
};
#define ARRLEN(arr) (int)(sizeof(arr) / sizeof(arr[0]) )
#define NR_CMD ARRLEN(cmd_table)


static int cmd_help(char *args){
    char *arg = strtok(NULL, " ");
    int i ;
    if(arg == NULL) {
        for(i = 0 ; i < NR_CMD ; i++){
            printf("%s - %s\n",cmd_table[i].name , cmd_table[i].description);
        }
    }else {
        for(i = 0 ; i < NR_CMD ; i++) {
            if(strcmp(arg,cmd_table[i].name)==0){
                printf("%s - %s\n",cmd_table[i].name , cmd_table[i].description);
                return 0;
            }
        }
        printf("Unknown command '%s'\n",arg);
    }
    return 0;
}

void sdb_set_batch_mode(){
    is_batch_mode = 1 ;
}
void sdb_mainloop(){//loop
    if(is_batch_mode){
        cmd_c(NULL);
        return ;
    }
    for(char *str ; (str = rl_get()) != NULL;) {//loop
        char *str_end = str + strlen(str);

        char *cmd = strtok(str, " ");
        if(cmd == NULL) {continue;}

        char *args = cmd + strlen(cmd) + 1 ;
        if(args >= str_end){
            args = NULL ;
        }
    #ifdef CONFIG_DEVICE
        assert(0);
    #endif 
        int i ;
        for(i = 0 ; i < NR_CMD ; i++) {
            //handle 
            if(strcmp(cmd,cmd_table[i].name)==0){
                if(cmd_table[i].handler(args) < 0 ){
                    return ;
                }
                break;
            }
        }

        if(i == NR_CMD) {printf("Unknown command %s\n" , cmd_table[i].name); }
    }
}
#endif //SDB
#endif