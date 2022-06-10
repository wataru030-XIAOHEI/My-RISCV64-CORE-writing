module GprAddrGen(
  input  [31:0] io_in,
  output [4:0]  io_o_rs1,
  output [4:0]  io_o_rs2,
  output [4:0]  io_o_rd
);
  assign io_o_rs1 = io_in[19:15]; // @[Decoder.scala 134:20]
  assign io_o_rs2 = io_in[24:20]; // @[Decoder.scala 135:20]
  assign io_o_rd = io_in[11:7]; // @[Decoder.scala 136:20]
endmodule
module Alu(
  input  [6:0]  io_excTy,
  input  [63:0] io_opVec_0,
  input  [63:0] io_opVec_1,
  output [63:0] io_result
);
  wire  _op2_T = io_excTy == 7'h2; // @[Alu.scala 7:39]
  wire [63:0] _op2_T_1 = ~io_opVec_1; // @[Alu.scala 38:41]
  wire [63:0] _op2_T_3 = _op2_T_1 + 64'h1; // @[Alu.scala 38:63]
  wire [63:0] op2 = _op2_T ? _op2_T_3 : io_opVec_1; // @[Alu.scala 38:23]
  wire [63:0] _add_sub_result_T_1 = io_opVec_0 + op2; // @[Alu.scala 44:23]
  wire [31:0] add_sub_result_ret_hi = _add_sub_result_T_1[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] add_sub_result_ret_lo = _add_sub_result_T_1[31:0]; // @[Alu.scala 16:57]
  wire [63:0] add_sub_result_ret = {add_sub_result_ret_hi,add_sub_result_ret_lo}; // @[Cat.scala 30:58]
  wire [63:0] _add_sub_result_T_7 = 7'h1 == io_excTy ? _add_sub_result_T_1 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _add_sub_result_T_9 = 7'h2 == io_excTy ? _add_sub_result_T_1 : _add_sub_result_T_7; // @[Mux.scala 80:57]
  wire [63:0] add_sub_result = 7'h4 == io_excTy ? add_sub_result_ret : _add_sub_result_T_9; // @[Mux.scala 80:57]
  wire [63:0] _logicShiftResult_T_1 = _op2_T ? _op2_T_3 : io_opVec_1; // @[Alu.scala 50:45]
  wire  _logicShiftResult_T_2 = $signed(io_opVec_0) < $signed(_logicShiftResult_T_1); // @[Alu.scala 50:33]
  wire  _logicShiftResult_T_3 = io_opVec_0 < op2; // @[Alu.scala 51:33]
  wire [63:0] _logicShiftResult_T_5 = 7'h3 == io_excTy ? {{63'd0}, _logicShiftResult_T_2} : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] logicShiftResult = 7'h5 == io_excTy ? {{63'd0}, _logicShiftResult_T_3} : _logicShiftResult_T_5; // @[Mux.scala 80:57]
  wire  _io_result_T_2 = io_excTy == 7'h3 | io_excTy == 7'h5; // @[Alu.scala 8:59]
  assign io_result = _io_result_T_2 ? logicShiftResult : add_sub_result; // @[Mux.scala 98:16]
endmodule
module Core(
  input         clock,
  input         reset,
  output [63:0] io_debug_debugPc,
  output [31:0] io_debug_debugInst,
  output        io_debug_debugwen,
  output [4:0]  io_debug_debugwaddr,
  output [63:0] io_debug_debugdata,
  output [63:0] io_imem_addr,
  input  [31:0] io_imem_rdata,
  output        io_imem_cen,
  output        io_imem_wen,
  output [63:0] io_imem_wdata,
  output [63:0] io_dmem_addr,
  input  [63:0] io_dmem_rdata,
  output        io_dmem_cen,
  output        io_dmem_wen,
  output [63:0] io_dmem_wdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [31:0] _RAND_29;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] gpr [0:31]; // @[rf.scala 13:26]
  wire [63:0] gpr_id_rs_ret_MPORT_data; // @[rf.scala 13:26]
  wire [4:0] gpr_id_rs_ret_MPORT_addr; // @[rf.scala 13:26]
  wire [63:0] gpr_id_rs_ret_MPORT_1_data; // @[rf.scala 13:26]
  wire [4:0] gpr_id_rs_ret_MPORT_1_addr; // @[rf.scala 13:26]
  wire [63:0] gpr_MPORT_data; // @[rf.scala 13:26]
  wire [4:0] gpr_MPORT_addr; // @[rf.scala 13:26]
  wire  gpr_MPORT_mask; // @[rf.scala 13:26]
  wire  gpr_MPORT_en; // @[rf.scala 13:26]
  wire [31:0] GprAddrGen_io_in; // @[Core.scala 92:26]
  wire [4:0] GprAddrGen_io_o_rs1; // @[Core.scala 92:26]
  wire [4:0] GprAddrGen_io_o_rs2; // @[Core.scala 92:26]
  wire [4:0] GprAddrGen_io_o_rd; // @[Core.scala 92:26]
  wire [6:0] Alu_io_excTy; // @[Core.scala 165:19]
  wire [63:0] Alu_io_opVec_0; // @[Core.scala 165:19]
  wire [63:0] Alu_io_opVec_1; // @[Core.scala 165:19]
  wire [63:0] Alu_io_result; // @[Core.scala 165:19]
  wire [31:0] dpi_inst; // @[Core.scala 252:19]
  reg [63:0] pcreg; // @[Core.scala 45:33]
  reg  cenreg; // @[Core.scala 46:33]
  wire [63:0] seq_pc = pcreg + 64'h4; // @[Core.scala 49:32]
  reg [31:0] If2IdInst; // @[Core.scala 72:35]
  wire [31:0] _ctriSigs_deco_T_260 = If2IdInst & 32'h707f; // @[Decoder.scala 102:53]
  wire  _ctriSigs_deco_T_261 = 32'h13 == _ctriSigs_deco_T_260; // @[Decoder.scala 102:53]
  wire [31:0] _ctriSigs_deco_T_262 = If2IdInst & 32'h7f; // @[Decoder.scala 102:53]
  wire  _ctriSigs_deco_T_263 = 32'h17 == _ctriSigs_deco_T_262; // @[Decoder.scala 102:53]
  wire  _ctriSigs_deco_T_265 = 32'h37 == _ctriSigs_deco_T_262; // @[Decoder.scala 102:53]
  wire  _ctriSigs_deco_T_267 = 32'h6f == _ctriSigs_deco_T_262; // @[Decoder.scala 102:53]
  wire  _ctriSigs_deco_T_269 = 32'h67 == _ctriSigs_deco_T_260; // @[Decoder.scala 102:53]
  wire  _ctriSigs_deco_T_271 = 32'h63 == _ctriSigs_deco_T_260; // @[Decoder.scala 102:53]
  wire  _ctriSigs_deco_T_273 = 32'h2003 == _ctriSigs_deco_T_260; // @[Decoder.scala 102:53]
  wire  _ctriSigs_deco_T_275 = 32'h2023 == _ctriSigs_deco_T_260; // @[Decoder.scala 102:53]
  wire  _ctriSigs_deco_T_277 = 32'h3023 == _ctriSigs_deco_T_260; // @[Decoder.scala 102:53]
  wire  _ctriSigs_deco_T_282 = _ctriSigs_deco_T_269 ? 1'h0 : _ctriSigs_deco_T_271; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_283 = _ctriSigs_deco_T_267 ? 1'h0 : _ctriSigs_deco_T_282; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_284 = _ctriSigs_deco_T_265 ? 1'h0 : _ctriSigs_deco_T_283; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_285 = _ctriSigs_deco_T_263 ? 1'h0 : _ctriSigs_deco_T_284; // @[Mux.scala 98:16]
  wire  ctriSigs_deco_10 = _ctriSigs_deco_T_261 ? 1'h0 : _ctriSigs_deco_T_285; // @[Mux.scala 98:16]
  wire [2:0] ctriSigs_bTy = {{2'd0}, ctriSigs_deco_10}; // @[Core.scala 90:22 Decoder.scala 48:39]
  wire  _ctriSigs_deco_T_72 = _ctriSigs_deco_T_273 | (_ctriSigs_deco_T_275 | _ctriSigs_deco_T_277); // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_73 = _ctriSigs_deco_T_271 ? 2'h3 : {{1'd0}, _ctriSigs_deco_T_72}; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_74 = _ctriSigs_deco_T_269 ? 2'h2 : _ctriSigs_deco_T_73; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_75 = _ctriSigs_deco_T_267 ? 2'h2 : _ctriSigs_deco_T_74; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_76 = _ctriSigs_deco_T_265 ? 2'h3 : _ctriSigs_deco_T_75; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_77 = _ctriSigs_deco_T_263 ? 2'h2 : _ctriSigs_deco_T_76; // @[Mux.scala 98:16]
  wire [1:0] ctriSigs_deco_2 = _ctriSigs_deco_T_261 ? 2'h1 : _ctriSigs_deco_T_77; // @[Mux.scala 98:16]
  reg [63:0] If2IdPc; // @[Core.scala 71:35]
  reg  exCtrlSigs_rfwen; // @[Core.scala 141:28]
  reg [4:0] exRd; // @[Core.scala 145:28]
  wire  _rsVec_0_T_1 = exCtrlSigs_rfwen & exRd == GprAddrGen_io_o_rs1; // @[Core.scala 105:22]
  wire [63:0] exBypassing_wr = Alu_io_result; // @[Core.scala 22:25 Core.scala 178:18]
  reg  ctrlSigsMem_rfwen; // @[Core.scala 180:32]
  reg [4:0] rdMem; // @[Core.scala 182:32]
  wire  _rsVec_0_T_3 = ctrlSigsMem_rfwen & rdMem == GprAddrGen_io_o_rs1; // @[Core.scala 106:23]
  reg [2:0] ctrlSigsMem_wbdSel; // @[Core.scala 180:32]
  reg [63:0] alu_resultMem; // @[Core.scala 181:32]
  wire [63:0] MemWbData = 3'h2 == ctrlSigsMem_wbdSel ? io_dmem_rdata : alu_resultMem; // @[Mux.scala 80:57]
  reg  ctrlSigsWb_rfwen; // @[Core.scala 227:28]
  reg [4:0] wbAddr; // @[Core.scala 231:28]
  wire  _rsVec_0_T_5 = ctrlSigsWb_rfwen & wbAddr == GprAddrGen_io_o_rs1; // @[Core.scala 107:22]
  reg [63:0] wbData; // @[Core.scala 230:28]
  wire [63:0] id_rs_0 = GprAddrGen_io_o_rs1 == 5'h0 ? 64'h0 : gpr_id_rs_ret_MPORT_data; // @[rf.scala 31:18]
  wire [63:0] _rsVec_0_T_6 = _rsVec_0_T_5 ? wbData : id_rs_0; // @[Mux.scala 98:16]
  wire [63:0] _rsVec_0_T_7 = _rsVec_0_T_3 ? MemWbData : _rsVec_0_T_6; // @[Mux.scala 98:16]
  wire [63:0] _opVec_0_T = _rsVec_0_T_1 ? exBypassing_wr : _rsVec_0_T_7; // @[Core.scala 120:44]
  wire [63:0] _opVec_0_T_4 = 2'h2 == ctriSigs_deco_2 ? If2IdPc : _opVec_0_T; // @[Mux.scala 80:57]
  wire [63:0] _branchBus_flag_T = 2'h3 == ctriSigs_deco_2 ? 64'h0 : _opVec_0_T_4; // @[Core.scala 130:68]
  wire [63:0] _branchBus_flag_T_9 = 2'h3 == ctriSigs_deco_2 ? 64'h0 : _opVec_0_T_4; // @[Bru.scala 18:29]
  wire [1:0] _ctriSigs_deco_T_96 = _ctriSigs_deco_T_277 ? 2'h2 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_97 = _ctriSigs_deco_T_275 ? 2'h2 : _ctriSigs_deco_T_96; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_98 = _ctriSigs_deco_T_273 ? 2'h2 : _ctriSigs_deco_T_97; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_99 = _ctriSigs_deco_T_271 ? 2'h3 : _ctriSigs_deco_T_98; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_100 = _ctriSigs_deco_T_269 ? 2'h2 : _ctriSigs_deco_T_99; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_101 = _ctriSigs_deco_T_267 ? 3'h4 : {{1'd0}, _ctriSigs_deco_T_100}; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_102 = _ctriSigs_deco_T_265 ? 3'h2 : _ctriSigs_deco_T_101; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_103 = _ctriSigs_deco_T_263 ? 3'h3 : _ctriSigs_deco_T_102; // @[Mux.scala 98:16]
  wire [2:0] ctriSigs_deco_3 = _ctriSigs_deco_T_261 ? 3'h2 : _ctriSigs_deco_T_103; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_18 = _ctriSigs_deco_T_277 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_19 = _ctriSigs_deco_T_275 ? 2'h1 : _ctriSigs_deco_T_18; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_20 = _ctriSigs_deco_T_273 ? 2'h1 : _ctriSigs_deco_T_19; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_21 = _ctriSigs_deco_T_271 ? 2'h2 : _ctriSigs_deco_T_20; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_22 = _ctriSigs_deco_T_269 ? 2'h1 : _ctriSigs_deco_T_21; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_23 = _ctriSigs_deco_T_267 ? 3'h4 : {{1'd0}, _ctriSigs_deco_T_22}; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_24 = _ctriSigs_deco_T_265 ? 3'h5 : _ctriSigs_deco_T_23; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_25 = _ctriSigs_deco_T_263 ? 3'h5 : _ctriSigs_deco_T_24; // @[Mux.scala 98:16]
  wire [2:0] ctriSigs_deco_0 = _ctriSigs_deco_T_261 ? 3'h1 : _ctriSigs_deco_T_25; // @[Mux.scala 98:16]
  wire [31:0] ctriSigs_instTy = {{29'd0}, ctriSigs_deco_0}; // @[Core.scala 90:22 Decoder.scala 48:39]
  wire  _imm_sigBit_T = ctriSigs_instTy == 32'h6; // @[Decoder.scala 108:38]
  wire  imm_sigBit = ctriSigs_instTy == 32'h6 ? 1'h0 : If2IdInst[31]; // @[Decoder.scala 108:29]
  wire [32:0] imm_hi_hi_hi = imm_sigBit ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 72:12]
  wire  _imm_b30_20_T = ctriSigs_instTy == 32'h5; // @[Decoder.scala 109:38]
  wire [10:0] _imm_b30_20_T_3 = imm_sigBit ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [10:0] imm_hi_hi_lo = ctriSigs_instTy == 32'h5 ? If2IdInst[30:20] : _imm_b30_20_T_3; // @[Decoder.scala 109:29]
  wire [7:0] _imm_b19_12_T_4 = imm_sigBit ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] imm_hi_lo_hi = ctriSigs_instTy != 32'h5 & ctriSigs_instTy != 32'h4 ? _imm_b19_12_T_4 : If2IdInst[19:12]; // @[Decoder.scala 110:29]
  wire  _imm_b11_T = ctriSigs_instTy == 32'h2; // @[Decoder.scala 111:38]
  wire  _imm_b11_T_6 = _imm_b30_20_T | _imm_sigBit_T; // @[Decoder.scala 113:46]
  wire  _imm_b11_T_7 = _imm_b30_20_T | _imm_sigBit_T ? 1'h0 : imm_sigBit; // @[Decoder.scala 113:31]
  wire  _imm_b11_T_8 = ctriSigs_instTy == 32'h4 ? If2IdInst[20] : _imm_b11_T_7; // @[Decoder.scala 112:31]
  wire  imm_hi_lo_lo = ctriSigs_instTy == 32'h2 ? If2IdInst[7] : _imm_b11_T_8; // @[Decoder.scala 111:29]
  wire [5:0] imm_lo_hi_hi = _imm_b11_T_6 ? 6'h0 : If2IdInst[30:25]; // @[Decoder.scala 114:29]
  wire  _imm_b4_1_T_1 = ctriSigs_instTy == 32'h3; // @[Decoder.scala 116:39]
  wire [3:0] _imm_b4_1_T_8 = _imm_sigBit_T ? If2IdInst[19:16] : If2IdInst[24:21]; // @[Decoder.scala 117:30]
  wire [3:0] _imm_b4_1_T_9 = ctriSigs_instTy == 32'h3 | _imm_b11_T ? If2IdInst[11:8] : _imm_b4_1_T_8; // @[Decoder.scala 116:30]
  wire [3:0] imm_lo_hi_lo = _imm_b30_20_T ? 4'h0 : _imm_b4_1_T_9; // @[Decoder.scala 115:29]
  wire  _imm_b0_T_6 = _imm_sigBit_T & If2IdInst[15]; // @[Decoder.scala 120:31]
  wire  _imm_b0_T_7 = ctriSigs_instTy == 32'h1 ? If2IdInst[20] : _imm_b0_T_6; // @[Decoder.scala 119:31]
  wire  imm_lo_lo = _imm_b4_1_T_1 ? If2IdInst[7] : _imm_b0_T_7; // @[Decoder.scala 118:29]
  wire [63:0] _opVec_1_T_1 = {imm_hi_hi_hi,imm_hi_hi_lo,imm_hi_lo_hi,imm_hi_lo_lo,imm_lo_hi_hi,imm_lo_hi_lo,imm_lo_lo}; // @[Core.scala 121:57]
  wire  _rsVec_1_T_1 = exCtrlSigs_rfwen & exRd == GprAddrGen_io_o_rs2; // @[Core.scala 110:22]
  wire  _rsVec_1_T_3 = ctrlSigsMem_rfwen & rdMem == GprAddrGen_io_o_rs2; // @[Core.scala 111:23]
  wire  _rsVec_1_T_5 = ctrlSigsWb_rfwen & wbAddr == GprAddrGen_io_o_rs2; // @[Core.scala 112:22]
  wire [63:0] id_rs_1 = GprAddrGen_io_o_rs2 == 5'h0 ? 64'h0 : gpr_id_rs_ret_MPORT_1_data; // @[rf.scala 31:18]
  wire [63:0] _rsVec_1_T_6 = _rsVec_1_T_5 ? wbData : id_rs_1; // @[Mux.scala 98:16]
  wire [63:0] _rsVec_1_T_7 = _rsVec_1_T_3 ? MemWbData : _rsVec_1_T_6; // @[Mux.scala 98:16]
  wire [63:0] _opVec_1_T = _rsVec_1_T_1 ? exBypassing_wr : _rsVec_1_T_7; // @[Core.scala 121:44]
  wire [63:0] _opVec_1_T_5 = 3'h2 == ctriSigs_deco_3 ? _opVec_1_T_1 : _opVec_1_T; // @[Mux.scala 80:57]
  wire [63:0] _opVec_1_T_7 = 3'h4 == ctriSigs_deco_3 ? 64'h4 : _opVec_1_T_5; // @[Mux.scala 80:57]
  wire [63:0] _branchBus_flag_T_1 = 3'h3 == ctriSigs_deco_3 ? 64'h0 : _opVec_1_T_7; // @[Core.scala 130:86]
  wire [63:0] _branchBus_flag_T_10 = 3'h3 == ctriSigs_deco_3 ? 64'h0 : _opVec_1_T_7; // @[Bru.scala 18:46]
  wire  _branchBus_flag_T_11 = _branchBus_flag_T_9 >= _branchBus_flag_T_10; // @[Bru.scala 18:33]
  wire  _branchBus_flag_T_8 = $signed(_branchBus_flag_T) >= $signed(_branchBus_flag_T_1); // @[Bru.scala 17:33]
  wire  _branchBus_flag_T_7 = _branchBus_flag_T_9 < _branchBus_flag_T_10; // @[Bru.scala 16:33]
  wire  _branchBus_flag_T_4 = $signed(_branchBus_flag_T) < $signed(_branchBus_flag_T_1); // @[Bru.scala 15:33]
  wire  _branchBus_flag_T_3 = $signed(_branchBus_flag_T) != $signed(_branchBus_flag_T_1); // @[Bru.scala 14:32]
  wire  _branchBus_flag_T_2 = $signed(_branchBus_flag_T) == $signed(_branchBus_flag_T_1); // @[Bru.scala 13:32]
  wire  _branchBus_flag_T_15 = 3'h2 == ctriSigs_bTy ? _branchBus_flag_T_3 : 3'h1 == ctriSigs_bTy & _branchBus_flag_T_2; // @[Mux.scala 80:57]
  wire  _branchBus_flag_T_17 = 3'h3 == ctriSigs_bTy ? _branchBus_flag_T_4 : _branchBus_flag_T_15; // @[Mux.scala 80:57]
  wire  _branchBus_flag_T_19 = 3'h4 == ctriSigs_bTy ? _branchBus_flag_T_7 : _branchBus_flag_T_17; // @[Mux.scala 80:57]
  wire  _branchBus_flag_T_21 = 3'h5 == ctriSigs_bTy ? _branchBus_flag_T_8 : _branchBus_flag_T_19; // @[Mux.scala 80:57]
  wire  _branchBus_flag_T_23 = 3'h6 == ctriSigs_bTy ? _branchBus_flag_T_11 : _branchBus_flag_T_21; // @[Mux.scala 80:57]
  wire  branchBus_flag = _branchBus_flag_T_23 | _ctriSigs_deco_T_269 | _ctriSigs_deco_T_267; // @[Core.scala 131:45]
  wire [63:0] jump_target = _opVec_0_T + _opVec_1_T_1; // @[Core.scala 129:37]
  wire [63:0] _branchBus_target_T_3 = jump_target & 64'hfffffffffffffffe; // @[Core.scala 133:41]
  wire [63:0] _branchBus_target_T_6 = If2IdPc + _opVec_1_T_1; // @[Core.scala 133:75]
  wire [63:0] branchBus_target = _ctriSigs_deco_T_269 ? _branchBus_target_T_3 : _branchBus_target_T_6; // @[Core.scala 132:26]
  reg  exCtrlSigs_memcen; // @[Core.scala 141:28]
  reg [3:0] exCtrlSigs_memwen; // @[Core.scala 141:28]
  wire  load_stall = exCtrlSigs_memcen & exCtrlSigs_memwen == 4'h0; // @[Decoder.scala 171:24]
  wire  ctriSigs_deco_1 = _ctriSigs_deco_T_261 | (_ctriSigs_deco_T_263 | (_ctriSigs_deco_T_265 | (_ctriSigs_deco_T_267
     | (_ctriSigs_deco_T_269 | (_ctriSigs_deco_T_271 | (_ctriSigs_deco_T_273 | (_ctriSigs_deco_T_275 |
    _ctriSigs_deco_T_277))))))); // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_125 = _ctriSigs_deco_T_271 ? 1'h0 : _ctriSigs_deco_T_273 | (_ctriSigs_deco_T_275 |
    _ctriSigs_deco_T_277); // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_126 = _ctriSigs_deco_T_269 ? 1'h0 : _ctriSigs_deco_T_125; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_127 = _ctriSigs_deco_T_267 ? 1'h0 : _ctriSigs_deco_T_126; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_128 = _ctriSigs_deco_T_265 ? 1'h0 : _ctriSigs_deco_T_127; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_148 = _ctriSigs_deco_T_277 ? 4'hf : 4'h0; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_149 = _ctriSigs_deco_T_275 ? 4'hf : _ctriSigs_deco_T_148; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_150 = _ctriSigs_deco_T_273 ? 4'h0 : _ctriSigs_deco_T_149; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_151 = _ctriSigs_deco_T_271 ? 4'h0 : _ctriSigs_deco_T_150; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_152 = _ctriSigs_deco_T_269 ? 4'h0 : _ctriSigs_deco_T_151; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_153 = _ctriSigs_deco_T_267 ? 4'h0 : _ctriSigs_deco_T_152; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_154 = _ctriSigs_deco_T_265 ? 4'h0 : _ctriSigs_deco_T_153; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_177 = _ctriSigs_deco_T_271 ? 1'h0 : _ctriSigs_deco_T_273; // @[Mux.scala 98:16]
  wire  ctriSigs_deco_6 = _ctriSigs_deco_T_261 | (_ctriSigs_deco_T_263 | (_ctriSigs_deco_T_265 | (_ctriSigs_deco_T_267
     | (_ctriSigs_deco_T_269 | _ctriSigs_deco_T_177)))); // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_202 = _ctriSigs_deco_T_273 ? 2'h2 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_203 = _ctriSigs_deco_T_271 ? 2'h0 : _ctriSigs_deco_T_202; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_204 = _ctriSigs_deco_T_269 ? 2'h1 : _ctriSigs_deco_T_203; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_205 = _ctriSigs_deco_T_267 ? 2'h1 : _ctriSigs_deco_T_204; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_206 = _ctriSigs_deco_T_265 ? 2'h1 : _ctriSigs_deco_T_205; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_207 = _ctriSigs_deco_T_263 ? 2'h1 : _ctriSigs_deco_T_206; // @[Mux.scala 98:16]
  wire [1:0] ctriSigs_deco_7 = _ctriSigs_deco_T_261 ? 2'h1 : _ctriSigs_deco_T_207; // @[Mux.scala 98:16]
  reg [6:0] exCtrlSigs_excTy; // @[Core.scala 141:28]
  reg [2:0] exCtrlSigs_wbdSel; // @[Core.scala 141:28]
  reg [63:0] exOpVec_0; // @[Core.scala 142:28]
  reg [63:0] exOpVec_1; // @[Core.scala 142:28]
  reg [63:0] exPc; // @[Core.scala 143:28]
  reg [31:0] exInst; // @[Core.scala 144:28]
  reg [63:0] exStoreData; // @[Core.scala 146:28]
  wire [2:0] ctriSigs_wbdSel = {{1'd0}, ctriSigs_deco_7}; // @[Core.scala 90:22 Decoder.scala 48:39]
  wire  _GEN_10 = load_stall | ctriSigs_deco_6; // @[Core.scala 148:30 Core.scala 149:17 Core.scala 156:17]
  wire [6:0] ctriSigs_excTy = {{6'd0}, ctriSigs_deco_1}; // @[Core.scala 90:22 Decoder.scala 48:39]
  reg  ctrlSigsMem_memcen; // @[Core.scala 180:32]
  reg [3:0] ctrlSigsMem_memwen; // @[Core.scala 180:32]
  reg [63:0] pcMem; // @[Core.scala 183:32]
  reg [31:0] instMem; // @[Core.scala 184:32]
  reg [63:0] storeDataMem; // @[Core.scala 185:32]
  reg [63:0] pcWb; // @[Core.scala 228:28]
  reg [31:0] instWb; // @[Core.scala 229:28]
  wire  _T_7 = wbAddr != 5'h0; // @[rf.scala 21:18]
  GprAddrGen GprAddrGen ( // @[Core.scala 92:26]
    .io_in(GprAddrGen_io_in),
    .io_o_rs1(GprAddrGen_io_o_rs1),
    .io_o_rs2(GprAddrGen_io_o_rs2),
    .io_o_rd(GprAddrGen_io_o_rd)
  );
  Alu Alu ( // @[Core.scala 165:19]
    .io_excTy(Alu_io_excTy),
    .io_opVec_0(Alu_io_opVec_0),
    .io_opVec_1(Alu_io_opVec_1),
    .io_result(Alu_io_result)
  );
  dpi dpi ( // @[Core.scala 252:19]
    .inst(dpi_inst)
  );
  assign gpr_id_rs_ret_MPORT_addr = GprAddrGen_io_o_rs1;
  assign gpr_id_rs_ret_MPORT_data = gpr[gpr_id_rs_ret_MPORT_addr]; // @[rf.scala 13:26]
  assign gpr_id_rs_ret_MPORT_1_addr = GprAddrGen_io_o_rs2;
  assign gpr_id_rs_ret_MPORT_1_data = gpr[gpr_id_rs_ret_MPORT_1_addr]; // @[rf.scala 13:26]
  assign gpr_MPORT_data = wbData;
  assign gpr_MPORT_addr = wbAddr;
  assign gpr_MPORT_mask = 1'h1;
  assign gpr_MPORT_en = _T_7 & ctrlSigsWb_rfwen;
  assign io_debug_debugPc = pcWb; // @[Core.scala 256:23]
  assign io_debug_debugInst = instWb; // @[Core.scala 257:23]
  assign io_debug_debugwen = ctrlSigsWb_rfwen; // @[Core.scala 258:23]
  assign io_debug_debugwaddr = wbAddr; // @[Core.scala 259:23]
  assign io_debug_debugdata = wbData; // @[Core.scala 260:23]
  assign io_imem_addr = pcreg; // @[Core.scala 47:30 Core.scala 59:12]
  assign io_imem_cen = cenreg; // @[Core.scala 62:15]
  assign io_imem_wen = 1'h0; // @[Core.scala 33:15]
  assign io_imem_wdata = 64'h0; // @[Core.scala 34:17]
  assign io_dmem_addr = alu_resultMem; // @[Core.scala 215:16]
  assign io_dmem_cen = ctrlSigsMem_memcen; // @[Core.scala 212:15]
  assign io_dmem_wen = ctrlSigsMem_memwen != 4'h0; // @[Core.scala 213:37]
  assign io_dmem_wdata = storeDataMem; // @[Core.scala 214:17]
  assign GprAddrGen_io_in = If2IdInst; // @[Core.scala 94:16]
  assign Alu_io_excTy = exCtrlSigs_excTy; // @[Core.scala 166:13]
  assign Alu_io_opVec_0 = exOpVec_0; // @[Core.scala 167:13]
  assign Alu_io_opVec_1 = exOpVec_1; // @[Core.scala 167:13]
  assign dpi_inst = io_debug_debugInst; // @[Core.scala 253:12]
  always @(posedge clock) begin
    if(gpr_MPORT_en & gpr_MPORT_mask) begin
      gpr[gpr_MPORT_addr] <= gpr_MPORT_data; // @[rf.scala 13:26]
    end
    if (reset) begin // @[Core.scala 45:33]
      pcreg <= 64'h80000000; // @[Core.scala 45:33]
    end else if (cenreg) begin // @[Core.scala 53:26]
      if (~load_stall) begin // @[Core.scala 54:41]
        if (branchBus_flag) begin // @[Core.scala 51:17]
          pcreg <= branchBus_target;
        end else begin
          pcreg <= seq_pc;
        end
      end
    end
    if (reset) begin // @[Core.scala 46:33]
      cenreg <= 1'h0; // @[Core.scala 46:33]
    end else begin
      cenreg <= 1'h1; // @[Core.scala 58:10]
    end
    if (reset) begin // @[Core.scala 72:35]
      If2IdInst <= 32'h13; // @[Core.scala 72:35]
    end else if (branchBus_flag) begin // @[Core.scala 74:35]
      If2IdInst <= 32'h13; // @[Core.scala 76:17]
    end else if (!(load_stall)) begin // @[Core.scala 77:25]
      If2IdInst <= io_imem_rdata; // @[Core.scala 82:17]
    end
    if (reset) begin // @[Core.scala 71:35]
      If2IdPc <= 64'h0; // @[Core.scala 71:35]
    end else if (branchBus_flag) begin // @[Core.scala 74:35]
      If2IdPc <= 64'h0; // @[Core.scala 75:17]
    end else if (!(load_stall)) begin // @[Core.scala 77:25]
      If2IdPc <= pcreg; // @[Core.scala 81:17]
    end
    exCtrlSigs_rfwen <= reset | _GEN_10; // @[Core.scala 141:28 Core.scala 141:28]
    if (reset) begin // @[Core.scala 145:28]
      exRd <= 5'h0; // @[Core.scala 145:28]
    end else if (load_stall) begin // @[Core.scala 148:30]
      exRd <= 5'h0; // @[Core.scala 153:17]
    end else begin
      exRd <= GprAddrGen_io_o_rd; // @[Core.scala 160:17]
    end
    ctrlSigsMem_rfwen <= reset | exCtrlSigs_rfwen; // @[Core.scala 180:32 Core.scala 180:32]
    if (reset) begin // @[Core.scala 182:32]
      rdMem <= 5'h0; // @[Core.scala 182:32]
    end else begin
      rdMem <= exRd;
    end
    if (reset) begin // @[Core.scala 180:32]
      ctrlSigsMem_wbdSel <= 3'h1; // @[Core.scala 180:32]
    end else begin
      ctrlSigsMem_wbdSel <= exCtrlSigs_wbdSel;
    end
    if (reset) begin // @[Core.scala 181:32]
      alu_resultMem <= 64'h0; // @[Core.scala 181:32]
    end else begin
      alu_resultMem <= exBypassing_wr;
    end
    ctrlSigsWb_rfwen <= reset | ctrlSigsMem_rfwen; // @[Core.scala 227:28 Core.scala 227:28]
    if (reset) begin // @[Core.scala 231:28]
      wbAddr <= 5'h0; // @[Core.scala 231:28]
    end else begin
      wbAddr <= rdMem;
    end
    if (reset) begin // @[Core.scala 230:28]
      wbData <= 64'h0; // @[Core.scala 230:28]
    end else if (3'h2 == ctrlSigsMem_wbdSel) begin // @[Mux.scala 80:57]
      wbData <= io_dmem_rdata;
    end else begin
      wbData <= alu_resultMem;
    end
    if (reset) begin // @[Core.scala 141:28]
      exCtrlSigs_memcen <= 1'h0; // @[Core.scala 141:28]
    end else if (load_stall) begin // @[Core.scala 148:30]
      exCtrlSigs_memcen <= 1'h0; // @[Core.scala 149:17]
    end else if (_ctriSigs_deco_T_261) begin // @[Mux.scala 98:16]
      exCtrlSigs_memcen <= 1'h0;
    end else if (_ctriSigs_deco_T_263) begin // @[Mux.scala 98:16]
      exCtrlSigs_memcen <= 1'h0;
    end else begin
      exCtrlSigs_memcen <= _ctriSigs_deco_T_128;
    end
    if (reset) begin // @[Core.scala 141:28]
      exCtrlSigs_memwen <= 4'h0; // @[Core.scala 141:28]
    end else if (load_stall) begin // @[Core.scala 148:30]
      exCtrlSigs_memwen <= 4'h0; // @[Core.scala 149:17]
    end else if (_ctriSigs_deco_T_261) begin // @[Mux.scala 98:16]
      exCtrlSigs_memwen <= 4'h0;
    end else if (_ctriSigs_deco_T_263) begin // @[Mux.scala 98:16]
      exCtrlSigs_memwen <= 4'h0;
    end else begin
      exCtrlSigs_memwen <= _ctriSigs_deco_T_154;
    end
    if (reset) begin // @[Core.scala 141:28]
      exCtrlSigs_excTy <= 7'h1; // @[Core.scala 141:28]
    end else if (load_stall) begin // @[Core.scala 148:30]
      exCtrlSigs_excTy <= 7'h1; // @[Core.scala 149:17]
    end else begin
      exCtrlSigs_excTy <= ctriSigs_excTy; // @[Core.scala 156:17]
    end
    if (reset) begin // @[Core.scala 141:28]
      exCtrlSigs_wbdSel <= 3'h1; // @[Core.scala 141:28]
    end else if (load_stall) begin // @[Core.scala 148:30]
      exCtrlSigs_wbdSel <= 3'h1; // @[Core.scala 149:17]
    end else begin
      exCtrlSigs_wbdSel <= ctriSigs_wbdSel; // @[Core.scala 156:17]
    end
    if (reset) begin // @[Core.scala 142:28]
      exOpVec_0 <= 64'h0; // @[Core.scala 142:28]
    end else if (load_stall) begin // @[Core.scala 148:30]
      exOpVec_0 <= 64'h0; // @[Core.scala 150:17]
    end else if (2'h3 == ctriSigs_deco_2) begin // @[Mux.scala 80:57]
      exOpVec_0 <= 64'h0;
    end else if (2'h2 == ctriSigs_deco_2) begin // @[Mux.scala 80:57]
      exOpVec_0 <= If2IdPc;
    end else begin
      exOpVec_0 <= _opVec_0_T;
    end
    if (reset) begin // @[Core.scala 142:28]
      exOpVec_1 <= 64'h0; // @[Core.scala 142:28]
    end else if (load_stall) begin // @[Core.scala 148:30]
      exOpVec_1 <= 64'h0; // @[Core.scala 150:17]
    end else if (3'h3 == ctriSigs_deco_3) begin // @[Mux.scala 80:57]
      exOpVec_1 <= 64'h0;
    end else if (3'h4 == ctriSigs_deco_3) begin // @[Mux.scala 80:57]
      exOpVec_1 <= 64'h4;
    end else begin
      exOpVec_1 <= _opVec_1_T_5;
    end
    if (reset) begin // @[Core.scala 143:28]
      exPc <= 64'h0; // @[Core.scala 143:28]
    end else if (load_stall) begin // @[Core.scala 148:30]
      exPc <= 64'h0; // @[Core.scala 151:17]
    end else begin
      exPc <= If2IdPc; // @[Core.scala 158:17]
    end
    if (reset) begin // @[Core.scala 144:28]
      exInst <= 32'h13; // @[Core.scala 144:28]
    end else if (load_stall) begin // @[Core.scala 148:30]
      exInst <= 32'h13; // @[Core.scala 152:17]
    end else begin
      exInst <= If2IdInst; // @[Core.scala 159:17]
    end
    if (reset) begin // @[Core.scala 146:28]
      exStoreData <= 64'h0; // @[Core.scala 146:28]
    end else if (load_stall) begin // @[Core.scala 148:30]
      exStoreData <= 64'h0; // @[Core.scala 154:17]
    end else begin
      exStoreData <= _opVec_1_T; // @[Core.scala 161:17]
    end
    if (reset) begin // @[Core.scala 180:32]
      ctrlSigsMem_memcen <= 1'h0; // @[Core.scala 180:32]
    end else begin
      ctrlSigsMem_memcen <= exCtrlSigs_memcen;
    end
    if (reset) begin // @[Core.scala 180:32]
      ctrlSigsMem_memwen <= 4'h0; // @[Core.scala 180:32]
    end else begin
      ctrlSigsMem_memwen <= exCtrlSigs_memwen;
    end
    if (reset) begin // @[Core.scala 183:32]
      pcMem <= 64'h0; // @[Core.scala 183:32]
    end else begin
      pcMem <= exPc;
    end
    if (reset) begin // @[Core.scala 184:32]
      instMem <= 32'h13; // @[Core.scala 184:32]
    end else begin
      instMem <= exInst;
    end
    if (reset) begin // @[Core.scala 185:32]
      storeDataMem <= 64'h0; // @[Core.scala 185:32]
    end else begin
      storeDataMem <= exStoreData;
    end
    if (reset) begin // @[Core.scala 228:28]
      pcWb <= 64'h0; // @[Core.scala 228:28]
    end else begin
      pcWb <= pcMem;
    end
    if (reset) begin // @[Core.scala 229:28]
      instWb <= 32'h13; // @[Core.scala 229:28]
    end else begin
      instWb <= instMem;
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
    gpr[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  pcreg = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  cenreg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  If2IdInst = _RAND_3[31:0];
  _RAND_4 = {2{`RANDOM}};
  If2IdPc = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  exCtrlSigs_rfwen = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  exRd = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  ctrlSigsMem_rfwen = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  rdMem = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  ctrlSigsMem_wbdSel = _RAND_9[2:0];
  _RAND_10 = {2{`RANDOM}};
  alu_resultMem = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  ctrlSigsWb_rfwen = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  wbAddr = _RAND_12[4:0];
  _RAND_13 = {2{`RANDOM}};
  wbData = _RAND_13[63:0];
  _RAND_14 = {1{`RANDOM}};
  exCtrlSigs_memcen = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  exCtrlSigs_memwen = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  exCtrlSigs_excTy = _RAND_16[6:0];
  _RAND_17 = {1{`RANDOM}};
  exCtrlSigs_wbdSel = _RAND_17[2:0];
  _RAND_18 = {2{`RANDOM}};
  exOpVec_0 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  exOpVec_1 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  exPc = _RAND_20[63:0];
  _RAND_21 = {1{`RANDOM}};
  exInst = _RAND_21[31:0];
  _RAND_22 = {2{`RANDOM}};
  exStoreData = _RAND_22[63:0];
  _RAND_23 = {1{`RANDOM}};
  ctrlSigsMem_memcen = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  ctrlSigsMem_memwen = _RAND_24[3:0];
  _RAND_25 = {2{`RANDOM}};
  pcMem = _RAND_25[63:0];
  _RAND_26 = {1{`RANDOM}};
  instMem = _RAND_26[31:0];
  _RAND_27 = {2{`RANDOM}};
  storeDataMem = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  pcWb = _RAND_28[63:0];
  _RAND_29 = {1{`RANDOM}};
  instWb = _RAND_29[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
