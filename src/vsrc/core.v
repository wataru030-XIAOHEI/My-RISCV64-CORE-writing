module if_id(
  input         clock,
  input         reset,
  input  [63:0] io_pc,
  input  [31:0] io_inst,
  output [63:0] io_pc_o,
  output [31:0] io_inst_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] pcR; // @[pipeline.scala 41:20]
  reg [31:0] instR; // @[pipeline.scala 42:22]
  assign io_pc_o = pcR; // @[pipeline.scala 47:11]
  assign io_inst_o = instR; // @[pipeline.scala 48:13]
  always @(posedge clock) begin
    if (reset) begin // @[pipeline.scala 41:20]
      pcR <= 64'h0; // @[pipeline.scala 41:20]
    end else begin
      pcR <= io_pc; // @[pipeline.scala 44:7]
    end
    if (reset) begin // @[pipeline.scala 42:22]
      instR <= 32'h0; // @[pipeline.scala 42:22]
    end else begin
      instR <= io_inst; // @[pipeline.scala 45:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pcR = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  instR = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module id_ex(
  input         clock,
  input         reset,
  input  [63:0] io_pc_and_inst_in_pc,
  input  [31:0] io_pc_and_inst_in_inst,
  output [63:0] io_pc_and_inst_out_pc,
  output [31:0] io_pc_and_inst_out_inst,
  input         io_inst_is_jump_in,
  output        io_inst_is_jump_o,
  input  [63:0] io_src_in_src1,
  input  [63:0] io_src_in_src2,
  input  [63:0] io_src_in_imm,
  output [63:0] io_src_out_src1,
  output [63:0] io_src_out_src2,
  output [63:0] io_src_out_imm,
  input  [4:0]  io_wb_addr_in,
  output [4:0]  io_wb_addr_o,
  input  [63:0] io_Dmem_wdata_in,
  output [63:0] io_Dmem_wdata_o,
  input  [4:0]  io_exeu_op,
  output [4:0]  io_exeu_op_o,
  input         io_mem_wen_io_mem_wen_in,
  output        io_mem_wen_io_mem_wen_o,
  input         io_reg_wen_io_reg_wen_in,
  output        io_reg_wen_io_reg_wen_o,
  input  [1:0]  io_wb_type_io_reg_wtype_in,
  output [1:0]  io_wb_type_io_reg_wtype_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] pcR; // @[pipeline.scala 76:20]
  reg [31:0] instR; // @[pipeline.scala 77:22]
  reg [63:0] immR; // @[pipeline.scala 83:21]
  reg [63:0] src1R; // @[pipeline.scala 84:22]
  reg [63:0] src2R; // @[pipeline.scala 85:22]
  reg [4:0] wb_addrR; // @[pipeline.scala 93:25]
  reg [4:0] exeu_op_selR; // @[pipeline.scala 98:28]
  reg  memwenR; // @[pipeline.scala 102:24]
  reg  wenR; // @[pipeline.scala 106:21]
  reg [1:0] wtypeR; // @[pipeline.scala 110:23]
  reg [63:0] Dmem_wdataR; // @[pipeline.scala 113:28]
  reg  inst_is_j_flagR; // @[pipeline.scala 118:32]
  assign io_pc_and_inst_out_pc = pcR; // @[pipeline.scala 80:25]
  assign io_pc_and_inst_out_inst = instR; // @[pipeline.scala 81:27]
  assign io_inst_is_jump_o = inst_is_j_flagR; // @[pipeline.scala 121:21]
  assign io_src_out_src1 = src1R; // @[pipeline.scala 90:19]
  assign io_src_out_src2 = src2R; // @[pipeline.scala 91:19]
  assign io_src_out_imm = immR; // @[pipeline.scala 89:19]
  assign io_wb_addr_o = wb_addrR; // @[pipeline.scala 95:16]
  assign io_Dmem_wdata_o = Dmem_wdataR; // @[pipeline.scala 115:19]
  assign io_exeu_op_o = exeu_op_selR; // @[pipeline.scala 100:16]
  assign io_mem_wen_io_mem_wen_o = memwenR; // @[pipeline.scala 104:27]
  assign io_reg_wen_io_reg_wen_o = wenR; // @[pipeline.scala 108:27]
  assign io_wb_type_io_reg_wtype_out = wtypeR; // @[pipeline.scala 112:31]
  always @(posedge clock) begin
    if (reset) begin // @[pipeline.scala 76:20]
      pcR <= 64'h0; // @[pipeline.scala 76:20]
    end else begin
      pcR <= io_pc_and_inst_in_pc; // @[pipeline.scala 78:7]
    end
    if (reset) begin // @[pipeline.scala 77:22]
      instR <= 32'h0; // @[pipeline.scala 77:22]
    end else begin
      instR <= io_pc_and_inst_in_inst; // @[pipeline.scala 79:9]
    end
    if (reset) begin // @[pipeline.scala 83:21]
      immR <= 64'h0; // @[pipeline.scala 83:21]
    end else begin
      immR <= io_src_in_imm; // @[pipeline.scala 86:8]
    end
    if (reset) begin // @[pipeline.scala 84:22]
      src1R <= 64'h0; // @[pipeline.scala 84:22]
    end else begin
      src1R <= io_src_in_src1; // @[pipeline.scala 87:9]
    end
    if (reset) begin // @[pipeline.scala 85:22]
      src2R <= 64'h0; // @[pipeline.scala 85:22]
    end else begin
      src2R <= io_src_in_src2; // @[pipeline.scala 88:9]
    end
    if (reset) begin // @[pipeline.scala 93:25]
      wb_addrR <= 5'h0; // @[pipeline.scala 93:25]
    end else begin
      wb_addrR <= io_wb_addr_in; // @[pipeline.scala 94:12]
    end
    if (reset) begin // @[pipeline.scala 98:28]
      exeu_op_selR <= 5'h0; // @[pipeline.scala 98:28]
    end else begin
      exeu_op_selR <= io_exeu_op; // @[pipeline.scala 99:16]
    end
    if (reset) begin // @[pipeline.scala 102:24]
      memwenR <= 1'h0; // @[pipeline.scala 102:24]
    end else begin
      memwenR <= io_mem_wen_io_mem_wen_in; // @[pipeline.scala 103:11]
    end
    if (reset) begin // @[pipeline.scala 106:21]
      wenR <= 1'h0; // @[pipeline.scala 106:21]
    end else begin
      wenR <= io_reg_wen_io_reg_wen_in; // @[pipeline.scala 107:8]
    end
    if (reset) begin // @[pipeline.scala 110:23]
      wtypeR <= 2'h0; // @[pipeline.scala 110:23]
    end else begin
      wtypeR <= io_wb_type_io_reg_wtype_in; // @[pipeline.scala 111:10]
    end
    if (reset) begin // @[pipeline.scala 113:28]
      Dmem_wdataR <= 64'h0; // @[pipeline.scala 113:28]
    end else begin
      Dmem_wdataR <= io_Dmem_wdata_in; // @[pipeline.scala 114:15]
    end
    if (reset) begin // @[pipeline.scala 118:32]
      inst_is_j_flagR <= 1'h0; // @[pipeline.scala 118:32]
    end else begin
      inst_is_j_flagR <= io_inst_is_jump_in; // @[pipeline.scala 120:19]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pcR = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  instR = _RAND_1[31:0];
  _RAND_2 = {2{`RANDOM}};
  immR = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  src1R = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  src2R = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  wb_addrR = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  exeu_op_selR = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  memwenR = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  wenR = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  wtypeR = _RAND_9[1:0];
  _RAND_10 = {2{`RANDOM}};
  Dmem_wdataR = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  inst_is_j_flagR = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RF(
  input         clock,
  input  [4:0]  io_channel_raddr1,
  input  [4:0]  io_channel_raddr2,
  output [63:0] io_channel_rdata1,
  output [63:0] io_channel_rdata2,
  input         io_channel_wen,
  input  [4:0]  io_channel_waddr,
  input  [63:0] io_channel_wdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [63:0] rfR [0:31]; // @[RF.scala 14:16]
  wire [63:0] rfR_io_channel_rdata1_MPORT_data; // @[RF.scala 14:16]
  wire [4:0] rfR_io_channel_rdata1_MPORT_addr; // @[RF.scala 14:16]
  wire [63:0] rfR_io_channel_rdata2_MPORT_data; // @[RF.scala 14:16]
  wire [4:0] rfR_io_channel_rdata2_MPORT_addr; // @[RF.scala 14:16]
  wire [63:0] rfR_MPORT_data; // @[RF.scala 14:16]
  wire [4:0] rfR_MPORT_addr; // @[RF.scala 14:16]
  wire  rfR_MPORT_mask; // @[RF.scala 14:16]
  wire  rfR_MPORT_en; // @[RF.scala 14:16]
  wire  _T = io_channel_waddr != 5'h0; // @[RF.scala 15:43]
  assign rfR_io_channel_rdata1_MPORT_addr = io_channel_raddr1;
  assign rfR_io_channel_rdata1_MPORT_data = rfR[rfR_io_channel_rdata1_MPORT_addr]; // @[RF.scala 14:16]
  assign rfR_io_channel_rdata2_MPORT_addr = io_channel_raddr2;
  assign rfR_io_channel_rdata2_MPORT_data = rfR[rfR_io_channel_rdata2_MPORT_addr]; // @[RF.scala 14:16]
  assign rfR_MPORT_data = io_channel_wdata;
  assign rfR_MPORT_addr = io_channel_waddr;
  assign rfR_MPORT_mask = 1'h1;
  assign rfR_MPORT_en = io_channel_wen & _T;
  assign io_channel_rdata1 = io_channel_raddr1 == 5'h0 ? 64'h0 : rfR_io_channel_rdata1_MPORT_data; // @[RF.scala 20:27]
  assign io_channel_rdata2 = io_channel_raddr2 == 5'h0 ? 64'h0 : rfR_io_channel_rdata2_MPORT_data; // @[RF.scala 24:27]
  always @(posedge clock) begin
    if(rfR_MPORT_en & rfR_MPORT_mask) begin
      rfR[rfR_MPORT_addr] <= rfR_MPORT_data; // @[RF.scala 14:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    rfR[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ex_mem(
  input         clock,
  input         reset,
  input  [63:0] io_pc_and_inst_in_pc,
  input  [31:0] io_pc_and_inst_in_inst,
  output [63:0] io_pc_and_inst_out_pc,
  output [31:0] io_pc_and_inst_out_inst,
  input  [63:0] io_alu_out_in,
  output [63:0] io_alu_out_o,
  input  [4:0]  io_wb_addr_in,
  output [4:0]  io_wb_addr_o,
  input  [63:0] io_Dmem_wdata_in,
  output [63:0] io_Dmem_wdata_o,
  input         io_mem_wen_io_mem_wen_in,
  output        io_mem_wen_io_mem_wen_o,
  input         io_rf_wen_io_reg_wen_in,
  output        io_rf_wen_io_reg_wen_o,
  input  [1:0]  io_wb_sel_io_reg_wtype_in,
  output [1:0]  io_wb_sel_io_reg_wtype_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] pcR; // @[pipeline.scala 142:20]
  reg [31:0] instR; // @[pipeline.scala 143:22]
  reg  mem_wenR; // @[pipeline.scala 149:25]
  reg  rf_wenR; // @[pipeline.scala 150:24]
  reg [1:0] wb_selR; // @[pipeline.scala 151:24]
  reg [4:0] wb_addrR; // @[pipeline.scala 152:25]
  reg [63:0] alu_outR; // @[pipeline.scala 153:25]
  reg [63:0] Dmem_wdataR; // @[pipeline.scala 154:28]
  assign io_pc_and_inst_out_pc = pcR; // @[pipeline.scala 146:25]
  assign io_pc_and_inst_out_inst = instR; // @[pipeline.scala 147:27]
  assign io_alu_out_o = alu_outR; // @[pipeline.scala 168:16]
  assign io_wb_addr_o = wb_addrR; // @[pipeline.scala 166:16]
  assign io_Dmem_wdata_o = Dmem_wdataR; // @[pipeline.scala 156:19]
  assign io_mem_wen_io_mem_wen_o = mem_wenR; // @[pipeline.scala 160:27]
  assign io_rf_wen_io_reg_wen_o = rf_wenR; // @[pipeline.scala 162:26]
  assign io_wb_sel_io_reg_wtype_out = wb_selR; // @[pipeline.scala 164:30]
  always @(posedge clock) begin
    if (reset) begin // @[pipeline.scala 142:20]
      pcR <= 64'h0; // @[pipeline.scala 142:20]
    end else begin
      pcR <= io_pc_and_inst_in_pc; // @[pipeline.scala 144:7]
    end
    if (reset) begin // @[pipeline.scala 143:22]
      instR <= 32'h0; // @[pipeline.scala 143:22]
    end else begin
      instR <= io_pc_and_inst_in_inst; // @[pipeline.scala 145:9]
    end
    if (reset) begin // @[pipeline.scala 149:25]
      mem_wenR <= 1'h0; // @[pipeline.scala 149:25]
    end else begin
      mem_wenR <= io_mem_wen_io_mem_wen_in; // @[pipeline.scala 159:12]
    end
    if (reset) begin // @[pipeline.scala 150:24]
      rf_wenR <= 1'h0; // @[pipeline.scala 150:24]
    end else begin
      rf_wenR <= io_rf_wen_io_reg_wen_in; // @[pipeline.scala 161:11]
    end
    if (reset) begin // @[pipeline.scala 151:24]
      wb_selR <= 2'h0; // @[pipeline.scala 151:24]
    end else begin
      wb_selR <= io_wb_sel_io_reg_wtype_in; // @[pipeline.scala 163:11]
    end
    if (reset) begin // @[pipeline.scala 152:25]
      wb_addrR <= 5'h0; // @[pipeline.scala 152:25]
    end else begin
      wb_addrR <= io_wb_addr_in; // @[pipeline.scala 165:12]
    end
    if (reset) begin // @[pipeline.scala 153:25]
      alu_outR <= 64'h0; // @[pipeline.scala 153:25]
    end else begin
      alu_outR <= io_alu_out_in; // @[pipeline.scala 167:12]
    end
    if (reset) begin // @[pipeline.scala 154:28]
      Dmem_wdataR <= 64'h0; // @[pipeline.scala 154:28]
    end else begin
      Dmem_wdataR <= io_Dmem_wdata_in; // @[pipeline.scala 155:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pcR = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  instR = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mem_wenR = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  rf_wenR = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  wb_selR = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  wb_addrR = _RAND_5[4:0];
  _RAND_6 = {2{`RANDOM}};
  alu_outR = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  Dmem_wdataR = _RAND_7[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module mem_wb(
  input         clock,
  input         reset,
  input  [63:0] io_pc_and_inst_in_pc,
  input  [31:0] io_pc_and_inst_in_inst,
  output [63:0] io_pc_and_inst_o_pc,
  output [31:0] io_pc_and_inst_o_inst,
  input  [63:0] io_pc_plus4_in,
  output [63:0] io_pc_plus4_o,
  input  [4:0]  io_wb_addr_in,
  output [4:0]  io_wb_addr_o,
  input  [63:0] io_alu_out_in,
  output [63:0] io_alu_out_o,
  input         io_rf_wen_io_reg_wen_in,
  output        io_rf_wen_io_reg_wen_o,
  input  [1:0]  io_wb_sel_io_reg_wtype_in,
  output [1:0]  io_wb_sel_io_reg_wtype_out,
  input  [63:0] io_Dmem_rdata_in,
  output [63:0] io_Dmem_rdata_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] pcR; // @[pipeline.scala 191:20]
  reg [31:0] instR; // @[pipeline.scala 195:22]
  reg [4:0] wb_addrR; // @[pipeline.scala 199:25]
  reg  rf_wenR; // @[pipeline.scala 203:24]
  reg [1:0] wb_selR; // @[pipeline.scala 207:24]
  reg [63:0] Dmem_rdataR; // @[pipeline.scala 211:28]
  reg [63:0] pcplus4R; // @[pipeline.scala 215:25]
  reg [63:0] aluR; // @[pipeline.scala 219:21]
  assign io_pc_and_inst_o_pc = pcR; // @[pipeline.scala 193:23]
  assign io_pc_and_inst_o_inst = instR; // @[pipeline.scala 197:25]
  assign io_pc_plus4_o = pcplus4R; // @[pipeline.scala 217:17]
  assign io_wb_addr_o = wb_addrR; // @[pipeline.scala 201:16]
  assign io_alu_out_o = aluR; // @[pipeline.scala 221:16]
  assign io_rf_wen_io_reg_wen_o = rf_wenR; // @[pipeline.scala 205:26]
  assign io_wb_sel_io_reg_wtype_out = wb_selR; // @[pipeline.scala 209:30]
  assign io_Dmem_rdata_o = Dmem_rdataR; // @[pipeline.scala 213:19]
  always @(posedge clock) begin
    if (reset) begin // @[pipeline.scala 191:20]
      pcR <= 64'h0; // @[pipeline.scala 191:20]
    end else begin
      pcR <= io_pc_and_inst_in_pc; // @[pipeline.scala 192:7]
    end
    if (reset) begin // @[pipeline.scala 195:22]
      instR <= 32'h0; // @[pipeline.scala 195:22]
    end else begin
      instR <= io_pc_and_inst_in_inst; // @[pipeline.scala 196:9]
    end
    if (reset) begin // @[pipeline.scala 199:25]
      wb_addrR <= 5'h0; // @[pipeline.scala 199:25]
    end else begin
      wb_addrR <= io_wb_addr_in; // @[pipeline.scala 200:12]
    end
    if (reset) begin // @[pipeline.scala 203:24]
      rf_wenR <= 1'h0; // @[pipeline.scala 203:24]
    end else begin
      rf_wenR <= io_rf_wen_io_reg_wen_in; // @[pipeline.scala 204:11]
    end
    if (reset) begin // @[pipeline.scala 207:24]
      wb_selR <= 2'h0; // @[pipeline.scala 207:24]
    end else begin
      wb_selR <= io_wb_sel_io_reg_wtype_in; // @[pipeline.scala 208:11]
    end
    if (reset) begin // @[pipeline.scala 211:28]
      Dmem_rdataR <= 64'h0; // @[pipeline.scala 211:28]
    end else begin
      Dmem_rdataR <= io_Dmem_rdata_in; // @[pipeline.scala 212:15]
    end
    if (reset) begin // @[pipeline.scala 215:25]
      pcplus4R <= 64'h0; // @[pipeline.scala 215:25]
    end else begin
      pcplus4R <= io_pc_plus4_in; // @[pipeline.scala 216:12]
    end
    if (reset) begin // @[pipeline.scala 219:21]
      aluR <= 64'h0; // @[pipeline.scala 219:21]
    end else begin
      aluR <= io_alu_out_in; // @[pipeline.scala 220:8]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pcR = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  instR = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  wb_addrR = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  rf_wenR = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  wb_selR = _RAND_4[1:0];
  _RAND_5 = {2{`RANDOM}};
  Dmem_rdataR = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  pcplus4R = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  aluR = _RAND_7[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module core(
  input         clock,
  input         reset,
  output        io_Imemio_cen,
  output [63:0] io_Imemio_pc,
  input  [31:0] io_Imemio_inst,
  output [31:0] io_DMemio_addr,
  input  [63:0] io_DMemio_rdata,
  output        io_DMemio_wen,
  output [63:0] io_DMemio_wdata,
  output        io_Deubug_Debug_rf_wen,
  output [4:0]  io_Deubug_Debug_rf_waddr,
  output [63:0] io_Deubug_Debug_rf_wdata,
  output [63:0] io_Deubug_Debug_pc,
  output [31:0] io_Deubug_Debug_inst
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  if_id_pl_clock; // @[core.scala 27:24]
  wire  if_id_pl_reset; // @[core.scala 27:24]
  wire [63:0] if_id_pl_io_pc; // @[core.scala 27:24]
  wire [31:0] if_id_pl_io_inst; // @[core.scala 27:24]
  wire [63:0] if_id_pl_io_pc_o; // @[core.scala 27:24]
  wire [31:0] if_id_pl_io_inst_o; // @[core.scala 27:24]
  wire  id_ex_pl_clock; // @[core.scala 28:24]
  wire  id_ex_pl_reset; // @[core.scala 28:24]
  wire [63:0] id_ex_pl_io_pc_and_inst_in_pc; // @[core.scala 28:24]
  wire [31:0] id_ex_pl_io_pc_and_inst_in_inst; // @[core.scala 28:24]
  wire [63:0] id_ex_pl_io_pc_and_inst_out_pc; // @[core.scala 28:24]
  wire [31:0] id_ex_pl_io_pc_and_inst_out_inst; // @[core.scala 28:24]
  wire  id_ex_pl_io_inst_is_jump_in; // @[core.scala 28:24]
  wire  id_ex_pl_io_inst_is_jump_o; // @[core.scala 28:24]
  wire [63:0] id_ex_pl_io_src_in_src1; // @[core.scala 28:24]
  wire [63:0] id_ex_pl_io_src_in_src2; // @[core.scala 28:24]
  wire [63:0] id_ex_pl_io_src_in_imm; // @[core.scala 28:24]
  wire [63:0] id_ex_pl_io_src_out_src1; // @[core.scala 28:24]
  wire [63:0] id_ex_pl_io_src_out_src2; // @[core.scala 28:24]
  wire [63:0] id_ex_pl_io_src_out_imm; // @[core.scala 28:24]
  wire [4:0] id_ex_pl_io_wb_addr_in; // @[core.scala 28:24]
  wire [4:0] id_ex_pl_io_wb_addr_o; // @[core.scala 28:24]
  wire [63:0] id_ex_pl_io_Dmem_wdata_in; // @[core.scala 28:24]
  wire [63:0] id_ex_pl_io_Dmem_wdata_o; // @[core.scala 28:24]
  wire [4:0] id_ex_pl_io_exeu_op; // @[core.scala 28:24]
  wire [4:0] id_ex_pl_io_exeu_op_o; // @[core.scala 28:24]
  wire  id_ex_pl_io_mem_wen_io_mem_wen_in; // @[core.scala 28:24]
  wire  id_ex_pl_io_mem_wen_io_mem_wen_o; // @[core.scala 28:24]
  wire  id_ex_pl_io_reg_wen_io_reg_wen_in; // @[core.scala 28:24]
  wire  id_ex_pl_io_reg_wen_io_reg_wen_o; // @[core.scala 28:24]
  wire [1:0] id_ex_pl_io_wb_type_io_reg_wtype_in; // @[core.scala 28:24]
  wire [1:0] id_ex_pl_io_wb_type_io_reg_wtype_out; // @[core.scala 28:24]
  wire  rf_clock; // @[core.scala 33:18]
  wire [4:0] rf_io_channel_raddr1; // @[core.scala 33:18]
  wire [4:0] rf_io_channel_raddr2; // @[core.scala 33:18]
  wire [63:0] rf_io_channel_rdata1; // @[core.scala 33:18]
  wire [63:0] rf_io_channel_rdata2; // @[core.scala 33:18]
  wire  rf_io_channel_wen; // @[core.scala 33:18]
  wire [4:0] rf_io_channel_waddr; // @[core.scala 33:18]
  wire [63:0] rf_io_channel_wdata; // @[core.scala 33:18]
  wire  ex_mem_pl_clock; // @[core.scala 218:24]
  wire  ex_mem_pl_reset; // @[core.scala 218:24]
  wire [63:0] ex_mem_pl_io_pc_and_inst_in_pc; // @[core.scala 218:24]
  wire [31:0] ex_mem_pl_io_pc_and_inst_in_inst; // @[core.scala 218:24]
  wire [63:0] ex_mem_pl_io_pc_and_inst_out_pc; // @[core.scala 218:24]
  wire [31:0] ex_mem_pl_io_pc_and_inst_out_inst; // @[core.scala 218:24]
  wire [63:0] ex_mem_pl_io_alu_out_in; // @[core.scala 218:24]
  wire [63:0] ex_mem_pl_io_alu_out_o; // @[core.scala 218:24]
  wire [4:0] ex_mem_pl_io_wb_addr_in; // @[core.scala 218:24]
  wire [4:0] ex_mem_pl_io_wb_addr_o; // @[core.scala 218:24]
  wire [63:0] ex_mem_pl_io_Dmem_wdata_in; // @[core.scala 218:24]
  wire [63:0] ex_mem_pl_io_Dmem_wdata_o; // @[core.scala 218:24]
  wire  ex_mem_pl_io_mem_wen_io_mem_wen_in; // @[core.scala 218:24]
  wire  ex_mem_pl_io_mem_wen_io_mem_wen_o; // @[core.scala 218:24]
  wire  ex_mem_pl_io_rf_wen_io_reg_wen_in; // @[core.scala 218:24]
  wire  ex_mem_pl_io_rf_wen_io_reg_wen_o; // @[core.scala 218:24]
  wire [1:0] ex_mem_pl_io_wb_sel_io_reg_wtype_in; // @[core.scala 218:24]
  wire [1:0] ex_mem_pl_io_wb_sel_io_reg_wtype_out; // @[core.scala 218:24]
  wire  mem_wb_pl_clock; // @[core.scala 269:25]
  wire  mem_wb_pl_reset; // @[core.scala 269:25]
  wire [63:0] mem_wb_pl_io_pc_and_inst_in_pc; // @[core.scala 269:25]
  wire [31:0] mem_wb_pl_io_pc_and_inst_in_inst; // @[core.scala 269:25]
  wire [63:0] mem_wb_pl_io_pc_and_inst_o_pc; // @[core.scala 269:25]
  wire [31:0] mem_wb_pl_io_pc_and_inst_o_inst; // @[core.scala 269:25]
  wire [63:0] mem_wb_pl_io_pc_plus4_in; // @[core.scala 269:25]
  wire [63:0] mem_wb_pl_io_pc_plus4_o; // @[core.scala 269:25]
  wire [4:0] mem_wb_pl_io_wb_addr_in; // @[core.scala 269:25]
  wire [4:0] mem_wb_pl_io_wb_addr_o; // @[core.scala 269:25]
  wire [63:0] mem_wb_pl_io_alu_out_in; // @[core.scala 269:25]
  wire [63:0] mem_wb_pl_io_alu_out_o; // @[core.scala 269:25]
  wire  mem_wb_pl_io_rf_wen_io_reg_wen_in; // @[core.scala 269:25]
  wire  mem_wb_pl_io_rf_wen_io_reg_wen_o; // @[core.scala 269:25]
  wire [1:0] mem_wb_pl_io_wb_sel_io_reg_wtype_in; // @[core.scala 269:25]
  wire [1:0] mem_wb_pl_io_wb_sel_io_reg_wtype_out; // @[core.scala 269:25]
  wire [63:0] mem_wb_pl_io_Dmem_rdata_in; // @[core.scala 269:25]
  wire [63:0] mem_wb_pl_io_Dmem_rdata_o; // @[core.scala 269:25]
  wire [31:0] dpi_inst_in; // @[core.scala 328:21]
  reg  ImemCenR; // @[core.scala 38:26]
  reg [63:0] pc_reg; // @[core.scala 40:19]
  wire [63:0] pc_plus4 = pc_reg + 64'h4; // @[core.scala 42:22]
  wire [4:0] exec_fun_ex = id_ex_pl_io_exeu_op_o; // @[core.scala 152:25 core.scala 179:23]
  wire [63:0] op1_ex = id_ex_pl_io_src_out_src1; // @[core.scala 150:20 core.scala 175:10]
  wire [63:0] op2_ex = id_ex_pl_io_src_out_src2; // @[core.scala 151:20 core.scala 176:10]
  wire  _hi_T_11 = op1_ex < op2_ex; // @[Ctrl.scala 39:41]
  wire  _hi_T_10 = ~_hi_T_11; // @[Ctrl.scala 38:24]
  wire  _hi_T_7 = $signed(id_ex_pl_io_src_out_src1) < $signed(id_ex_pl_io_src_out_src2); // @[Ctrl.scala 37:41]
  wire  _hi_T_8 = ~($signed(id_ex_pl_io_src_out_src1) < $signed(id_ex_pl_io_src_out_src2)); // @[Ctrl.scala 37:24]
  wire  _hi_T_1 = op1_ex != op2_ex; // @[Ctrl.scala 35:28]
  wire  _hi_T = op1_ex == op2_ex; // @[Ctrl.scala 34:28]
  wire  _hi_T_15 = 5'hc == exec_fun_ex ? _hi_T_1 : 5'hb == exec_fun_ex & _hi_T; // @[Mux.scala 80:57]
  wire  _hi_T_17 = 5'hd == exec_fun_ex ? _hi_T_7 : _hi_T_15; // @[Mux.scala 80:57]
  wire  _hi_T_19 = 5'he == exec_fun_ex ? _hi_T_8 : _hi_T_17; // @[Mux.scala 80:57]
  wire  _hi_T_21 = 5'h10 == exec_fun_ex ? _hi_T_10 : _hi_T_19; // @[Mux.scala 80:57]
  wire  branch_flag = 5'hf == exec_fun_ex ? _hi_T_11 : _hi_T_21; // @[Mux.scala 80:57]
  wire  jump_flag_ex = id_ex_pl_io_inst_is_jump_o; // @[core.scala 64:26 core.scala 162:16]
  wire [63:0] pc_ex = id_ex_pl_io_pc_and_inst_out_pc; // @[core.scala 148:19 core.scala 168:11]
  wire [63:0] imm_b_sext_ex = id_ex_pl_io_src_out_imm; // @[core.scala 149:27 core.scala 171:27]
  wire [63:0] branch_target = pc_ex + imm_b_sext_ex; // @[core.scala 211:26]
  wire [63:0] _alu_out_T_10 = op1_ex ^ op2_ex; // @[Ctrl.scala 27:24]
  wire [63:0] _alu_out_T_7 = op1_ex + op2_ex; // @[Ctrl.scala 26:25]
  wire [63:0] _alu_out_T_9 = _alu_out_T_7 & 64'hfffffffffffffffe; // @[Ctrl.scala 26:33]
  wire [63:0] _alu_out_T_5 = op1_ex | op2_ex; // @[Ctrl.scala 25:24]
  wire [63:0] _alu_out_T_4 = op1_ex & op2_ex; // @[Ctrl.scala 24:24]
  wire [63:0] _alu_out_T_3 = op1_ex - op2_ex; // @[Ctrl.scala 23:24]
  wire [63:0] _alu_out_T_12 = 5'h1 == exec_fun_ex ? _alu_out_T_7 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_14 = 5'h2 == exec_fun_ex ? _alu_out_T_3 : _alu_out_T_12; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_16 = 5'h3 == exec_fun_ex ? _alu_out_T_4 : _alu_out_T_14; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_18 = 5'h4 == exec_fun_ex ? _alu_out_T_5 : _alu_out_T_16; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_20 = 5'h11 == exec_fun_ex ? _alu_out_T_9 : _alu_out_T_18; // @[Mux.scala 80:57]
  wire [31:0] inst_id = if_id_pl_io_inst_o; // @[core.scala 57:21 core.scala 87:11]
  wire [4:0] rs1 = inst_id[19:15]; // @[core.scala 90:20]
  wire [4:0] rd = inst_id[11:7]; // @[core.scala 92:20]
  wire [11:0] imm_i = inst_id[31:20]; // @[core.scala 99:22]
  wire [51:0] imm_i_sext_hi = imm_i[11] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_i_sext = {imm_i_sext_hi,imm_i}; // @[Cat.scala 30:58]
  wire [6:0] imm_s_hi = inst_id[31:25]; // @[core.scala 102:26]
  wire [11:0] imm_s = {imm_s_hi,rd}; // @[Cat.scala 30:58]
  wire [51:0] imm_s_sext_hi = imm_s[11] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_s_sext = {imm_s_sext_hi,imm_s_hi,rd}; // @[Cat.scala 30:58]
  wire [19:0] imm_u = inst_id[31:12]; // @[core.scala 105:22]
  wire [43:0] imm_u_sext_hi = imm_u[19] ? 44'hfffffffffff : 44'h0; // @[Bitwise.scala 72:12]
  wire [75:0] imm_u_shifted = {imm_u_sext_hi,imm_u,12'h0}; // @[Cat.scala 30:58]
  wire  imm_j_hi_hi = inst_id[31]; // @[core.scala 109:26]
  wire [7:0] imm_j_hi_lo = inst_id[19:12]; // @[core.scala 109:38]
  wire [9:0] imm_j_lo_hi = inst_id[30:21]; // @[core.scala 109:53]
  wire  imm_j_lo_lo = inst_id[20]; // @[core.scala 109:68]
  wire [19:0] imm_j = {imm_j_hi_hi,imm_j_hi_lo,imm_j_lo_hi,imm_j_lo_lo}; // @[Cat.scala 30:58]
  wire [42:0] imm_j_sext_hi_hi = imm_j[19] ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_j_sext = {imm_j_sext_hi_hi,imm_j_hi_hi,imm_j_hi_lo,imm_j_lo_hi,imm_j_lo_lo,1'h0}; // @[Cat.scala 30:58]
  wire [63:0] imm_zext = {59'h0,rs1}; // @[Cat.scala 30:58]
  wire [31:0] _op_signals_T = inst_id & 32'h707f; // @[Lookup.scala 31:38]
  wire  _op_signals_T_1 = 32'h13 == _op_signals_T; // @[Lookup.scala 31:38]
  wire [31:0] _op_signals_T_2 = inst_id & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _op_signals_T_3 = 32'h33 == _op_signals_T_2; // @[Lookup.scala 31:38]
  wire  _op_signals_T_5 = 32'h40000033 == _op_signals_T_2; // @[Lookup.scala 31:38]
  wire [31:0] _op_signals_T_6 = inst_id & 32'h7f; // @[Lookup.scala 31:38]
  wire  _op_signals_T_7 = 32'h37 == _op_signals_T_6; // @[Lookup.scala 31:38]
  wire  _op_signals_T_9 = 32'h6f == _op_signals_T_6; // @[Lookup.scala 31:38]
  wire  _op_signals_T_11 = 32'h67 == _op_signals_T; // @[Lookup.scala 31:38]
  wire  _op_signals_T_13 = 32'h17 == _op_signals_T_6; // @[Lookup.scala 31:38]
  wire  _op_signals_T_15 = 32'h3023 == _op_signals_T; // @[Lookup.scala 31:38]
  wire  _op_signals_T_17 = 32'h63 == _op_signals_T; // @[Lookup.scala 31:38]
  wire [4:0] _op_signals_T_18 = _op_signals_T_17 ? 5'hb : 5'h0; // @[Lookup.scala 33:37]
  wire [4:0] _op_signals_T_19 = _op_signals_T_15 ? 5'h1 : _op_signals_T_18; // @[Lookup.scala 33:37]
  wire [4:0] _op_signals_T_20 = _op_signals_T_13 ? 5'h1 : _op_signals_T_19; // @[Lookup.scala 33:37]
  wire [4:0] _op_signals_T_21 = _op_signals_T_11 ? 5'h11 : _op_signals_T_20; // @[Lookup.scala 33:37]
  wire [4:0] _op_signals_T_22 = _op_signals_T_9 ? 5'h1 : _op_signals_T_21; // @[Lookup.scala 33:37]
  wire [4:0] _op_signals_T_23 = _op_signals_T_7 ? 5'h1 : _op_signals_T_22; // @[Lookup.scala 33:37]
  wire [4:0] _op_signals_T_24 = _op_signals_T_5 ? 5'h2 : _op_signals_T_23; // @[Lookup.scala 33:37]
  wire [4:0] _op_signals_T_25 = _op_signals_T_3 ? 5'h1 : _op_signals_T_24; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_26 = _op_signals_T_17 ? 2'h0 : 2'h2; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_27 = _op_signals_T_15 ? 2'h0 : _op_signals_T_26; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_28 = _op_signals_T_13 ? 2'h1 : _op_signals_T_27; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_29 = _op_signals_T_11 ? 2'h0 : _op_signals_T_28; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_30 = _op_signals_T_9 ? 2'h1 : _op_signals_T_29; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_31 = _op_signals_T_7 ? 2'h2 : _op_signals_T_30; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_32 = _op_signals_T_5 ? 2'h0 : _op_signals_T_31; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_33 = _op_signals_T_3 ? 2'h0 : _op_signals_T_32; // @[Lookup.scala 33:37]
  wire [1:0] op1_sel = _op_signals_T_1 ? 2'h0 : _op_signals_T_33; // @[Lookup.scala 33:37]
  wire [2:0] _op_signals_T_34 = _op_signals_T_17 ? 3'h1 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _op_signals_T_35 = _op_signals_T_15 ? 3'h3 : _op_signals_T_34; // @[Lookup.scala 33:37]
  wire [2:0] _op_signals_T_36 = _op_signals_T_13 ? 3'h4 : _op_signals_T_35; // @[Lookup.scala 33:37]
  wire [2:0] _op_signals_T_37 = _op_signals_T_11 ? 3'h2 : _op_signals_T_36; // @[Lookup.scala 33:37]
  wire [2:0] _op_signals_T_38 = _op_signals_T_9 ? 3'h5 : _op_signals_T_37; // @[Lookup.scala 33:37]
  wire [2:0] _op_signals_T_39 = _op_signals_T_7 ? 3'h4 : _op_signals_T_38; // @[Lookup.scala 33:37]
  wire [2:0] _op_signals_T_40 = _op_signals_T_5 ? 3'h1 : _op_signals_T_39; // @[Lookup.scala 33:37]
  wire [2:0] _op_signals_T_41 = _op_signals_T_3 ? 3'h1 : _op_signals_T_40; // @[Lookup.scala 33:37]
  wire [2:0] op2_sel = _op_signals_T_1 ? 3'h2 : _op_signals_T_41; // @[Lookup.scala 33:37]
  wire  _op_signals_T_44 = _op_signals_T_13 ? 1'h0 : _op_signals_T_15; // @[Lookup.scala 33:37]
  wire  _op_signals_T_45 = _op_signals_T_11 ? 1'h0 : _op_signals_T_44; // @[Lookup.scala 33:37]
  wire  _op_signals_T_46 = _op_signals_T_9 ? 1'h0 : _op_signals_T_45; // @[Lookup.scala 33:37]
  wire  _op_signals_T_47 = _op_signals_T_7 ? 1'h0 : _op_signals_T_46; // @[Lookup.scala 33:37]
  wire  _op_signals_T_48 = _op_signals_T_5 ? 1'h0 : _op_signals_T_47; // @[Lookup.scala 33:37]
  wire  _op_signals_T_49 = _op_signals_T_3 ? 1'h0 : _op_signals_T_48; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_60 = _op_signals_T_13 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_61 = _op_signals_T_11 ? 2'h2 : _op_signals_T_60; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_62 = _op_signals_T_9 ? 2'h2 : _op_signals_T_61; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_63 = _op_signals_T_7 ? 2'h1 : _op_signals_T_62; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_64 = _op_signals_T_5 ? 2'h1 : _op_signals_T_63; // @[Lookup.scala 33:37]
  wire [1:0] _op_signals_T_65 = _op_signals_T_3 ? 2'h1 : _op_signals_T_64; // @[Lookup.scala 33:37]
  wire [63:0] _op1_T_1 = 2'h0 == op1_sel ? rf_io_channel_rdata1 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _op1_T_3 = 2'h1 == op1_sel ? pc_reg : _op1_T_1; // @[Mux.scala 80:57]
  wire [63:0] _op2_T_1 = 3'h1 == op2_sel ? rf_io_channel_rdata2 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _op2_T_3 = 3'h2 == op2_sel ? imm_i_sext : _op2_T_1; // @[Mux.scala 80:57]
  wire [75:0] _op2_T_5 = 3'h4 == op2_sel ? imm_u_shifted : {{12'd0}, _op2_T_3}; // @[Mux.scala 80:57]
  wire [75:0] _op2_T_7 = 3'h5 == op2_sel ? {{12'd0}, imm_j_sext} : _op2_T_5; // @[Mux.scala 80:57]
  wire [75:0] op2 = 3'h3 == op2_sel ? {{12'd0}, imm_s_sext} : _op2_T_7; // @[Mux.scala 80:57]
  wire [63:0] pc_mem = ex_mem_pl_io_pc_and_inst_out_pc; // @[core.scala 220:20 core.scala 230:10]
  wire [1:0] wb_sel_wb = mem_wb_pl_io_wb_sel_io_reg_wtype_out; // @[core.scala 276:23 core.scala 295:13]
  wire [63:0] alu_out_wb = mem_wb_pl_io_alu_out_o; // @[core.scala 274:24 core.scala 301:14]
  wire [63:0] _wb_data_T_1 = 2'h1 == wb_sel_wb ? alu_out_wb : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] pc_plus4_wb = mem_wb_pl_io_pc_plus4_o; // @[core.scala 272:25 core.scala 286:15]
  wire [63:0] _wb_data_T_3 = 2'h2 == wb_sel_wb ? pc_plus4_wb : _wb_data_T_1; // @[Mux.scala 80:57]
  wire [63:0] Dmemrdata_wb = mem_wb_pl_io_Dmem_rdata_o; // @[core.scala 277:26 core.scala 298:16]
  wire [31:0] pc_id = if_id_pl_io_pc_o[31:0]; // @[core.scala 58:19 core.scala 88:11]
  wire [63:0] alu_out_mem = ex_mem_pl_io_alu_out_o; // @[core.scala 223:25 core.scala 240:15]
  wire [63:0] inst_wb = {{32'd0}, mem_wb_pl_io_pc_and_inst_o_inst}; // @[core.scala 271:21 core.scala 283:11]
  if_id if_id_pl ( // @[core.scala 27:24]
    .clock(if_id_pl_clock),
    .reset(if_id_pl_reset),
    .io_pc(if_id_pl_io_pc),
    .io_inst(if_id_pl_io_inst),
    .io_pc_o(if_id_pl_io_pc_o),
    .io_inst_o(if_id_pl_io_inst_o)
  );
  id_ex id_ex_pl ( // @[core.scala 28:24]
    .clock(id_ex_pl_clock),
    .reset(id_ex_pl_reset),
    .io_pc_and_inst_in_pc(id_ex_pl_io_pc_and_inst_in_pc),
    .io_pc_and_inst_in_inst(id_ex_pl_io_pc_and_inst_in_inst),
    .io_pc_and_inst_out_pc(id_ex_pl_io_pc_and_inst_out_pc),
    .io_pc_and_inst_out_inst(id_ex_pl_io_pc_and_inst_out_inst),
    .io_inst_is_jump_in(id_ex_pl_io_inst_is_jump_in),
    .io_inst_is_jump_o(id_ex_pl_io_inst_is_jump_o),
    .io_src_in_src1(id_ex_pl_io_src_in_src1),
    .io_src_in_src2(id_ex_pl_io_src_in_src2),
    .io_src_in_imm(id_ex_pl_io_src_in_imm),
    .io_src_out_src1(id_ex_pl_io_src_out_src1),
    .io_src_out_src2(id_ex_pl_io_src_out_src2),
    .io_src_out_imm(id_ex_pl_io_src_out_imm),
    .io_wb_addr_in(id_ex_pl_io_wb_addr_in),
    .io_wb_addr_o(id_ex_pl_io_wb_addr_o),
    .io_Dmem_wdata_in(id_ex_pl_io_Dmem_wdata_in),
    .io_Dmem_wdata_o(id_ex_pl_io_Dmem_wdata_o),
    .io_exeu_op(id_ex_pl_io_exeu_op),
    .io_exeu_op_o(id_ex_pl_io_exeu_op_o),
    .io_mem_wen_io_mem_wen_in(id_ex_pl_io_mem_wen_io_mem_wen_in),
    .io_mem_wen_io_mem_wen_o(id_ex_pl_io_mem_wen_io_mem_wen_o),
    .io_reg_wen_io_reg_wen_in(id_ex_pl_io_reg_wen_io_reg_wen_in),
    .io_reg_wen_io_reg_wen_o(id_ex_pl_io_reg_wen_io_reg_wen_o),
    .io_wb_type_io_reg_wtype_in(id_ex_pl_io_wb_type_io_reg_wtype_in),
    .io_wb_type_io_reg_wtype_out(id_ex_pl_io_wb_type_io_reg_wtype_out)
  );
  RF rf ( // @[core.scala 33:18]
    .clock(rf_clock),
    .io_channel_raddr1(rf_io_channel_raddr1),
    .io_channel_raddr2(rf_io_channel_raddr2),
    .io_channel_rdata1(rf_io_channel_rdata1),
    .io_channel_rdata2(rf_io_channel_rdata2),
    .io_channel_wen(rf_io_channel_wen),
    .io_channel_waddr(rf_io_channel_waddr),
    .io_channel_wdata(rf_io_channel_wdata)
  );
  ex_mem ex_mem_pl ( // @[core.scala 218:24]
    .clock(ex_mem_pl_clock),
    .reset(ex_mem_pl_reset),
    .io_pc_and_inst_in_pc(ex_mem_pl_io_pc_and_inst_in_pc),
    .io_pc_and_inst_in_inst(ex_mem_pl_io_pc_and_inst_in_inst),
    .io_pc_and_inst_out_pc(ex_mem_pl_io_pc_and_inst_out_pc),
    .io_pc_and_inst_out_inst(ex_mem_pl_io_pc_and_inst_out_inst),
    .io_alu_out_in(ex_mem_pl_io_alu_out_in),
    .io_alu_out_o(ex_mem_pl_io_alu_out_o),
    .io_wb_addr_in(ex_mem_pl_io_wb_addr_in),
    .io_wb_addr_o(ex_mem_pl_io_wb_addr_o),
    .io_Dmem_wdata_in(ex_mem_pl_io_Dmem_wdata_in),
    .io_Dmem_wdata_o(ex_mem_pl_io_Dmem_wdata_o),
    .io_mem_wen_io_mem_wen_in(ex_mem_pl_io_mem_wen_io_mem_wen_in),
    .io_mem_wen_io_mem_wen_o(ex_mem_pl_io_mem_wen_io_mem_wen_o),
    .io_rf_wen_io_reg_wen_in(ex_mem_pl_io_rf_wen_io_reg_wen_in),
    .io_rf_wen_io_reg_wen_o(ex_mem_pl_io_rf_wen_io_reg_wen_o),
    .io_wb_sel_io_reg_wtype_in(ex_mem_pl_io_wb_sel_io_reg_wtype_in),
    .io_wb_sel_io_reg_wtype_out(ex_mem_pl_io_wb_sel_io_reg_wtype_out)
  );
  mem_wb mem_wb_pl ( // @[core.scala 269:25]
    .clock(mem_wb_pl_clock),
    .reset(mem_wb_pl_reset),
    .io_pc_and_inst_in_pc(mem_wb_pl_io_pc_and_inst_in_pc),
    .io_pc_and_inst_in_inst(mem_wb_pl_io_pc_and_inst_in_inst),
    .io_pc_and_inst_o_pc(mem_wb_pl_io_pc_and_inst_o_pc),
    .io_pc_and_inst_o_inst(mem_wb_pl_io_pc_and_inst_o_inst),
    .io_pc_plus4_in(mem_wb_pl_io_pc_plus4_in),
    .io_pc_plus4_o(mem_wb_pl_io_pc_plus4_o),
    .io_wb_addr_in(mem_wb_pl_io_wb_addr_in),
    .io_wb_addr_o(mem_wb_pl_io_wb_addr_o),
    .io_alu_out_in(mem_wb_pl_io_alu_out_in),
    .io_alu_out_o(mem_wb_pl_io_alu_out_o),
    .io_rf_wen_io_reg_wen_in(mem_wb_pl_io_rf_wen_io_reg_wen_in),
    .io_rf_wen_io_reg_wen_o(mem_wb_pl_io_rf_wen_io_reg_wen_o),
    .io_wb_sel_io_reg_wtype_in(mem_wb_pl_io_wb_sel_io_reg_wtype_in),
    .io_wb_sel_io_reg_wtype_out(mem_wb_pl_io_wb_sel_io_reg_wtype_out),
    .io_Dmem_rdata_in(mem_wb_pl_io_Dmem_rdata_in),
    .io_Dmem_rdata_o(mem_wb_pl_io_Dmem_rdata_o)
  );
  dpi dpi ( // @[core.scala 328:21]
    .inst_in(dpi_inst_in)
  );
  assign io_Imemio_cen = ImemCenR; // @[core.scala 75:17]
  assign io_Imemio_pc = pc_reg; // @[core.scala 81:18]
  assign io_DMemio_addr = alu_out_mem[31:0]; // @[core.scala 263:18]
  assign io_DMemio_wen = ex_mem_pl_io_mem_wen_io_mem_wen_o; // @[core.scala 225:25 core.scala 246:15]
  assign io_DMemio_wdata = ex_mem_pl_io_Dmem_wdata_o; // @[core.scala 227:27 core.scala 252:17]
  assign io_Deubug_Debug_rf_wen = mem_wb_pl_io_rf_wen_io_reg_wen_o; // @[core.scala 275:23 core.scala 292:13]
  assign io_Deubug_Debug_rf_waddr = mem_wb_pl_io_wb_addr_o; // @[core.scala 273:24 core.scala 289:14]
  assign io_Deubug_Debug_rf_wdata = 2'h3 == wb_sel_wb ? Dmemrdata_wb : _wb_data_T_3; // @[Mux.scala 80:57]
  assign io_Deubug_Debug_pc = mem_wb_pl_io_pc_and_inst_o_pc; // @[core.scala 270:19 core.scala 280:9]
  assign io_Deubug_Debug_inst = inst_wb[31:0]; // @[core.scala 326:22]
  assign if_id_pl_clock = clock;
  assign if_id_pl_reset = reset;
  assign if_id_pl_io_pc = pc_reg; // @[core.scala 83:20]
  assign if_id_pl_io_inst = io_Imemio_inst; // @[core.scala 84:22]
  assign id_ex_pl_clock = clock;
  assign id_ex_pl_reset = reset;
  assign id_ex_pl_io_pc_and_inst_in_pc = {{32'd0}, pc_id}; // @[core.scala 58:19 core.scala 88:11]
  assign id_ex_pl_io_pc_and_inst_in_inst = if_id_pl_io_inst_o; // @[core.scala 57:21 core.scala 87:11]
  assign id_ex_pl_io_inst_is_jump_in = _op_signals_T_9 | _op_signals_T_11; // @[core.scala 145:35]
  assign id_ex_pl_io_src_in_src1 = 2'h3 == op1_sel ? imm_zext : _op1_T_3; // @[Mux.scala 80:57]
  assign id_ex_pl_io_src_in_src2 = op2[63:0]; // @[core.scala 174:27]
  assign id_ex_pl_io_src_in_imm = id_ex_pl_io_src_out_imm; // @[core.scala 149:27 core.scala 171:27]
  assign id_ex_pl_io_wb_addr_in = inst_id[11:7]; // @[core.scala 92:20]
  assign id_ex_pl_io_Dmem_wdata_in = rf_io_channel_rdata2; // @[core.scala 193:29]
  assign id_ex_pl_io_exeu_op = _op_signals_T_1 ? 5'h1 : _op_signals_T_25; // @[Lookup.scala 33:37]
  assign id_ex_pl_io_mem_wen_io_mem_wen_in = _op_signals_T_1 ? 1'h0 : _op_signals_T_49; // @[Lookup.scala 33:37]
  assign id_ex_pl_io_reg_wen_io_reg_wen_in = _op_signals_T_1 | (_op_signals_T_3 | (_op_signals_T_5 | (_op_signals_T_7 |
    (_op_signals_T_9 | (_op_signals_T_11 | _op_signals_T_13))))); // @[Lookup.scala 33:37]
  assign id_ex_pl_io_wb_type_io_reg_wtype_in = _op_signals_T_1 ? 2'h1 : _op_signals_T_65; // @[Lookup.scala 33:37]
  assign rf_clock = clock;
  assign rf_io_channel_raddr1 = inst_id[19:15]; // @[core.scala 90:20]
  assign rf_io_channel_raddr2 = inst_id[24:20]; // @[core.scala 91:20]
  assign rf_io_channel_wen = mem_wb_pl_io_rf_wen_io_reg_wen_o; // @[core.scala 275:23 core.scala 292:13]
  assign rf_io_channel_waddr = mem_wb_pl_io_wb_addr_o; // @[core.scala 273:24 core.scala 289:14]
  assign rf_io_channel_wdata = 2'h3 == wb_sel_wb ? Dmemrdata_wb : _wb_data_T_3; // @[Mux.scala 80:57]
  assign ex_mem_pl_clock = clock;
  assign ex_mem_pl_reset = reset;
  assign ex_mem_pl_io_pc_and_inst_in_pc = id_ex_pl_io_pc_and_inst_out_pc; // @[core.scala 148:19 core.scala 168:11]
  assign ex_mem_pl_io_pc_and_inst_in_inst = id_ex_pl_io_pc_and_inst_out_inst; // @[core.scala 60:21 core.scala 167:11]
  assign ex_mem_pl_io_alu_out_in = 5'h5 == exec_fun_ex ? _alu_out_T_10 : _alu_out_T_20; // @[Mux.scala 80:57]
  assign ex_mem_pl_io_wb_addr_in = id_ex_pl_io_wb_addr_o; // @[core.scala 156:24 core.scala 191:39]
  assign ex_mem_pl_io_Dmem_wdata_in = id_ex_pl_io_Dmem_wdata_o; // @[core.scala 157:27 core.scala 194:17]
  assign ex_mem_pl_io_mem_wen_io_mem_wen_in = id_ex_pl_io_mem_wen_io_mem_wen_o; // @[core.scala 153:23 core.scala 182:39]
  assign ex_mem_pl_io_rf_wen_io_reg_wen_in = id_ex_pl_io_reg_wen_io_reg_wen_o; // @[core.scala 154:23 core.scala 185:39]
  assign ex_mem_pl_io_wb_sel_io_reg_wtype_in = id_ex_pl_io_wb_type_io_reg_wtype_out; // @[core.scala 155:23 core.scala 188:39]
  assign mem_wb_pl_clock = clock;
  assign mem_wb_pl_reset = reset;
  assign mem_wb_pl_io_pc_and_inst_in_pc = ex_mem_pl_io_pc_and_inst_out_pc; // @[core.scala 220:20 core.scala 230:10]
  assign mem_wb_pl_io_pc_and_inst_in_inst = ex_mem_pl_io_pc_and_inst_out_inst; // @[core.scala 221:22 core.scala 233:12]
  assign mem_wb_pl_io_pc_plus4_in = pc_mem + 64'h4; // @[core.scala 266:29]
  assign mem_wb_pl_io_wb_addr_in = ex_mem_pl_io_wb_addr_o; // @[core.scala 222:25 core.scala 237:15]
  assign mem_wb_pl_io_alu_out_in = ex_mem_pl_io_alu_out_o; // @[core.scala 223:25 core.scala 240:15]
  assign mem_wb_pl_io_rf_wen_io_reg_wen_in = ex_mem_pl_io_rf_wen_io_reg_wen_o; // @[core.scala 224:24 core.scala 243:14]
  assign mem_wb_pl_io_wb_sel_io_reg_wtype_in = ex_mem_pl_io_wb_sel_io_reg_wtype_out; // @[core.scala 226:24 core.scala 249:14]
  assign mem_wb_pl_io_Dmem_rdata_in = io_DMemio_rdata; // @[core.scala 297:30]
  assign dpi_inst_in = inst_wb[31:0]; // @[core.scala 329:20]
  always @(posedge clock) begin
    if (reset) begin // @[core.scala 38:26]
      ImemCenR <= 1'h0; // @[core.scala 38:26]
    end else begin
      ImemCenR <= 1'h1; // @[core.scala 39:12]
    end
    if (~io_Imemio_cen) begin // @[core.scala 76:32]
      pc_reg <= 64'h80000000; // @[core.scala 77:12]
    end else if (jump_flag_ex) begin // @[Mux.scala 98:16]
      if (jump_flag_ex) begin // @[core.scala 205:21]
        if (5'h5 == exec_fun_ex) begin // @[Mux.scala 80:57]
          pc_reg <= _alu_out_T_10;
        end else begin
          pc_reg <= _alu_out_T_20;
        end
      end else begin
        pc_reg <= 64'h0;
      end
    end else if (branch_flag) begin // @[Mux.scala 98:16]
      pc_reg <= branch_target;
    end else begin
      pc_reg <= pc_plus4;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ImemCenR = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  pc_reg = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
