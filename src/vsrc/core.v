module GprAddrGen(
  input  [31:0] io_in,
  output [4:0]  io_o_rs1,
  output [4:0]  io_o_rs2,
  output [4:0]  io_o_rd
);
  assign io_o_rs1 = io_in[19:15]; // @[Decoder.scala 181:20]
  assign io_o_rs2 = io_in[24:20]; // @[Decoder.scala 182:20]
  assign io_o_rd = io_in[11:7]; // @[Decoder.scala 183:20]
endmodule
module Alu(
  input  [6:0]  io_excTy,
  input  [63:0] io_opVec_0,
  input  [63:0] io_opVec_1,
  output [63:0] io_result
);
  wire  _op2_T = io_excTy == 7'h2; // @[Alu.scala 7:39]
  wire [63:0] _op2_T_1 = ~io_opVec_1; // @[Alu.scala 45:41]
  wire [63:0] _op2_T_3 = _op2_T_1 + 64'h1; // @[Alu.scala 45:63]
  wire [63:0] op2 = _op2_T ? _op2_T_3 : io_opVec_1; // @[Alu.scala 45:23]
  wire [63:0] _add_sub_result_T_1 = io_opVec_0 + op2; // @[Alu.scala 51:23]
  wire [31:0] add_sub_result_ret_hi = _add_sub_result_T_1[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] add_sub_result_ret_lo = _add_sub_result_T_1[31:0]; // @[Alu.scala 21:68]
  wire [63:0] add_sub_result_ret = {add_sub_result_ret_hi,add_sub_result_ret_lo}; // @[Cat.scala 30:58]
  wire [63:0] _add_sub_result_T_7 = 7'h1 == io_excTy ? _add_sub_result_T_1 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _add_sub_result_T_9 = 7'h2 == io_excTy ? _add_sub_result_T_1 : _add_sub_result_T_7; // @[Mux.scala 80:57]
  wire [63:0] add_sub_result = 7'h4 == io_excTy ? add_sub_result_ret : _add_sub_result_T_9; // @[Mux.scala 80:57]
  wire [63:0] _logicShiftResult_T_1 = _op2_T ? _op2_T_3 : io_opVec_1; // @[Alu.scala 57:45]
  wire  _logicShiftResult_T_2 = $signed(io_opVec_0) < $signed(_logicShiftResult_T_1); // @[Alu.scala 57:33]
  wire  _logicShiftResult_T_3 = io_opVec_0 < op2; // @[Alu.scala 58:33]
  wire [126:0] _GEN_0 = {{63'd0}, io_opVec_0}; // @[Alu.scala 59:33]
  wire [126:0] _logicShiftResult_T_5 = _GEN_0 << op2[5:0]; // @[Alu.scala 59:33]
  wire [63:0] _logicShiftResult_T_8 = io_opVec_0 >> op2[5:0]; // @[Alu.scala 60:33]
  wire [63:0] _logicShiftResult_T_12 = $signed(io_opVec_0) >>> op2[5:0]; // @[Alu.scala 61:46]
  wire [63:0] _logicShiftResult_T_13 = io_opVec_0 | op2; // @[Alu.scala 62:33]
  wire [63:0] _logicShiftResult_T_14 = io_opVec_0 ^ op2; // @[Alu.scala 63:33]
  wire [63:0] _logicShiftResult_T_15 = io_opVec_0 & op2; // @[Alu.scala 64:33]
  wire [63:0] _logicShiftResult_T_17 = 7'h3 == io_excTy ? {{63'd0}, _logicShiftResult_T_2} : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _logicShiftResult_T_19 = 7'h6 == io_excTy ? {{63'd0}, _logicShiftResult_T_3} : _logicShiftResult_T_17; // @[Mux.scala 80:57]
  wire [63:0] _logicShiftResult_T_21 = 7'ha == io_excTy ? _logicShiftResult_T_5[63:0] : _logicShiftResult_T_19; // @[Mux.scala 80:57]
  wire [63:0] _logicShiftResult_T_23 = 7'hb == io_excTy ? _logicShiftResult_T_8 : _logicShiftResult_T_21; // @[Mux.scala 80:57]
  wire [63:0] _logicShiftResult_T_25 = 7'hc == io_excTy ? _logicShiftResult_T_12 : _logicShiftResult_T_23; // @[Mux.scala 80:57]
  wire [63:0] _logicShiftResult_T_27 = 7'h7 == io_excTy ? _logicShiftResult_T_13 : _logicShiftResult_T_25; // @[Mux.scala 80:57]
  wire [63:0] _logicShiftResult_T_29 = 7'h8 == io_excTy ? _logicShiftResult_T_14 : _logicShiftResult_T_27; // @[Mux.scala 80:57]
  wire [63:0] logicShiftResult = 7'h9 == io_excTy ? _logicShiftResult_T_15 : _logicShiftResult_T_29; // @[Mux.scala 80:57]
  wire  _io_result_T_2 = io_excTy == 7'h3 | io_excTy == 7'h6; // @[Alu.scala 8:59]
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
  output [3:0]  io_dmem_wen,
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
  wire [63:0] gpr_ret_MPORT_data; // @[rf.scala 13:26]
  wire [4:0] gpr_ret_MPORT_addr; // @[rf.scala 13:26]
  wire [63:0] gpr_MPORT_data; // @[rf.scala 13:26]
  wire [4:0] gpr_MPORT_addr; // @[rf.scala 13:26]
  wire  gpr_MPORT_mask; // @[rf.scala 13:26]
  wire  gpr_MPORT_en; // @[rf.scala 13:26]
  wire [31:0] GprAddrGen_io_in; // @[Core.scala 106:26]
  wire [4:0] GprAddrGen_io_o_rs1; // @[Core.scala 106:26]
  wire [4:0] GprAddrGen_io_o_rs2; // @[Core.scala 106:26]
  wire [4:0] GprAddrGen_io_o_rd; // @[Core.scala 106:26]
  wire [6:0] Alu_io_excTy; // @[Core.scala 186:19]
  wire [63:0] Alu_io_opVec_0; // @[Core.scala 186:19]
  wire [63:0] Alu_io_opVec_1; // @[Core.scala 186:19]
  wire [63:0] Alu_io_result; // @[Core.scala 186:19]
  wire [31:0] dpi_inst; // @[Core.scala 280:19]
  wire [63:0] dpi_pc; // @[Core.scala 280:19]
  wire [63:0] dpi_gpr_a0; // @[Core.scala 280:19]
  reg [63:0] pcreg; // @[Core.scala 55:33]
  reg  cenreg; // @[Core.scala 56:33]
  wire [63:0] seq_pc = pcreg + 64'h4; // @[Core.scala 59:32]
  reg [31:0] If2IdInst; // @[Core.scala 86:35]
  wire [31:0] _ctriSigs_deco_T_1460 = If2IdInst & 32'h7f; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1461 = 32'h17 == _ctriSigs_deco_T_1460; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1463 = 32'h37 == _ctriSigs_deco_T_1460; // @[Decoder.scala 149:53]
  wire [31:0] _ctriSigs_deco_T_1464 = If2IdInst & 32'h707f; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1465 = 32'h13 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1467 = 32'h1b == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1469 = 32'h2013 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1471 = 32'h3013 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1473 = 32'h6013 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1475 = 32'h4013 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1477 = 32'h7013 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire [31:0] _ctriSigs_deco_T_1478 = If2IdInst & 32'hfc00707f; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1479 = 32'h1013 == _ctriSigs_deco_T_1478; // @[Decoder.scala 149:53]
  wire [31:0] _ctriSigs_deco_T_1480 = If2IdInst & 32'hfe00707f; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1481 = 32'h101b == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1483 = 32'h5013 == _ctriSigs_deco_T_1478; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1485 = 32'h501b == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1487 = 32'h40005013 == _ctriSigs_deco_T_1478; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1489 = 32'h4000501b == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1491 = 32'h33 == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1493 = 32'h3b == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1495 = 32'h40000033 == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1497 = 32'h4000003b == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1499 = 32'h2033 == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1501 = 32'h3033 == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1503 = 32'h1033 == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1505 = 32'h103b == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1507 = 32'h5033 == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1509 = 32'h503b == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1511 = 32'h40005033 == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1513 = 32'h4000503b == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1515 = 32'h6033 == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1517 = 32'h7033 == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1519 = 32'h4033 == _ctriSigs_deco_T_1480; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1521 = 32'h6f == _ctriSigs_deco_T_1460; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1523 = 32'h67 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1525 = 32'h63 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1527 = 32'h1063 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1529 = 32'h4063 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1531 = 32'h5063 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1533 = 32'h6063 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1535 = 32'h7063 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1537 = 32'h3 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1539 = 32'h4003 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1541 = 32'h1003 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1543 = 32'h5003 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1545 = 32'h2003 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1547 = 32'h6003 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1549 = 32'h3003 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1551 = 32'h23 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1553 = 32'h1023 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1555 = 32'h2023 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire  _ctriSigs_deco_T_1557 = 32'h3023 == _ctriSigs_deco_T_1464; // @[Decoder.scala 149:53]
  wire [2:0] _ctriSigs_deco_T_1569 = _ctriSigs_deco_T_1535 ? 3'h6 : 3'h0; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1570 = _ctriSigs_deco_T_1533 ? 3'h4 : _ctriSigs_deco_T_1569; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1571 = _ctriSigs_deco_T_1531 ? 3'h5 : _ctriSigs_deco_T_1570; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1572 = _ctriSigs_deco_T_1529 ? 3'h3 : _ctriSigs_deco_T_1571; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1573 = _ctriSigs_deco_T_1527 ? 3'h2 : _ctriSigs_deco_T_1572; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1574 = _ctriSigs_deco_T_1525 ? 3'h1 : _ctriSigs_deco_T_1573; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1575 = _ctriSigs_deco_T_1523 ? 3'h0 : _ctriSigs_deco_T_1574; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1576 = _ctriSigs_deco_T_1521 ? 3'h0 : _ctriSigs_deco_T_1575; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1577 = _ctriSigs_deco_T_1519 ? 3'h0 : _ctriSigs_deco_T_1576; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1578 = _ctriSigs_deco_T_1517 ? 3'h0 : _ctriSigs_deco_T_1577; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1579 = _ctriSigs_deco_T_1515 ? 3'h0 : _ctriSigs_deco_T_1578; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1580 = _ctriSigs_deco_T_1513 ? 3'h0 : _ctriSigs_deco_T_1579; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1581 = _ctriSigs_deco_T_1511 ? 3'h0 : _ctriSigs_deco_T_1580; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1582 = _ctriSigs_deco_T_1509 ? 3'h0 : _ctriSigs_deco_T_1581; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1583 = _ctriSigs_deco_T_1507 ? 3'h0 : _ctriSigs_deco_T_1582; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1584 = _ctriSigs_deco_T_1505 ? 3'h0 : _ctriSigs_deco_T_1583; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1585 = _ctriSigs_deco_T_1503 ? 3'h0 : _ctriSigs_deco_T_1584; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1586 = _ctriSigs_deco_T_1501 ? 3'h0 : _ctriSigs_deco_T_1585; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1587 = _ctriSigs_deco_T_1499 ? 3'h0 : _ctriSigs_deco_T_1586; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1588 = _ctriSigs_deco_T_1497 ? 3'h0 : _ctriSigs_deco_T_1587; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1589 = _ctriSigs_deco_T_1495 ? 3'h0 : _ctriSigs_deco_T_1588; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1590 = _ctriSigs_deco_T_1493 ? 3'h0 : _ctriSigs_deco_T_1589; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1591 = _ctriSigs_deco_T_1491 ? 3'h0 : _ctriSigs_deco_T_1590; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1592 = _ctriSigs_deco_T_1489 ? 3'h0 : _ctriSigs_deco_T_1591; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1593 = _ctriSigs_deco_T_1487 ? 3'h0 : _ctriSigs_deco_T_1592; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1594 = _ctriSigs_deco_T_1485 ? 3'h0 : _ctriSigs_deco_T_1593; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1595 = _ctriSigs_deco_T_1483 ? 3'h0 : _ctriSigs_deco_T_1594; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1596 = _ctriSigs_deco_T_1481 ? 3'h0 : _ctriSigs_deco_T_1595; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1597 = _ctriSigs_deco_T_1479 ? 3'h0 : _ctriSigs_deco_T_1596; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1598 = _ctriSigs_deco_T_1477 ? 3'h0 : _ctriSigs_deco_T_1597; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1599 = _ctriSigs_deco_T_1475 ? 3'h0 : _ctriSigs_deco_T_1598; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1600 = _ctriSigs_deco_T_1473 ? 3'h0 : _ctriSigs_deco_T_1599; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1601 = _ctriSigs_deco_T_1471 ? 3'h0 : _ctriSigs_deco_T_1600; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1602 = _ctriSigs_deco_T_1469 ? 3'h0 : _ctriSigs_deco_T_1601; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1603 = _ctriSigs_deco_T_1467 ? 3'h0 : _ctriSigs_deco_T_1602; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1604 = _ctriSigs_deco_T_1465 ? 3'h0 : _ctriSigs_deco_T_1603; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1605 = _ctriSigs_deco_T_1463 ? 3'h0 : _ctriSigs_deco_T_1604; // @[Mux.scala 98:16]
  wire [2:0] ctriSigs_deco_10 = _ctriSigs_deco_T_1461 ? 3'h0 : _ctriSigs_deco_T_1605; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_400 = _ctriSigs_deco_T_1537 | (_ctriSigs_deco_T_1539 | (_ctriSigs_deco_T_1541 | (
    _ctriSigs_deco_T_1543 | (_ctriSigs_deco_T_1545 | (_ctriSigs_deco_T_1547 | (_ctriSigs_deco_T_1549 | (
    _ctriSigs_deco_T_1551 | (_ctriSigs_deco_T_1553 | (_ctriSigs_deco_T_1555 | _ctriSigs_deco_T_1557))))))))); // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_401 = _ctriSigs_deco_T_1535 ? 2'h3 : {{1'd0}, _ctriSigs_deco_T_400}; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_402 = _ctriSigs_deco_T_1533 ? 2'h3 : _ctriSigs_deco_T_401; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_403 = _ctriSigs_deco_T_1531 ? 2'h3 : _ctriSigs_deco_T_402; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_404 = _ctriSigs_deco_T_1529 ? 2'h3 : _ctriSigs_deco_T_403; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_405 = _ctriSigs_deco_T_1527 ? 2'h3 : _ctriSigs_deco_T_404; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_406 = _ctriSigs_deco_T_1525 ? 2'h3 : _ctriSigs_deco_T_405; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_407 = _ctriSigs_deco_T_1523 ? 2'h2 : _ctriSigs_deco_T_406; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_408 = _ctriSigs_deco_T_1521 ? 2'h2 : _ctriSigs_deco_T_407; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_409 = _ctriSigs_deco_T_1519 ? 2'h1 : _ctriSigs_deco_T_408; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_410 = _ctriSigs_deco_T_1517 ? 2'h1 : _ctriSigs_deco_T_409; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_411 = _ctriSigs_deco_T_1515 ? 2'h1 : _ctriSigs_deco_T_410; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_412 = _ctriSigs_deco_T_1513 ? 2'h1 : _ctriSigs_deco_T_411; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_413 = _ctriSigs_deco_T_1511 ? 2'h1 : _ctriSigs_deco_T_412; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_414 = _ctriSigs_deco_T_1509 ? 2'h1 : _ctriSigs_deco_T_413; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_415 = _ctriSigs_deco_T_1507 ? 2'h1 : _ctriSigs_deco_T_414; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_416 = _ctriSigs_deco_T_1505 ? 2'h1 : _ctriSigs_deco_T_415; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_417 = _ctriSigs_deco_T_1503 ? 2'h1 : _ctriSigs_deco_T_416; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_418 = _ctriSigs_deco_T_1501 ? 2'h1 : _ctriSigs_deco_T_417; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_419 = _ctriSigs_deco_T_1499 ? 2'h1 : _ctriSigs_deco_T_418; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_420 = _ctriSigs_deco_T_1497 ? 2'h1 : _ctriSigs_deco_T_419; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_421 = _ctriSigs_deco_T_1495 ? 2'h1 : _ctriSigs_deco_T_420; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_422 = _ctriSigs_deco_T_1493 ? 2'h1 : _ctriSigs_deco_T_421; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_423 = _ctriSigs_deco_T_1491 ? 2'h1 : _ctriSigs_deco_T_422; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_424 = _ctriSigs_deco_T_1489 ? 2'h1 : _ctriSigs_deco_T_423; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_425 = _ctriSigs_deco_T_1487 ? 2'h1 : _ctriSigs_deco_T_424; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_426 = _ctriSigs_deco_T_1485 ? 2'h1 : _ctriSigs_deco_T_425; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_427 = _ctriSigs_deco_T_1483 ? 2'h1 : _ctriSigs_deco_T_426; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_428 = _ctriSigs_deco_T_1481 ? 2'h1 : _ctriSigs_deco_T_427; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_429 = _ctriSigs_deco_T_1479 ? 2'h1 : _ctriSigs_deco_T_428; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_430 = _ctriSigs_deco_T_1477 ? 2'h1 : _ctriSigs_deco_T_429; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_431 = _ctriSigs_deco_T_1475 ? 2'h1 : _ctriSigs_deco_T_430; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_432 = _ctriSigs_deco_T_1473 ? 2'h1 : _ctriSigs_deco_T_431; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_433 = _ctriSigs_deco_T_1471 ? 2'h1 : _ctriSigs_deco_T_432; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_434 = _ctriSigs_deco_T_1469 ? 2'h1 : _ctriSigs_deco_T_433; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_435 = _ctriSigs_deco_T_1467 ? 2'h1 : _ctriSigs_deco_T_434; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_436 = _ctriSigs_deco_T_1465 ? 2'h1 : _ctriSigs_deco_T_435; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_437 = _ctriSigs_deco_T_1463 ? 2'h3 : _ctriSigs_deco_T_436; // @[Mux.scala 98:16]
  wire [1:0] ctriSigs_deco_2 = _ctriSigs_deco_T_1461 ? 2'h2 : _ctriSigs_deco_T_437; // @[Mux.scala 98:16]
  reg [63:0] If2IdPc; // @[Core.scala 85:35]
  reg  exCtrlSigs_rfwen; // @[Core.scala 157:28]
  reg [4:0] exRd; // @[Core.scala 161:28]
  wire  _rsVec_0_T_1 = exCtrlSigs_rfwen & exRd == GprAddrGen_io_o_rs1; // @[Core.scala 119:22]
  wire [63:0] exBypassing_wr = Alu_io_result; // @[Core.scala 24:25 Core.scala 199:18]
  reg  ctrlSigsMem_rfwen; // @[Core.scala 203:32]
  reg [4:0] rdMem; // @[Core.scala 205:32]
  wire  _rsVec_0_T_3 = ctrlSigsMem_rfwen & rdMem == GprAddrGen_io_o_rs1; // @[Core.scala 120:23]
  reg [3:0] ctrlSigsMem_wbdSel; // @[Core.scala 203:32]
  wire [31:0] MemWbData_ret_lo_5 = io_dmem_rdata[31:0]; // @[Alu.scala 34:50]
  wire [63:0] MemWbData_ret_5 = {32'h0,MemWbData_ret_lo_5}; // @[Cat.scala 30:58]
  wire [31:0] MemWbData_ret_hi_2 = io_dmem_rdata[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] MemWbData_ret_4 = {MemWbData_ret_hi_2,MemWbData_ret_lo_5}; // @[Cat.scala 30:58]
  wire [15:0] MemWbData_ret_lo_3 = io_dmem_rdata[15:0]; // @[Alu.scala 34:50]
  wire [63:0] MemWbData_ret_3 = {48'h0,MemWbData_ret_lo_3}; // @[Cat.scala 30:58]
  wire [47:0] MemWbData_ret_hi_1 = io_dmem_rdata[15] ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [63:0] MemWbData_ret_2 = {MemWbData_ret_hi_1,MemWbData_ret_lo_3}; // @[Cat.scala 30:58]
  wire [7:0] MemWbData_ret_lo_1 = io_dmem_rdata[7:0]; // @[Alu.scala 34:50]
  wire [63:0] MemWbData_ret_1 = {56'h0,MemWbData_ret_lo_1}; // @[Cat.scala 30:58]
  wire [55:0] MemWbData_ret_hi = io_dmem_rdata[7] ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [63:0] MemWbData_ret = {MemWbData_ret_hi,MemWbData_ret_lo_1}; // @[Cat.scala 30:58]
  reg [63:0] alu_resultMem; // @[Core.scala 204:32]
  wire [63:0] _MemWbData_T_3 = 4'h8 == ctrlSigsMem_wbdSel ? io_dmem_rdata : alu_resultMem; // @[Mux.scala 80:57]
  wire [63:0] _MemWbData_T_5 = 4'h2 == ctrlSigsMem_wbdSel ? MemWbData_ret : _MemWbData_T_3; // @[Mux.scala 80:57]
  wire [63:0] _MemWbData_T_7 = 4'h3 == ctrlSigsMem_wbdSel ? MemWbData_ret_1 : _MemWbData_T_5; // @[Mux.scala 80:57]
  wire [63:0] _MemWbData_T_9 = 4'h4 == ctrlSigsMem_wbdSel ? MemWbData_ret_2 : _MemWbData_T_7; // @[Mux.scala 80:57]
  wire [63:0] _MemWbData_T_11 = 4'h5 == ctrlSigsMem_wbdSel ? MemWbData_ret_3 : _MemWbData_T_9; // @[Mux.scala 80:57]
  wire [63:0] _MemWbData_T_13 = 4'h6 == ctrlSigsMem_wbdSel ? MemWbData_ret_4 : _MemWbData_T_11; // @[Mux.scala 80:57]
  wire [63:0] MemWbData = 4'h7 == ctrlSigsMem_wbdSel ? MemWbData_ret_5 : _MemWbData_T_13; // @[Mux.scala 80:57]
  reg  ctrlSigsWb_rfwen; // @[Core.scala 255:28]
  reg [4:0] wbAddr; // @[Core.scala 259:28]
  wire  _rsVec_0_T_5 = ctrlSigsWb_rfwen & wbAddr == GprAddrGen_io_o_rs1; // @[Core.scala 121:22]
  reg [63:0] wbData; // @[Core.scala 258:28]
  wire [63:0] id_rs_0 = GprAddrGen_io_o_rs1 == 5'h0 ? 64'h0 : gpr_id_rs_ret_MPORT_data; // @[rf.scala 31:18]
  wire [63:0] _rsVec_0_T_6 = _rsVec_0_T_5 ? wbData : id_rs_0; // @[Mux.scala 98:16]
  wire [63:0] _rsVec_0_T_7 = _rsVec_0_T_3 ? MemWbData : _rsVec_0_T_6; // @[Mux.scala 98:16]
  wire [63:0] _opVec_0_T = _rsVec_0_T_1 ? exBypassing_wr : _rsVec_0_T_7; // @[Core.scala 134:44]
  wire [63:0] _opVec_0_T_4 = 2'h2 == ctriSigs_deco_2 ? If2IdPc : _opVec_0_T; // @[Mux.scala 80:57]
  wire [63:0] _branchBus_flag_T = 2'h3 == ctriSigs_deco_2 ? 64'h0 : _opVec_0_T_4; // @[Core.scala 144:68]
  wire [63:0] _branchBus_flag_T_9 = 2'h3 == ctriSigs_deco_2 ? 64'h0 : _opVec_0_T_4; // @[Bru.scala 18:29]
  wire [1:0] _ctriSigs_deco_T_536 = _ctriSigs_deco_T_1557 ? 2'h2 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_537 = _ctriSigs_deco_T_1555 ? 2'h2 : _ctriSigs_deco_T_536; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_538 = _ctriSigs_deco_T_1553 ? 2'h2 : _ctriSigs_deco_T_537; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_539 = _ctriSigs_deco_T_1551 ? 2'h2 : _ctriSigs_deco_T_538; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_540 = _ctriSigs_deco_T_1549 ? 2'h2 : _ctriSigs_deco_T_539; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_541 = _ctriSigs_deco_T_1547 ? 2'h2 : _ctriSigs_deco_T_540; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_542 = _ctriSigs_deco_T_1545 ? 2'h2 : _ctriSigs_deco_T_541; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_543 = _ctriSigs_deco_T_1543 ? 2'h2 : _ctriSigs_deco_T_542; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_544 = _ctriSigs_deco_T_1541 ? 2'h2 : _ctriSigs_deco_T_543; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_545 = _ctriSigs_deco_T_1539 ? 2'h2 : _ctriSigs_deco_T_544; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_546 = _ctriSigs_deco_T_1537 ? 2'h2 : _ctriSigs_deco_T_545; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_547 = _ctriSigs_deco_T_1535 ? 2'h3 : _ctriSigs_deco_T_546; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_548 = _ctriSigs_deco_T_1533 ? 2'h3 : _ctriSigs_deco_T_547; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_549 = _ctriSigs_deco_T_1531 ? 2'h3 : _ctriSigs_deco_T_548; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_550 = _ctriSigs_deco_T_1529 ? 2'h3 : _ctriSigs_deco_T_549; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_551 = _ctriSigs_deco_T_1527 ? 2'h3 : _ctriSigs_deco_T_550; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_552 = _ctriSigs_deco_T_1525 ? 2'h3 : _ctriSigs_deco_T_551; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_553 = _ctriSigs_deco_T_1523 ? 2'h2 : _ctriSigs_deco_T_552; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_554 = _ctriSigs_deco_T_1521 ? 3'h4 : {{1'd0}, _ctriSigs_deco_T_553}; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_555 = _ctriSigs_deco_T_1519 ? 3'h1 : _ctriSigs_deco_T_554; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_556 = _ctriSigs_deco_T_1517 ? 3'h1 : _ctriSigs_deco_T_555; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_557 = _ctriSigs_deco_T_1515 ? 3'h1 : _ctriSigs_deco_T_556; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_558 = _ctriSigs_deco_T_1513 ? 3'h1 : _ctriSigs_deco_T_557; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_559 = _ctriSigs_deco_T_1511 ? 3'h1 : _ctriSigs_deco_T_558; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_560 = _ctriSigs_deco_T_1509 ? 3'h1 : _ctriSigs_deco_T_559; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_561 = _ctriSigs_deco_T_1507 ? 3'h1 : _ctriSigs_deco_T_560; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_562 = _ctriSigs_deco_T_1505 ? 3'h1 : _ctriSigs_deco_T_561; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_563 = _ctriSigs_deco_T_1503 ? 3'h1 : _ctriSigs_deco_T_562; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_564 = _ctriSigs_deco_T_1501 ? 3'h1 : _ctriSigs_deco_T_563; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_565 = _ctriSigs_deco_T_1499 ? 3'h1 : _ctriSigs_deco_T_564; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_566 = _ctriSigs_deco_T_1497 ? 3'h1 : _ctriSigs_deco_T_565; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_567 = _ctriSigs_deco_T_1495 ? 3'h1 : _ctriSigs_deco_T_566; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_568 = _ctriSigs_deco_T_1493 ? 3'h1 : _ctriSigs_deco_T_567; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_569 = _ctriSigs_deco_T_1491 ? 3'h1 : _ctriSigs_deco_T_568; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_570 = _ctriSigs_deco_T_1489 ? 3'h2 : _ctriSigs_deco_T_569; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_571 = _ctriSigs_deco_T_1487 ? 3'h2 : _ctriSigs_deco_T_570; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_572 = _ctriSigs_deco_T_1485 ? 3'h2 : _ctriSigs_deco_T_571; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_573 = _ctriSigs_deco_T_1483 ? 3'h2 : _ctriSigs_deco_T_572; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_574 = _ctriSigs_deco_T_1481 ? 3'h2 : _ctriSigs_deco_T_573; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_575 = _ctriSigs_deco_T_1479 ? 3'h2 : _ctriSigs_deco_T_574; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_576 = _ctriSigs_deco_T_1477 ? 3'h2 : _ctriSigs_deco_T_575; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_577 = _ctriSigs_deco_T_1475 ? 3'h2 : _ctriSigs_deco_T_576; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_578 = _ctriSigs_deco_T_1473 ? 3'h2 : _ctriSigs_deco_T_577; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_579 = _ctriSigs_deco_T_1471 ? 3'h2 : _ctriSigs_deco_T_578; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_580 = _ctriSigs_deco_T_1469 ? 3'h2 : _ctriSigs_deco_T_579; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_581 = _ctriSigs_deco_T_1467 ? 3'h2 : _ctriSigs_deco_T_580; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_582 = _ctriSigs_deco_T_1465 ? 3'h2 : _ctriSigs_deco_T_581; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_583 = _ctriSigs_deco_T_1463 ? 3'h2 : _ctriSigs_deco_T_582; // @[Mux.scala 98:16]
  wire [2:0] ctriSigs_deco_3 = _ctriSigs_deco_T_1461 ? 3'h3 : _ctriSigs_deco_T_583; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_98 = _ctriSigs_deco_T_1557 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_99 = _ctriSigs_deco_T_1555 ? 2'h3 : _ctriSigs_deco_T_98; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_100 = _ctriSigs_deco_T_1553 ? 2'h3 : _ctriSigs_deco_T_99; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_101 = _ctriSigs_deco_T_1551 ? 2'h3 : _ctriSigs_deco_T_100; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_102 = _ctriSigs_deco_T_1549 ? 2'h1 : _ctriSigs_deco_T_101; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_103 = _ctriSigs_deco_T_1547 ? 2'h1 : _ctriSigs_deco_T_102; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_104 = _ctriSigs_deco_T_1545 ? 2'h1 : _ctriSigs_deco_T_103; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_105 = _ctriSigs_deco_T_1543 ? 2'h1 : _ctriSigs_deco_T_104; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_106 = _ctriSigs_deco_T_1541 ? 2'h1 : _ctriSigs_deco_T_105; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_107 = _ctriSigs_deco_T_1539 ? 2'h1 : _ctriSigs_deco_T_106; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_108 = _ctriSigs_deco_T_1537 ? 2'h1 : _ctriSigs_deco_T_107; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_109 = _ctriSigs_deco_T_1535 ? 2'h2 : _ctriSigs_deco_T_108; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_110 = _ctriSigs_deco_T_1533 ? 2'h2 : _ctriSigs_deco_T_109; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_111 = _ctriSigs_deco_T_1531 ? 2'h2 : _ctriSigs_deco_T_110; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_112 = _ctriSigs_deco_T_1529 ? 2'h2 : _ctriSigs_deco_T_111; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_113 = _ctriSigs_deco_T_1527 ? 2'h2 : _ctriSigs_deco_T_112; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_114 = _ctriSigs_deco_T_1525 ? 2'h2 : _ctriSigs_deco_T_113; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_115 = _ctriSigs_deco_T_1523 ? 2'h1 : _ctriSigs_deco_T_114; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_116 = _ctriSigs_deco_T_1521 ? 3'h4 : {{1'd0}, _ctriSigs_deco_T_115}; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_117 = _ctriSigs_deco_T_1519 ? 3'h7 : _ctriSigs_deco_T_116; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_118 = _ctriSigs_deco_T_1517 ? 3'h7 : _ctriSigs_deco_T_117; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_119 = _ctriSigs_deco_T_1515 ? 3'h7 : _ctriSigs_deco_T_118; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_120 = _ctriSigs_deco_T_1513 ? 3'h7 : _ctriSigs_deco_T_119; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_121 = _ctriSigs_deco_T_1511 ? 3'h7 : _ctriSigs_deco_T_120; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_122 = _ctriSigs_deco_T_1509 ? 3'h7 : _ctriSigs_deco_T_121; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_123 = _ctriSigs_deco_T_1507 ? 3'h7 : _ctriSigs_deco_T_122; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_124 = _ctriSigs_deco_T_1505 ? 3'h7 : _ctriSigs_deco_T_123; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_125 = _ctriSigs_deco_T_1503 ? 3'h7 : _ctriSigs_deco_T_124; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_126 = _ctriSigs_deco_T_1501 ? 3'h7 : _ctriSigs_deco_T_125; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_127 = _ctriSigs_deco_T_1499 ? 3'h7 : _ctriSigs_deco_T_126; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_128 = _ctriSigs_deco_T_1497 ? 3'h7 : _ctriSigs_deco_T_127; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_129 = _ctriSigs_deco_T_1495 ? 3'h7 : _ctriSigs_deco_T_128; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_130 = _ctriSigs_deco_T_1493 ? 3'h7 : _ctriSigs_deco_T_129; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_131 = _ctriSigs_deco_T_1491 ? 3'h7 : _ctriSigs_deco_T_130; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_132 = _ctriSigs_deco_T_1489 ? 3'h1 : _ctriSigs_deco_T_131; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_133 = _ctriSigs_deco_T_1487 ? 3'h1 : _ctriSigs_deco_T_132; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_134 = _ctriSigs_deco_T_1485 ? 3'h1 : _ctriSigs_deco_T_133; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_135 = _ctriSigs_deco_T_1483 ? 3'h1 : _ctriSigs_deco_T_134; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_136 = _ctriSigs_deco_T_1481 ? 3'h1 : _ctriSigs_deco_T_135; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_137 = _ctriSigs_deco_T_1479 ? 3'h1 : _ctriSigs_deco_T_136; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_138 = _ctriSigs_deco_T_1477 ? 3'h1 : _ctriSigs_deco_T_137; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_139 = _ctriSigs_deco_T_1475 ? 3'h1 : _ctriSigs_deco_T_138; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_140 = _ctriSigs_deco_T_1473 ? 3'h1 : _ctriSigs_deco_T_139; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_141 = _ctriSigs_deco_T_1471 ? 3'h1 : _ctriSigs_deco_T_140; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_142 = _ctriSigs_deco_T_1469 ? 3'h1 : _ctriSigs_deco_T_141; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_143 = _ctriSigs_deco_T_1467 ? 3'h1 : _ctriSigs_deco_T_142; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_144 = _ctriSigs_deco_T_1465 ? 3'h1 : _ctriSigs_deco_T_143; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_145 = _ctriSigs_deco_T_1463 ? 3'h5 : _ctriSigs_deco_T_144; // @[Mux.scala 98:16]
  wire [2:0] ctriSigs_deco_0 = _ctriSigs_deco_T_1461 ? 3'h5 : _ctriSigs_deco_T_145; // @[Mux.scala 98:16]
  wire [31:0] ctriSigs_instTy = {{29'd0}, ctriSigs_deco_0}; // @[Core.scala 104:22 Decoder.scala 95:39]
  wire  _imm_sigBit_T = ctriSigs_instTy == 32'h6; // @[Decoder.scala 155:38]
  wire  imm_sigBit = ctriSigs_instTy == 32'h6 ? 1'h0 : If2IdInst[31]; // @[Decoder.scala 155:29]
  wire [32:0] imm_hi_hi_hi = imm_sigBit ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 72:12]
  wire  _imm_b30_20_T = ctriSigs_instTy == 32'h5; // @[Decoder.scala 156:38]
  wire [10:0] _imm_b30_20_T_3 = imm_sigBit ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [10:0] imm_hi_hi_lo = ctriSigs_instTy == 32'h5 ? If2IdInst[30:20] : _imm_b30_20_T_3; // @[Decoder.scala 156:29]
  wire [7:0] _imm_b19_12_T_4 = imm_sigBit ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] imm_hi_lo_hi = ctriSigs_instTy != 32'h5 & ctriSigs_instTy != 32'h4 ? _imm_b19_12_T_4 : If2IdInst[19:12]; // @[Decoder.scala 157:29]
  wire  _imm_b11_T = ctriSigs_instTy == 32'h2; // @[Decoder.scala 158:38]
  wire  _imm_b11_T_6 = _imm_b30_20_T | _imm_sigBit_T; // @[Decoder.scala 160:46]
  wire  _imm_b11_T_7 = _imm_b30_20_T | _imm_sigBit_T ? 1'h0 : imm_sigBit; // @[Decoder.scala 160:31]
  wire  _imm_b11_T_8 = ctriSigs_instTy == 32'h4 ? If2IdInst[20] : _imm_b11_T_7; // @[Decoder.scala 159:31]
  wire  imm_hi_lo_lo = ctriSigs_instTy == 32'h2 ? If2IdInst[7] : _imm_b11_T_8; // @[Decoder.scala 158:29]
  wire [5:0] imm_lo_hi_hi = _imm_b11_T_6 ? 6'h0 : If2IdInst[30:25]; // @[Decoder.scala 161:29]
  wire  _imm_b4_1_T_1 = ctriSigs_instTy == 32'h3; // @[Decoder.scala 163:39]
  wire [3:0] _imm_b4_1_T_8 = _imm_sigBit_T ? If2IdInst[19:16] : If2IdInst[24:21]; // @[Decoder.scala 164:30]
  wire [3:0] _imm_b4_1_T_9 = ctriSigs_instTy == 32'h3 | _imm_b11_T ? If2IdInst[11:8] : _imm_b4_1_T_8; // @[Decoder.scala 163:30]
  wire [3:0] imm_lo_hi_lo = _imm_b30_20_T ? 4'h0 : _imm_b4_1_T_9; // @[Decoder.scala 162:29]
  wire  _imm_b0_T_6 = _imm_sigBit_T & If2IdInst[15]; // @[Decoder.scala 167:31]
  wire  _imm_b0_T_7 = ctriSigs_instTy == 32'h1 ? If2IdInst[20] : _imm_b0_T_6; // @[Decoder.scala 166:31]
  wire  imm_lo_lo = _imm_b4_1_T_1 ? If2IdInst[7] : _imm_b0_T_7; // @[Decoder.scala 165:29]
  wire [63:0] _opVec_1_T_1 = {imm_hi_hi_hi,imm_hi_hi_lo,imm_hi_lo_hi,imm_hi_lo_lo,imm_lo_hi_hi,imm_lo_hi_lo,imm_lo_lo}; // @[Core.scala 135:57]
  wire  _rsVec_1_T_1 = exCtrlSigs_rfwen & exRd == GprAddrGen_io_o_rs2; // @[Core.scala 124:22]
  wire  _rsVec_1_T_3 = ctrlSigsMem_rfwen & rdMem == GprAddrGen_io_o_rs2; // @[Core.scala 125:23]
  wire  _rsVec_1_T_5 = ctrlSigsWb_rfwen & wbAddr == GprAddrGen_io_o_rs2; // @[Core.scala 126:22]
  wire [63:0] id_rs_1 = GprAddrGen_io_o_rs2 == 5'h0 ? 64'h0 : gpr_id_rs_ret_MPORT_1_data; // @[rf.scala 31:18]
  wire [63:0] _rsVec_1_T_6 = _rsVec_1_T_5 ? wbData : id_rs_1; // @[Mux.scala 98:16]
  wire [63:0] _rsVec_1_T_7 = _rsVec_1_T_3 ? MemWbData : _rsVec_1_T_6; // @[Mux.scala 98:16]
  wire [63:0] _opVec_1_T = _rsVec_1_T_1 ? exBypassing_wr : _rsVec_1_T_7; // @[Core.scala 135:44]
  wire [63:0] _opVec_1_T_5 = 3'h2 == ctriSigs_deco_3 ? _opVec_1_T_1 : _opVec_1_T; // @[Mux.scala 80:57]
  wire [63:0] _opVec_1_T_7 = 3'h4 == ctriSigs_deco_3 ? 64'h4 : _opVec_1_T_5; // @[Mux.scala 80:57]
  wire [63:0] _branchBus_flag_T_1 = 3'h3 == ctriSigs_deco_3 ? 64'h0 : _opVec_1_T_7; // @[Core.scala 144:86]
  wire [63:0] _branchBus_flag_T_10 = 3'h3 == ctriSigs_deco_3 ? 64'h0 : _opVec_1_T_7; // @[Bru.scala 18:46]
  wire  _branchBus_flag_T_11 = _branchBus_flag_T_9 >= _branchBus_flag_T_10; // @[Bru.scala 18:33]
  wire  _branchBus_flag_T_8 = $signed(_branchBus_flag_T) >= $signed(_branchBus_flag_T_1); // @[Bru.scala 17:33]
  wire  _branchBus_flag_T_7 = _branchBus_flag_T_9 < _branchBus_flag_T_10; // @[Bru.scala 16:33]
  wire  _branchBus_flag_T_4 = $signed(_branchBus_flag_T) < $signed(_branchBus_flag_T_1); // @[Bru.scala 15:33]
  wire  _branchBus_flag_T_3 = $signed(_branchBus_flag_T) != $signed(_branchBus_flag_T_1); // @[Bru.scala 14:32]
  wire  _branchBus_flag_T_2 = $signed(_branchBus_flag_T) == $signed(_branchBus_flag_T_1); // @[Bru.scala 13:32]
  wire  _branchBus_flag_T_15 = 3'h2 == ctriSigs_deco_10 ? _branchBus_flag_T_3 : 3'h1 == ctriSigs_deco_10 &
    _branchBus_flag_T_2; // @[Mux.scala 80:57]
  wire  _branchBus_flag_T_17 = 3'h3 == ctriSigs_deco_10 ? _branchBus_flag_T_4 : _branchBus_flag_T_15; // @[Mux.scala 80:57]
  wire  _branchBus_flag_T_19 = 3'h4 == ctriSigs_deco_10 ? _branchBus_flag_T_7 : _branchBus_flag_T_17; // @[Mux.scala 80:57]
  wire  _branchBus_flag_T_21 = 3'h5 == ctriSigs_deco_10 ? _branchBus_flag_T_8 : _branchBus_flag_T_19; // @[Mux.scala 80:57]
  wire  _branchBus_flag_T_23 = 3'h6 == ctriSigs_deco_10 ? _branchBus_flag_T_11 : _branchBus_flag_T_21; // @[Mux.scala 80:57]
  wire  branchBus_flag = _branchBus_flag_T_23 | _ctriSigs_deco_T_1523 | _ctriSigs_deco_T_1521; // @[Core.scala 145:45]
  wire [63:0] jump_target = _opVec_0_T + _opVec_1_T_1; // @[Core.scala 143:37]
  wire [63:0] _branchBus_target_T_3 = jump_target & 64'hfffffffffffffffe; // @[Core.scala 147:41]
  wire [63:0] _branchBus_target_T_6 = If2IdPc + _opVec_1_T_1; // @[Core.scala 147:75]
  wire [63:0] branchBus_target = _ctriSigs_deco_T_1523 ? _branchBus_target_T_3 : _branchBus_target_T_6; // @[Core.scala 146:26]
  reg  exCtrlSigs_memcen; // @[Core.scala 157:28]
  reg [3:0] exCtrlSigs_memwen; // @[Core.scala 157:28]
  wire  load_stall = exCtrlSigs_memcen & exCtrlSigs_memwen == 4'h0; // @[Decoder.scala 218:24]
  wire  hd_1_ready = ~load_stall; // @[Core.scala 81:22]
  wire  hd_1_valid = ~branchBus_flag; // @[Core.scala 82:22]
  wire  _T_3 = ~hd_1_ready; // @[Core.scala 91:15]
  wire  _ctriSigs_deco_T_262 = _ctriSigs_deco_T_1521 | (_ctriSigs_deco_T_1523 | (_ctriSigs_deco_T_1525 | (
    _ctriSigs_deco_T_1527 | (_ctriSigs_deco_T_1529 | (_ctriSigs_deco_T_1531 | (_ctriSigs_deco_T_1533 | (
    _ctriSigs_deco_T_1535 | (_ctriSigs_deco_T_1537 | (_ctriSigs_deco_T_1539 | (_ctriSigs_deco_T_1541 | (
    _ctriSigs_deco_T_1543 | (_ctriSigs_deco_T_1545 | (_ctriSigs_deco_T_1547 | (_ctriSigs_deco_T_1549 | (
    _ctriSigs_deco_T_1551 | (_ctriSigs_deco_T_1553 | (_ctriSigs_deco_T_1555 | _ctriSigs_deco_T_1557))))))))))))))))); // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_263 = _ctriSigs_deco_T_1519 ? 4'h8 : {{3'd0}, _ctriSigs_deco_T_262}; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_264 = _ctriSigs_deco_T_1517 ? 4'h9 : _ctriSigs_deco_T_263; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_265 = _ctriSigs_deco_T_1515 ? 4'h7 : _ctriSigs_deco_T_264; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_266 = _ctriSigs_deco_T_1513 ? 4'hf : _ctriSigs_deco_T_265; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_267 = _ctriSigs_deco_T_1511 ? 4'hc : _ctriSigs_deco_T_266; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_268 = _ctriSigs_deco_T_1509 ? 4'he : _ctriSigs_deco_T_267; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_269 = _ctriSigs_deco_T_1507 ? 4'hb : _ctriSigs_deco_T_268; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_270 = _ctriSigs_deco_T_1505 ? 4'hd : _ctriSigs_deco_T_269; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_271 = _ctriSigs_deco_T_1503 ? 4'ha : _ctriSigs_deco_T_270; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_272 = _ctriSigs_deco_T_1501 ? 4'h6 : _ctriSigs_deco_T_271; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_273 = _ctriSigs_deco_T_1499 ? 4'h3 : _ctriSigs_deco_T_272; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_274 = _ctriSigs_deco_T_1497 ? 4'h5 : _ctriSigs_deco_T_273; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_275 = _ctriSigs_deco_T_1495 ? 4'h2 : _ctriSigs_deco_T_274; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_276 = _ctriSigs_deco_T_1493 ? 4'h4 : _ctriSigs_deco_T_275; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_277 = _ctriSigs_deco_T_1491 ? 4'h1 : _ctriSigs_deco_T_276; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_278 = _ctriSigs_deco_T_1489 ? 4'hf : _ctriSigs_deco_T_277; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_279 = _ctriSigs_deco_T_1487 ? 4'hc : _ctriSigs_deco_T_278; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_280 = _ctriSigs_deco_T_1485 ? 4'he : _ctriSigs_deco_T_279; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_281 = _ctriSigs_deco_T_1483 ? 4'hb : _ctriSigs_deco_T_280; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_282 = _ctriSigs_deco_T_1481 ? 4'hd : _ctriSigs_deco_T_281; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_283 = _ctriSigs_deco_T_1479 ? 4'ha : _ctriSigs_deco_T_282; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_284 = _ctriSigs_deco_T_1477 ? 4'h9 : _ctriSigs_deco_T_283; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_285 = _ctriSigs_deco_T_1475 ? 4'h8 : _ctriSigs_deco_T_284; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_286 = _ctriSigs_deco_T_1473 ? 4'h7 : _ctriSigs_deco_T_285; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_287 = _ctriSigs_deco_T_1471 ? 4'h6 : _ctriSigs_deco_T_286; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_288 = _ctriSigs_deco_T_1469 ? 4'h3 : _ctriSigs_deco_T_287; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_289 = _ctriSigs_deco_T_1467 ? 4'h4 : _ctriSigs_deco_T_288; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_290 = _ctriSigs_deco_T_1465 ? 4'h1 : _ctriSigs_deco_T_289; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_291 = _ctriSigs_deco_T_1463 ? 4'h1 : _ctriSigs_deco_T_290; // @[Mux.scala 98:16]
  wire [3:0] ctriSigs_deco_1 = _ctriSigs_deco_T_1461 ? 4'h1 : _ctriSigs_deco_T_291; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_693 = _ctriSigs_deco_T_1535 ? 1'h0 : _ctriSigs_deco_T_1537 | (_ctriSigs_deco_T_1539 | (
    _ctriSigs_deco_T_1541 | (_ctriSigs_deco_T_1543 | (_ctriSigs_deco_T_1545 | (_ctriSigs_deco_T_1547 | (
    _ctriSigs_deco_T_1549 | (_ctriSigs_deco_T_1551 | (_ctriSigs_deco_T_1553 | (_ctriSigs_deco_T_1555 |
    _ctriSigs_deco_T_1557))))))))); // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_694 = _ctriSigs_deco_T_1533 ? 1'h0 : _ctriSigs_deco_T_693; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_695 = _ctriSigs_deco_T_1531 ? 1'h0 : _ctriSigs_deco_T_694; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_696 = _ctriSigs_deco_T_1529 ? 1'h0 : _ctriSigs_deco_T_695; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_697 = _ctriSigs_deco_T_1527 ? 1'h0 : _ctriSigs_deco_T_696; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_698 = _ctriSigs_deco_T_1525 ? 1'h0 : _ctriSigs_deco_T_697; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_699 = _ctriSigs_deco_T_1523 ? 1'h0 : _ctriSigs_deco_T_698; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_700 = _ctriSigs_deco_T_1521 ? 1'h0 : _ctriSigs_deco_T_699; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_701 = _ctriSigs_deco_T_1519 ? 1'h0 : _ctriSigs_deco_T_700; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_702 = _ctriSigs_deco_T_1517 ? 1'h0 : _ctriSigs_deco_T_701; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_703 = _ctriSigs_deco_T_1515 ? 1'h0 : _ctriSigs_deco_T_702; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_704 = _ctriSigs_deco_T_1513 ? 1'h0 : _ctriSigs_deco_T_703; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_705 = _ctriSigs_deco_T_1511 ? 1'h0 : _ctriSigs_deco_T_704; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_706 = _ctriSigs_deco_T_1509 ? 1'h0 : _ctriSigs_deco_T_705; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_707 = _ctriSigs_deco_T_1507 ? 1'h0 : _ctriSigs_deco_T_706; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_708 = _ctriSigs_deco_T_1505 ? 1'h0 : _ctriSigs_deco_T_707; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_709 = _ctriSigs_deco_T_1503 ? 1'h0 : _ctriSigs_deco_T_708; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_710 = _ctriSigs_deco_T_1501 ? 1'h0 : _ctriSigs_deco_T_709; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_711 = _ctriSigs_deco_T_1499 ? 1'h0 : _ctriSigs_deco_T_710; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_712 = _ctriSigs_deco_T_1497 ? 1'h0 : _ctriSigs_deco_T_711; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_713 = _ctriSigs_deco_T_1495 ? 1'h0 : _ctriSigs_deco_T_712; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_714 = _ctriSigs_deco_T_1493 ? 1'h0 : _ctriSigs_deco_T_713; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_715 = _ctriSigs_deco_T_1491 ? 1'h0 : _ctriSigs_deco_T_714; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_716 = _ctriSigs_deco_T_1489 ? 1'h0 : _ctriSigs_deco_T_715; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_717 = _ctriSigs_deco_T_1487 ? 1'h0 : _ctriSigs_deco_T_716; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_718 = _ctriSigs_deco_T_1485 ? 1'h0 : _ctriSigs_deco_T_717; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_719 = _ctriSigs_deco_T_1483 ? 1'h0 : _ctriSigs_deco_T_718; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_720 = _ctriSigs_deco_T_1481 ? 1'h0 : _ctriSigs_deco_T_719; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_721 = _ctriSigs_deco_T_1479 ? 1'h0 : _ctriSigs_deco_T_720; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_722 = _ctriSigs_deco_T_1477 ? 1'h0 : _ctriSigs_deco_T_721; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_723 = _ctriSigs_deco_T_1475 ? 1'h0 : _ctriSigs_deco_T_722; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_724 = _ctriSigs_deco_T_1473 ? 1'h0 : _ctriSigs_deco_T_723; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_725 = _ctriSigs_deco_T_1471 ? 1'h0 : _ctriSigs_deco_T_724; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_726 = _ctriSigs_deco_T_1469 ? 1'h0 : _ctriSigs_deco_T_725; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_727 = _ctriSigs_deco_T_1467 ? 1'h0 : _ctriSigs_deco_T_726; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_728 = _ctriSigs_deco_T_1465 ? 1'h0 : _ctriSigs_deco_T_727; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_828 = _ctriSigs_deco_T_1557 ? 4'h8 : 4'h0; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_829 = _ctriSigs_deco_T_1555 ? 4'h4 : _ctriSigs_deco_T_828; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_830 = _ctriSigs_deco_T_1553 ? 4'h2 : _ctriSigs_deco_T_829; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_831 = _ctriSigs_deco_T_1551 ? 4'h1 : _ctriSigs_deco_T_830; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_832 = _ctriSigs_deco_T_1549 ? 4'h0 : _ctriSigs_deco_T_831; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_833 = _ctriSigs_deco_T_1547 ? 4'h0 : _ctriSigs_deco_T_832; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_834 = _ctriSigs_deco_T_1545 ? 4'h0 : _ctriSigs_deco_T_833; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_835 = _ctriSigs_deco_T_1543 ? 4'h0 : _ctriSigs_deco_T_834; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_836 = _ctriSigs_deco_T_1541 ? 4'h0 : _ctriSigs_deco_T_835; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_837 = _ctriSigs_deco_T_1539 ? 4'h0 : _ctriSigs_deco_T_836; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_838 = _ctriSigs_deco_T_1537 ? 4'h0 : _ctriSigs_deco_T_837; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_839 = _ctriSigs_deco_T_1535 ? 4'h0 : _ctriSigs_deco_T_838; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_840 = _ctriSigs_deco_T_1533 ? 4'h0 : _ctriSigs_deco_T_839; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_841 = _ctriSigs_deco_T_1531 ? 4'h0 : _ctriSigs_deco_T_840; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_842 = _ctriSigs_deco_T_1529 ? 4'h0 : _ctriSigs_deco_T_841; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_843 = _ctriSigs_deco_T_1527 ? 4'h0 : _ctriSigs_deco_T_842; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_844 = _ctriSigs_deco_T_1525 ? 4'h0 : _ctriSigs_deco_T_843; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_845 = _ctriSigs_deco_T_1523 ? 4'h0 : _ctriSigs_deco_T_844; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_846 = _ctriSigs_deco_T_1521 ? 4'h0 : _ctriSigs_deco_T_845; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_847 = _ctriSigs_deco_T_1519 ? 4'h0 : _ctriSigs_deco_T_846; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_848 = _ctriSigs_deco_T_1517 ? 4'h0 : _ctriSigs_deco_T_847; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_849 = _ctriSigs_deco_T_1515 ? 4'h0 : _ctriSigs_deco_T_848; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_850 = _ctriSigs_deco_T_1513 ? 4'h0 : _ctriSigs_deco_T_849; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_851 = _ctriSigs_deco_T_1511 ? 4'h0 : _ctriSigs_deco_T_850; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_852 = _ctriSigs_deco_T_1509 ? 4'h0 : _ctriSigs_deco_T_851; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_853 = _ctriSigs_deco_T_1507 ? 4'h0 : _ctriSigs_deco_T_852; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_854 = _ctriSigs_deco_T_1505 ? 4'h0 : _ctriSigs_deco_T_853; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_855 = _ctriSigs_deco_T_1503 ? 4'h0 : _ctriSigs_deco_T_854; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_856 = _ctriSigs_deco_T_1501 ? 4'h0 : _ctriSigs_deco_T_855; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_857 = _ctriSigs_deco_T_1499 ? 4'h0 : _ctriSigs_deco_T_856; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_858 = _ctriSigs_deco_T_1497 ? 4'h0 : _ctriSigs_deco_T_857; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_859 = _ctriSigs_deco_T_1495 ? 4'h0 : _ctriSigs_deco_T_858; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_860 = _ctriSigs_deco_T_1493 ? 4'h0 : _ctriSigs_deco_T_859; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_861 = _ctriSigs_deco_T_1491 ? 4'h0 : _ctriSigs_deco_T_860; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_862 = _ctriSigs_deco_T_1489 ? 4'h0 : _ctriSigs_deco_T_861; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_863 = _ctriSigs_deco_T_1487 ? 4'h0 : _ctriSigs_deco_T_862; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_864 = _ctriSigs_deco_T_1485 ? 4'h0 : _ctriSigs_deco_T_863; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_865 = _ctriSigs_deco_T_1483 ? 4'h0 : _ctriSigs_deco_T_864; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_866 = _ctriSigs_deco_T_1481 ? 4'h0 : _ctriSigs_deco_T_865; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_867 = _ctriSigs_deco_T_1479 ? 4'h0 : _ctriSigs_deco_T_866; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_868 = _ctriSigs_deco_T_1477 ? 4'h0 : _ctriSigs_deco_T_867; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_869 = _ctriSigs_deco_T_1475 ? 4'h0 : _ctriSigs_deco_T_868; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_870 = _ctriSigs_deco_T_1473 ? 4'h0 : _ctriSigs_deco_T_869; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_871 = _ctriSigs_deco_T_1471 ? 4'h0 : _ctriSigs_deco_T_870; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_872 = _ctriSigs_deco_T_1469 ? 4'h0 : _ctriSigs_deco_T_871; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_873 = _ctriSigs_deco_T_1467 ? 4'h0 : _ctriSigs_deco_T_872; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_874 = _ctriSigs_deco_T_1465 ? 4'h0 : _ctriSigs_deco_T_873; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_985 = _ctriSigs_deco_T_1535 ? 1'h0 : _ctriSigs_deco_T_1537 | (_ctriSigs_deco_T_1539 | (
    _ctriSigs_deco_T_1541 | (_ctriSigs_deco_T_1543 | (_ctriSigs_deco_T_1545 | (_ctriSigs_deco_T_1547 |
    _ctriSigs_deco_T_1549))))); // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_986 = _ctriSigs_deco_T_1533 ? 1'h0 : _ctriSigs_deco_T_985; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_987 = _ctriSigs_deco_T_1531 ? 1'h0 : _ctriSigs_deco_T_986; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_988 = _ctriSigs_deco_T_1529 ? 1'h0 : _ctriSigs_deco_T_987; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_989 = _ctriSigs_deco_T_1527 ? 1'h0 : _ctriSigs_deco_T_988; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_990 = _ctriSigs_deco_T_1525 ? 1'h0 : _ctriSigs_deco_T_989; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_1020 = _ctriSigs_deco_T_1465 | (_ctriSigs_deco_T_1467 | (_ctriSigs_deco_T_1469 | (
    _ctriSigs_deco_T_1471 | (_ctriSigs_deco_T_1473 | (_ctriSigs_deco_T_1475 | (_ctriSigs_deco_T_1477 | (
    _ctriSigs_deco_T_1479 | (_ctriSigs_deco_T_1481 | (_ctriSigs_deco_T_1483 | (_ctriSigs_deco_T_1485 | (
    _ctriSigs_deco_T_1487 | (_ctriSigs_deco_T_1489 | (_ctriSigs_deco_T_1491 | (_ctriSigs_deco_T_1493 | (
    _ctriSigs_deco_T_1495 | (_ctriSigs_deco_T_1497 | (_ctriSigs_deco_T_1499 | (_ctriSigs_deco_T_1501 | (
    _ctriSigs_deco_T_1503 | (_ctriSigs_deco_T_1505 | (_ctriSigs_deco_T_1507 | (_ctriSigs_deco_T_1509 | (
    _ctriSigs_deco_T_1511 | (_ctriSigs_deco_T_1513 | (_ctriSigs_deco_T_1515 | (_ctriSigs_deco_T_1517 | (
    _ctriSigs_deco_T_1519 | (_ctriSigs_deco_T_1521 | (_ctriSigs_deco_T_1523 | _ctriSigs_deco_T_990))))))))))))))))))))))
    ))))))); // @[Mux.scala 98:16]
  wire  ctriSigs_deco_6 = _ctriSigs_deco_T_1461 | (_ctriSigs_deco_T_1463 | _ctriSigs_deco_T_1020); // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1124 = _ctriSigs_deco_T_1549 ? 4'h8 : 4'h0; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1125 = _ctriSigs_deco_T_1547 ? 4'h7 : _ctriSigs_deco_T_1124; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1126 = _ctriSigs_deco_T_1545 ? 4'h6 : _ctriSigs_deco_T_1125; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1127 = _ctriSigs_deco_T_1543 ? 4'h5 : _ctriSigs_deco_T_1126; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1128 = _ctriSigs_deco_T_1541 ? 4'h4 : _ctriSigs_deco_T_1127; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1129 = _ctriSigs_deco_T_1539 ? 4'h3 : _ctriSigs_deco_T_1128; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1130 = _ctriSigs_deco_T_1537 ? 4'h2 : _ctriSigs_deco_T_1129; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1131 = _ctriSigs_deco_T_1535 ? 4'h0 : _ctriSigs_deco_T_1130; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1132 = _ctriSigs_deco_T_1533 ? 4'h0 : _ctriSigs_deco_T_1131; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1133 = _ctriSigs_deco_T_1531 ? 4'h0 : _ctriSigs_deco_T_1132; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1134 = _ctriSigs_deco_T_1529 ? 4'h0 : _ctriSigs_deco_T_1133; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1135 = _ctriSigs_deco_T_1527 ? 4'h0 : _ctriSigs_deco_T_1134; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1136 = _ctriSigs_deco_T_1525 ? 4'h0 : _ctriSigs_deco_T_1135; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1137 = _ctriSigs_deco_T_1523 ? 4'h1 : _ctriSigs_deco_T_1136; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1138 = _ctriSigs_deco_T_1521 ? 4'h1 : _ctriSigs_deco_T_1137; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1139 = _ctriSigs_deco_T_1519 ? 4'h1 : _ctriSigs_deco_T_1138; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1140 = _ctriSigs_deco_T_1517 ? 4'h1 : _ctriSigs_deco_T_1139; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1141 = _ctriSigs_deco_T_1515 ? 4'h1 : _ctriSigs_deco_T_1140; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1142 = _ctriSigs_deco_T_1513 ? 4'h1 : _ctriSigs_deco_T_1141; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1143 = _ctriSigs_deco_T_1511 ? 4'h1 : _ctriSigs_deco_T_1142; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1144 = _ctriSigs_deco_T_1509 ? 4'h1 : _ctriSigs_deco_T_1143; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1145 = _ctriSigs_deco_T_1507 ? 4'h1 : _ctriSigs_deco_T_1144; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1146 = _ctriSigs_deco_T_1505 ? 4'h1 : _ctriSigs_deco_T_1145; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1147 = _ctriSigs_deco_T_1503 ? 4'h1 : _ctriSigs_deco_T_1146; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1148 = _ctriSigs_deco_T_1501 ? 4'h1 : _ctriSigs_deco_T_1147; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1149 = _ctriSigs_deco_T_1499 ? 4'h1 : _ctriSigs_deco_T_1148; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1150 = _ctriSigs_deco_T_1497 ? 4'h1 : _ctriSigs_deco_T_1149; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1151 = _ctriSigs_deco_T_1495 ? 4'h1 : _ctriSigs_deco_T_1150; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1152 = _ctriSigs_deco_T_1493 ? 4'h1 : _ctriSigs_deco_T_1151; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1153 = _ctriSigs_deco_T_1491 ? 4'h1 : _ctriSigs_deco_T_1152; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1154 = _ctriSigs_deco_T_1489 ? 4'h1 : _ctriSigs_deco_T_1153; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1155 = _ctriSigs_deco_T_1487 ? 4'h1 : _ctriSigs_deco_T_1154; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1156 = _ctriSigs_deco_T_1485 ? 4'h1 : _ctriSigs_deco_T_1155; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1157 = _ctriSigs_deco_T_1483 ? 4'h1 : _ctriSigs_deco_T_1156; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1158 = _ctriSigs_deco_T_1481 ? 4'h1 : _ctriSigs_deco_T_1157; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1159 = _ctriSigs_deco_T_1479 ? 4'h1 : _ctriSigs_deco_T_1158; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1160 = _ctriSigs_deco_T_1477 ? 4'h1 : _ctriSigs_deco_T_1159; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1161 = _ctriSigs_deco_T_1475 ? 4'h1 : _ctriSigs_deco_T_1160; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1162 = _ctriSigs_deco_T_1473 ? 4'h1 : _ctriSigs_deco_T_1161; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1163 = _ctriSigs_deco_T_1471 ? 4'h1 : _ctriSigs_deco_T_1162; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1164 = _ctriSigs_deco_T_1469 ? 4'h1 : _ctriSigs_deco_T_1163; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1165 = _ctriSigs_deco_T_1467 ? 4'h1 : _ctriSigs_deco_T_1164; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1166 = _ctriSigs_deco_T_1465 ? 4'h1 : _ctriSigs_deco_T_1165; // @[Mux.scala 98:16]
  reg [6:0] exCtrlSigs_excTy; // @[Core.scala 157:28]
  reg [3:0] exCtrlSigs_wbdSel; // @[Core.scala 157:28]
  reg [63:0] exOpVec_0; // @[Core.scala 158:28]
  reg [63:0] exOpVec_1; // @[Core.scala 158:28]
  reg [63:0] exPc; // @[Core.scala 159:28]
  reg [31:0] exInst; // @[Core.scala 160:28]
  reg [63:0] exStoreData; // @[Core.scala 162:28]
  wire  _GEN_10 = _T_3 | ctriSigs_deco_6; // @[Core.scala 170:31 Core.scala 171:17 Core.scala 178:17]
  wire [6:0] ctriSigs_excTy = {{3'd0}, ctriSigs_deco_1}; // @[Core.scala 104:22 Decoder.scala 95:39]
  reg  ctrlSigsMem_memcen; // @[Core.scala 203:32]
  reg [3:0] ctrlSigsMem_memwen; // @[Core.scala 203:32]
  reg [63:0] pcMem; // @[Core.scala 206:32]
  reg [31:0] instMem; // @[Core.scala 207:32]
  reg [63:0] storeDataMem; // @[Core.scala 208:32]
  wire [7:0] io_dmem_wdata_lo = storeDataMem[7:0]; // @[Core.scala 229:43]
  wire [63:0] _io_dmem_wdata_T = {56'h0,io_dmem_wdata_lo}; // @[Cat.scala 30:58]
  wire [15:0] io_dmem_wdata_lo_1 = storeDataMem[15:0]; // @[Core.scala 230:43]
  wire [63:0] _io_dmem_wdata_T_1 = {48'h0,io_dmem_wdata_lo_1}; // @[Cat.scala 30:58]
  wire [31:0] io_dmem_wdata_lo_2 = storeDataMem[31:0]; // @[Core.scala 231:43]
  wire [63:0] _io_dmem_wdata_T_2 = {32'h0,io_dmem_wdata_lo_2}; // @[Cat.scala 30:58]
  wire [63:0] _io_dmem_wdata_T_4 = 4'h1 == ctrlSigsMem_memwen ? _io_dmem_wdata_T : storeDataMem; // @[Mux.scala 80:57]
  wire [63:0] _io_dmem_wdata_T_6 = 4'h2 == ctrlSigsMem_memwen ? _io_dmem_wdata_T_1 : _io_dmem_wdata_T_4; // @[Mux.scala 80:57]
  wire [63:0] _io_dmem_wdata_T_8 = 4'h4 == ctrlSigsMem_memwen ? _io_dmem_wdata_T_2 : _io_dmem_wdata_T_6; // @[Mux.scala 80:57]
  reg [63:0] pcWb; // @[Core.scala 256:28]
  reg [31:0] instWb; // @[Core.scala 257:28]
  wire  _T_7 = wbAddr != 5'h0; // @[rf.scala 21:18]
  GprAddrGen GprAddrGen ( // @[Core.scala 106:26]
    .io_in(GprAddrGen_io_in),
    .io_o_rs1(GprAddrGen_io_o_rs1),
    .io_o_rs2(GprAddrGen_io_o_rs2),
    .io_o_rd(GprAddrGen_io_o_rd)
  );
  Alu Alu ( // @[Core.scala 186:19]
    .io_excTy(Alu_io_excTy),
    .io_opVec_0(Alu_io_opVec_0),
    .io_opVec_1(Alu_io_opVec_1),
    .io_result(Alu_io_result)
  );
  dpi dpi ( // @[Core.scala 280:19]
    .inst(dpi_inst),
    .pc(dpi_pc),
    .gpr_a0(dpi_gpr_a0)
  );
  assign gpr_id_rs_ret_MPORT_addr = GprAddrGen_io_o_rs1;
  assign gpr_id_rs_ret_MPORT_data = gpr[gpr_id_rs_ret_MPORT_addr]; // @[rf.scala 13:26]
  assign gpr_id_rs_ret_MPORT_1_addr = GprAddrGen_io_o_rs2;
  assign gpr_id_rs_ret_MPORT_1_data = gpr[gpr_id_rs_ret_MPORT_1_addr]; // @[rf.scala 13:26]
  assign gpr_ret_MPORT_addr = 5'ha;
  assign gpr_ret_MPORT_data = gpr[gpr_ret_MPORT_addr]; // @[rf.scala 13:26]
  assign gpr_MPORT_data = wbData;
  assign gpr_MPORT_addr = wbAddr;
  assign gpr_MPORT_mask = 1'h1;
  assign gpr_MPORT_en = _T_7 & ctrlSigsWb_rfwen;
  assign io_debug_debugPc = pcWb; // @[Core.scala 285:23]
  assign io_debug_debugInst = instWb; // @[Core.scala 286:23]
  assign io_debug_debugwen = ctrlSigsWb_rfwen; // @[Core.scala 287:23]
  assign io_debug_debugwaddr = wbAddr; // @[Core.scala 288:23]
  assign io_debug_debugdata = wbData; // @[Core.scala 289:23]
  assign io_imem_addr = pcreg; // @[Core.scala 57:30 Core.scala 69:12]
  assign io_imem_cen = cenreg; // @[Core.scala 72:15]
  assign io_imem_wen = 1'h0; // @[Core.scala 36:15]
  assign io_imem_wdata = 64'h0; // @[Core.scala 37:17]
  assign io_dmem_addr = alu_resultMem; // @[Core.scala 234:16]
  assign io_dmem_cen = ctrlSigsMem_memcen; // @[Core.scala 225:15]
  assign io_dmem_wen = ctrlSigsMem_memwen; // @[Core.scala 226:15]
  assign io_dmem_wdata = 4'h8 == ctrlSigsMem_memwen ? storeDataMem : _io_dmem_wdata_T_8; // @[Mux.scala 80:57]
  assign GprAddrGen_io_in = If2IdInst; // @[Core.scala 108:16]
  assign Alu_io_excTy = exCtrlSigs_excTy; // @[Core.scala 187:13]
  assign Alu_io_opVec_0 = exOpVec_0; // @[Core.scala 188:13]
  assign Alu_io_opVec_1 = exOpVec_1; // @[Core.scala 188:13]
  assign dpi_inst = io_debug_debugInst; // @[Core.scala 281:15]
  assign dpi_pc = io_debug_debugPc; // @[Core.scala 282:15]
  assign dpi_gpr_a0 = gpr_ret_MPORT_data; // @[rf.scala 31:18]
  always @(posedge clock) begin
    if(gpr_MPORT_en & gpr_MPORT_mask) begin
      gpr[gpr_MPORT_addr] <= gpr_MPORT_data; // @[rf.scala 13:26]
    end
    if (reset) begin // @[Core.scala 55:33]
      pcreg <= 64'h80000000; // @[Core.scala 55:33]
    end else if (cenreg) begin // @[Core.scala 63:27]
      if (hd_1_ready) begin // @[Core.scala 64:45]
        if (branchBus_flag) begin // @[Core.scala 61:17]
          pcreg <= branchBus_target;
        end else begin
          pcreg <= seq_pc;
        end
      end
    end
    if (reset) begin // @[Core.scala 56:33]
      cenreg <= 1'h0; // @[Core.scala 56:33]
    end else begin
      cenreg <= 1'h1; // @[Core.scala 68:10]
    end
    if (reset) begin // @[Core.scala 86:35]
      If2IdInst <= 32'h13; // @[Core.scala 86:35]
    end else if (~hd_1_valid) begin // @[Core.scala 88:29]
      If2IdInst <= 32'h13; // @[Core.scala 90:15]
    end else if (!(~hd_1_ready)) begin // @[Core.scala 91:34]
      If2IdInst <= io_imem_rdata; // @[Core.scala 95:15]
    end
    if (reset) begin // @[Core.scala 85:35]
      If2IdPc <= 64'h0; // @[Core.scala 85:35]
    end else if (~hd_1_valid) begin // @[Core.scala 88:29]
      If2IdPc <= 64'h0; // @[Core.scala 89:13]
    end else if (!(~hd_1_ready)) begin // @[Core.scala 91:34]
      If2IdPc <= pcreg; // @[Core.scala 96:15]
    end
    exCtrlSigs_rfwen <= reset | _GEN_10; // @[Core.scala 157:28 Core.scala 157:28]
    if (reset) begin // @[Core.scala 161:28]
      exRd <= 5'h0; // @[Core.scala 161:28]
    end else if (_T_3) begin // @[Core.scala 170:31]
      exRd <= 5'h0; // @[Core.scala 175:17]
    end else begin
      exRd <= GprAddrGen_io_o_rd; // @[Core.scala 182:17]
    end
    ctrlSigsMem_rfwen <= reset | exCtrlSigs_rfwen; // @[Core.scala 203:32 Core.scala 203:32]
    if (reset) begin // @[Core.scala 205:32]
      rdMem <= 5'h0; // @[Core.scala 205:32]
    end else begin
      rdMem <= exRd;
    end
    if (reset) begin // @[Core.scala 203:32]
      ctrlSigsMem_wbdSel <= 4'h1; // @[Core.scala 203:32]
    end else begin
      ctrlSigsMem_wbdSel <= exCtrlSigs_wbdSel;
    end
    if (reset) begin // @[Core.scala 204:32]
      alu_resultMem <= 64'h0; // @[Core.scala 204:32]
    end else begin
      alu_resultMem <= exBypassing_wr;
    end
    ctrlSigsWb_rfwen <= reset | ctrlSigsMem_rfwen; // @[Core.scala 255:28 Core.scala 255:28]
    if (reset) begin // @[Core.scala 259:28]
      wbAddr <= 5'h0; // @[Core.scala 259:28]
    end else begin
      wbAddr <= rdMem;
    end
    if (reset) begin // @[Core.scala 258:28]
      wbData <= 64'h0; // @[Core.scala 258:28]
    end else if (4'h7 == ctrlSigsMem_wbdSel) begin // @[Mux.scala 80:57]
      wbData <= MemWbData_ret_5;
    end else if (4'h6 == ctrlSigsMem_wbdSel) begin // @[Mux.scala 80:57]
      wbData <= MemWbData_ret_4;
    end else if (4'h5 == ctrlSigsMem_wbdSel) begin // @[Mux.scala 80:57]
      wbData <= MemWbData_ret_3;
    end else begin
      wbData <= _MemWbData_T_9;
    end
    if (reset) begin // @[Core.scala 157:28]
      exCtrlSigs_memcen <= 1'h0; // @[Core.scala 157:28]
    end else if (_T_3) begin // @[Core.scala 170:31]
      exCtrlSigs_memcen <= 1'h0; // @[Core.scala 171:17]
    end else if (_ctriSigs_deco_T_1461) begin // @[Mux.scala 98:16]
      exCtrlSigs_memcen <= 1'h0;
    end else if (_ctriSigs_deco_T_1463) begin // @[Mux.scala 98:16]
      exCtrlSigs_memcen <= 1'h0;
    end else begin
      exCtrlSigs_memcen <= _ctriSigs_deco_T_728;
    end
    if (reset) begin // @[Core.scala 157:28]
      exCtrlSigs_memwen <= 4'h0; // @[Core.scala 157:28]
    end else if (_T_3) begin // @[Core.scala 170:31]
      exCtrlSigs_memwen <= 4'h0; // @[Core.scala 171:17]
    end else if (_ctriSigs_deco_T_1461) begin // @[Mux.scala 98:16]
      exCtrlSigs_memwen <= 4'h0;
    end else if (_ctriSigs_deco_T_1463) begin // @[Mux.scala 98:16]
      exCtrlSigs_memwen <= 4'h0;
    end else begin
      exCtrlSigs_memwen <= _ctriSigs_deco_T_874;
    end
    if (reset) begin // @[Core.scala 157:28]
      exCtrlSigs_excTy <= 7'h1; // @[Core.scala 157:28]
    end else if (_T_3) begin // @[Core.scala 170:31]
      exCtrlSigs_excTy <= 7'h1; // @[Core.scala 171:17]
    end else begin
      exCtrlSigs_excTy <= ctriSigs_excTy; // @[Core.scala 178:17]
    end
    if (reset) begin // @[Core.scala 157:28]
      exCtrlSigs_wbdSel <= 4'h1; // @[Core.scala 157:28]
    end else if (_T_3) begin // @[Core.scala 170:31]
      exCtrlSigs_wbdSel <= 4'h1; // @[Core.scala 171:17]
    end else if (_ctriSigs_deco_T_1461) begin // @[Mux.scala 98:16]
      exCtrlSigs_wbdSel <= 4'h1;
    end else if (_ctriSigs_deco_T_1463) begin // @[Mux.scala 98:16]
      exCtrlSigs_wbdSel <= 4'h1;
    end else begin
      exCtrlSigs_wbdSel <= _ctriSigs_deco_T_1166;
    end
    if (reset) begin // @[Core.scala 158:28]
      exOpVec_0 <= 64'h0; // @[Core.scala 158:28]
    end else if (_T_3) begin // @[Core.scala 170:31]
      exOpVec_0 <= 64'h0; // @[Core.scala 172:17]
    end else if (2'h3 == ctriSigs_deco_2) begin // @[Mux.scala 80:57]
      exOpVec_0 <= 64'h0;
    end else if (2'h2 == ctriSigs_deco_2) begin // @[Mux.scala 80:57]
      exOpVec_0 <= If2IdPc;
    end else begin
      exOpVec_0 <= _opVec_0_T;
    end
    if (reset) begin // @[Core.scala 158:28]
      exOpVec_1 <= 64'h0; // @[Core.scala 158:28]
    end else if (_T_3) begin // @[Core.scala 170:31]
      exOpVec_1 <= 64'h0; // @[Core.scala 172:17]
    end else if (3'h3 == ctriSigs_deco_3) begin // @[Mux.scala 80:57]
      exOpVec_1 <= 64'h0;
    end else if (3'h4 == ctriSigs_deco_3) begin // @[Mux.scala 80:57]
      exOpVec_1 <= 64'h4;
    end else begin
      exOpVec_1 <= _opVec_1_T_5;
    end
    if (reset) begin // @[Core.scala 159:28]
      exPc <= 64'h0; // @[Core.scala 159:28]
    end else if (_T_3) begin // @[Core.scala 170:31]
      exPc <= 64'h0; // @[Core.scala 173:17]
    end else begin
      exPc <= If2IdPc; // @[Core.scala 180:17]
    end
    if (reset) begin // @[Core.scala 160:28]
      exInst <= 32'h13; // @[Core.scala 160:28]
    end else if (_T_3) begin // @[Core.scala 170:31]
      exInst <= 32'h13; // @[Core.scala 174:17]
    end else begin
      exInst <= If2IdInst; // @[Core.scala 181:17]
    end
    if (reset) begin // @[Core.scala 162:28]
      exStoreData <= 64'h0; // @[Core.scala 162:28]
    end else if (_T_3) begin // @[Core.scala 170:31]
      exStoreData <= 64'h0; // @[Core.scala 176:17]
    end else begin
      exStoreData <= _opVec_1_T; // @[Core.scala 183:17]
    end
    if (reset) begin // @[Core.scala 203:32]
      ctrlSigsMem_memcen <= 1'h0; // @[Core.scala 203:32]
    end else begin
      ctrlSigsMem_memcen <= exCtrlSigs_memcen;
    end
    if (reset) begin // @[Core.scala 203:32]
      ctrlSigsMem_memwen <= 4'h0; // @[Core.scala 203:32]
    end else begin
      ctrlSigsMem_memwen <= exCtrlSigs_memwen;
    end
    if (reset) begin // @[Core.scala 206:32]
      pcMem <= 64'h0; // @[Core.scala 206:32]
    end else begin
      pcMem <= exPc;
    end
    if (reset) begin // @[Core.scala 207:32]
      instMem <= 32'h13; // @[Core.scala 207:32]
    end else begin
      instMem <= exInst;
    end
    if (reset) begin // @[Core.scala 208:32]
      storeDataMem <= 64'h0; // @[Core.scala 208:32]
    end else begin
      storeDataMem <= exStoreData;
    end
    if (reset) begin // @[Core.scala 256:28]
      pcWb <= 64'h0; // @[Core.scala 256:28]
    end else begin
      pcWb <= pcMem;
    end
    if (reset) begin // @[Core.scala 257:28]
      instWb <= 32'h13; // @[Core.scala 257:28]
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
  ctrlSigsMem_wbdSel = _RAND_9[3:0];
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
  exCtrlSigs_wbdSel = _RAND_17[3:0];
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
