test:
	mill -i __.test

verilog:
	$(call git_commit, "generate verilog")
	mkdir -p $(BUILD_DIR)
	mill -i __.test.runMain Elaborate -td $(BUILD_DIR)

help:
	mill -i __.test.runMain Elaborate --help

compile:
	mill -i __.compile

bsp:
	mill -i mill.bsp.BSP/install

reformat:
	mill -i __.reformat

checkformat:
	mill -i __.checkFormat


moveV :verilog 
	cp $(BUILD_DIR)/Core.v src/vsrc


clean:
	-rm -rf $(BUILD_DIR)
	-rm -rf $(OBJ_DIR)

run : gtk 
.PHONY: test verilog help compile bsp reformat checkformat clean



include ../Makefile
include src/Makefile
