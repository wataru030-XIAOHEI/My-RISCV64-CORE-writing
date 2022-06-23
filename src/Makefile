BUILD_DIR = ./build
VERILATOR=verilator
VERI_F +=   --cc --exe --build --trace --top-module Core 
OBJ_DIR = ./obj_dir
SIM_TOPNAME = top
WORK_DIR = $(shell pwd)
INC_PATH := $(WORK_DIR)/src/csrc/include $(INC_PATH)
INCLUDES = $(addprefix -I, $(INC_PATH))
C_F+= -CFLAGS "$(INCLUDES)"


C_F+= -CFLAGS "-DCONFIG_VCD_TRACE_COND"
C_F+= -CFLAGS "-DCONFIG_DIFF_COND"
# C_F+= -CFLAGS "-DPTR_EXCUTE"
C_F +=  -CFLAGS "-DTARGET_AM"


V_FILE= $(shell find ./src/vsrc -name "*.v" -o -name "*.sv")


C_FILE+= $(shell find ./src/csrc -name "*.cpp" -o -name "*.c")


sim:
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	@echo "runing simulation for test module "
	$(VERILATOR) $(C_F) $(VERI_F) $(C_FILE)  $(V_FILE)
	$(OBJ_DIR)/VCore 

gtk:sim 
	gtkwave wave/sim_wave.vcd

