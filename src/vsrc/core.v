module GprAddrGen(
  input  [31:0] io_in,
  output [4:0]  io_o_rs1,
  output [4:0]  io_o_rs2,
  output [4:0]  io_o_rd
);
  assign io_o_rs1 = io_in[19:15]; // @[Decoder.scala 177:20]
  assign io_o_rs2 = io_in[24:20]; // @[Decoder.scala 178:20]
  assign io_o_rd = io_in[11:7]; // @[Decoder.scala 179:20]
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
  wire [63:0] _logicShiftResult_T_5 = 7'h3 == io_excTy ? {{63'd0}, _logicShiftResult_T_2} : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] logicShiftResult = 7'h6 == io_excTy ? {{63'd0}, _logicShiftResult_T_3} : _logicShiftResult_T_5; // @[Mux.scala 80:57]
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
  wire [31:0] _ctriSigs_deco_T_1340 = If2IdInst & 32'h7f; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1341 = 32'h17 == _ctriSigs_deco_T_1340; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1343 = 32'h37 == _ctriSigs_deco_T_1340; // @[Decoder.scala 145:53]
  wire [31:0] _ctriSigs_deco_T_1344 = If2IdInst & 32'h707f; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1345 = 32'h13 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1347 = 32'h1b == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1349 = 32'h2013 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1351 = 32'h3013 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1353 = 32'h4013 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1355 = 32'h7013 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire [31:0] _ctriSigs_deco_T_1356 = If2IdInst & 32'hfc00707f; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1357 = 32'h1013 == _ctriSigs_deco_T_1356; // @[Decoder.scala 145:53]
  wire [31:0] _ctriSigs_deco_T_1358 = If2IdInst & 32'hfe00707f; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1359 = 32'h101b == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1361 = 32'h5013 == _ctriSigs_deco_T_1356; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1363 = 32'h501b == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1365 = 32'h40005013 == _ctriSigs_deco_T_1356; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1367 = 32'h4000501b == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1369 = 32'h33 == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1371 = 32'h3b == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1373 = 32'h40000033 == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1375 = 32'h4000003b == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1377 = 32'h2033 == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1379 = 32'h3033 == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1381 = 32'h1033 == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1383 = 32'h103b == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1385 = 32'h5033 == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1387 = 32'h503b == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1389 = 32'h40005033 == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1391 = 32'h4000503b == _ctriSigs_deco_T_1358; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1393 = 32'h6f == _ctriSigs_deco_T_1340; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1395 = 32'h67 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1397 = 32'h63 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1399 = 32'h1063 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1401 = 32'h4063 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1403 = 32'h5063 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1405 = 32'h6063 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1407 = 32'h7063 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1409 = 32'h3 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1411 = 32'h4003 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1413 = 32'h1003 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1415 = 32'h5003 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1417 = 32'h2003 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1419 = 32'h6003 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1421 = 32'h3003 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1423 = 32'h23 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1425 = 32'h1023 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1427 = 32'h2023 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire  _ctriSigs_deco_T_1429 = 32'h3023 == _ctriSigs_deco_T_1344; // @[Decoder.scala 145:53]
  wire [2:0] _ctriSigs_deco_T_1441 = _ctriSigs_deco_T_1407 ? 3'h6 : 3'h0; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1442 = _ctriSigs_deco_T_1405 ? 3'h4 : _ctriSigs_deco_T_1441; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1443 = _ctriSigs_deco_T_1403 ? 3'h5 : _ctriSigs_deco_T_1442; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1444 = _ctriSigs_deco_T_1401 ? 3'h3 : _ctriSigs_deco_T_1443; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1445 = _ctriSigs_deco_T_1399 ? 3'h2 : _ctriSigs_deco_T_1444; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1446 = _ctriSigs_deco_T_1397 ? 3'h1 : _ctriSigs_deco_T_1445; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1447 = _ctriSigs_deco_T_1395 ? 3'h0 : _ctriSigs_deco_T_1446; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1448 = _ctriSigs_deco_T_1393 ? 3'h0 : _ctriSigs_deco_T_1447; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1449 = _ctriSigs_deco_T_1391 ? 3'h0 : _ctriSigs_deco_T_1448; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1450 = _ctriSigs_deco_T_1389 ? 3'h0 : _ctriSigs_deco_T_1449; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1451 = _ctriSigs_deco_T_1387 ? 3'h0 : _ctriSigs_deco_T_1450; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1452 = _ctriSigs_deco_T_1385 ? 3'h0 : _ctriSigs_deco_T_1451; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1453 = _ctriSigs_deco_T_1383 ? 3'h0 : _ctriSigs_deco_T_1452; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1454 = _ctriSigs_deco_T_1381 ? 3'h0 : _ctriSigs_deco_T_1453; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1455 = _ctriSigs_deco_T_1379 ? 3'h0 : _ctriSigs_deco_T_1454; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1456 = _ctriSigs_deco_T_1377 ? 3'h0 : _ctriSigs_deco_T_1455; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1457 = _ctriSigs_deco_T_1375 ? 3'h0 : _ctriSigs_deco_T_1456; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1458 = _ctriSigs_deco_T_1373 ? 3'h0 : _ctriSigs_deco_T_1457; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1459 = _ctriSigs_deco_T_1371 ? 3'h0 : _ctriSigs_deco_T_1458; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1460 = _ctriSigs_deco_T_1369 ? 3'h0 : _ctriSigs_deco_T_1459; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1461 = _ctriSigs_deco_T_1367 ? 3'h0 : _ctriSigs_deco_T_1460; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1462 = _ctriSigs_deco_T_1365 ? 3'h0 : _ctriSigs_deco_T_1461; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1463 = _ctriSigs_deco_T_1363 ? 3'h0 : _ctriSigs_deco_T_1462; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1464 = _ctriSigs_deco_T_1361 ? 3'h0 : _ctriSigs_deco_T_1463; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1465 = _ctriSigs_deco_T_1359 ? 3'h0 : _ctriSigs_deco_T_1464; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1466 = _ctriSigs_deco_T_1357 ? 3'h0 : _ctriSigs_deco_T_1465; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1467 = _ctriSigs_deco_T_1355 ? 3'h0 : _ctriSigs_deco_T_1466; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1468 = _ctriSigs_deco_T_1353 ? 3'h0 : _ctriSigs_deco_T_1467; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1469 = _ctriSigs_deco_T_1351 ? 3'h0 : _ctriSigs_deco_T_1468; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1470 = _ctriSigs_deco_T_1349 ? 3'h0 : _ctriSigs_deco_T_1469; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1471 = _ctriSigs_deco_T_1347 ? 3'h0 : _ctriSigs_deco_T_1470; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1472 = _ctriSigs_deco_T_1345 ? 3'h0 : _ctriSigs_deco_T_1471; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_1473 = _ctriSigs_deco_T_1343 ? 3'h0 : _ctriSigs_deco_T_1472; // @[Mux.scala 98:16]
  wire [2:0] ctriSigs_deco_10 = _ctriSigs_deco_T_1341 ? 3'h0 : _ctriSigs_deco_T_1473; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_368 = _ctriSigs_deco_T_1409 | (_ctriSigs_deco_T_1411 | (_ctriSigs_deco_T_1413 | (
    _ctriSigs_deco_T_1415 | (_ctriSigs_deco_T_1417 | (_ctriSigs_deco_T_1419 | (_ctriSigs_deco_T_1421 | (
    _ctriSigs_deco_T_1423 | (_ctriSigs_deco_T_1425 | (_ctriSigs_deco_T_1427 | _ctriSigs_deco_T_1429))))))))); // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_369 = _ctriSigs_deco_T_1407 ? 2'h3 : {{1'd0}, _ctriSigs_deco_T_368}; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_370 = _ctriSigs_deco_T_1405 ? 2'h3 : _ctriSigs_deco_T_369; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_371 = _ctriSigs_deco_T_1403 ? 2'h3 : _ctriSigs_deco_T_370; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_372 = _ctriSigs_deco_T_1401 ? 2'h3 : _ctriSigs_deco_T_371; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_373 = _ctriSigs_deco_T_1399 ? 2'h3 : _ctriSigs_deco_T_372; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_374 = _ctriSigs_deco_T_1397 ? 2'h3 : _ctriSigs_deco_T_373; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_375 = _ctriSigs_deco_T_1395 ? 2'h2 : _ctriSigs_deco_T_374; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_376 = _ctriSigs_deco_T_1393 ? 2'h2 : _ctriSigs_deco_T_375; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_377 = _ctriSigs_deco_T_1391 ? 2'h1 : _ctriSigs_deco_T_376; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_378 = _ctriSigs_deco_T_1389 ? 2'h1 : _ctriSigs_deco_T_377; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_379 = _ctriSigs_deco_T_1387 ? 2'h1 : _ctriSigs_deco_T_378; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_380 = _ctriSigs_deco_T_1385 ? 2'h1 : _ctriSigs_deco_T_379; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_381 = _ctriSigs_deco_T_1383 ? 2'h1 : _ctriSigs_deco_T_380; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_382 = _ctriSigs_deco_T_1381 ? 2'h1 : _ctriSigs_deco_T_381; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_383 = _ctriSigs_deco_T_1379 ? 2'h1 : _ctriSigs_deco_T_382; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_384 = _ctriSigs_deco_T_1377 ? 2'h1 : _ctriSigs_deco_T_383; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_385 = _ctriSigs_deco_T_1375 ? 2'h1 : _ctriSigs_deco_T_384; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_386 = _ctriSigs_deco_T_1373 ? 2'h1 : _ctriSigs_deco_T_385; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_387 = _ctriSigs_deco_T_1371 ? 2'h1 : _ctriSigs_deco_T_386; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_388 = _ctriSigs_deco_T_1369 ? 2'h1 : _ctriSigs_deco_T_387; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_389 = _ctriSigs_deco_T_1367 ? 2'h1 : _ctriSigs_deco_T_388; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_390 = _ctriSigs_deco_T_1365 ? 2'h1 : _ctriSigs_deco_T_389; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_391 = _ctriSigs_deco_T_1363 ? 2'h1 : _ctriSigs_deco_T_390; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_392 = _ctriSigs_deco_T_1361 ? 2'h1 : _ctriSigs_deco_T_391; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_393 = _ctriSigs_deco_T_1359 ? 2'h1 : _ctriSigs_deco_T_392; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_394 = _ctriSigs_deco_T_1357 ? 2'h1 : _ctriSigs_deco_T_393; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_395 = _ctriSigs_deco_T_1355 ? 2'h1 : _ctriSigs_deco_T_394; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_396 = _ctriSigs_deco_T_1353 ? 2'h1 : _ctriSigs_deco_T_395; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_397 = _ctriSigs_deco_T_1351 ? 2'h1 : _ctriSigs_deco_T_396; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_398 = _ctriSigs_deco_T_1349 ? 2'h1 : _ctriSigs_deco_T_397; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_399 = _ctriSigs_deco_T_1347 ? 2'h1 : _ctriSigs_deco_T_398; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_400 = _ctriSigs_deco_T_1345 ? 2'h1 : _ctriSigs_deco_T_399; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_401 = _ctriSigs_deco_T_1343 ? 2'h3 : _ctriSigs_deco_T_400; // @[Mux.scala 98:16]
  wire [1:0] ctriSigs_deco_2 = _ctriSigs_deco_T_1341 ? 2'h2 : _ctriSigs_deco_T_401; // @[Mux.scala 98:16]
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
  wire [1:0] _ctriSigs_deco_T_492 = _ctriSigs_deco_T_1429 ? 2'h2 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_493 = _ctriSigs_deco_T_1427 ? 2'h2 : _ctriSigs_deco_T_492; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_494 = _ctriSigs_deco_T_1425 ? 2'h2 : _ctriSigs_deco_T_493; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_495 = _ctriSigs_deco_T_1423 ? 2'h2 : _ctriSigs_deco_T_494; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_496 = _ctriSigs_deco_T_1421 ? 2'h2 : _ctriSigs_deco_T_495; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_497 = _ctriSigs_deco_T_1419 ? 2'h2 : _ctriSigs_deco_T_496; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_498 = _ctriSigs_deco_T_1417 ? 2'h2 : _ctriSigs_deco_T_497; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_499 = _ctriSigs_deco_T_1415 ? 2'h2 : _ctriSigs_deco_T_498; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_500 = _ctriSigs_deco_T_1413 ? 2'h2 : _ctriSigs_deco_T_499; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_501 = _ctriSigs_deco_T_1411 ? 2'h2 : _ctriSigs_deco_T_500; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_502 = _ctriSigs_deco_T_1409 ? 2'h2 : _ctriSigs_deco_T_501; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_503 = _ctriSigs_deco_T_1407 ? 2'h3 : _ctriSigs_deco_T_502; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_504 = _ctriSigs_deco_T_1405 ? 2'h3 : _ctriSigs_deco_T_503; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_505 = _ctriSigs_deco_T_1403 ? 2'h3 : _ctriSigs_deco_T_504; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_506 = _ctriSigs_deco_T_1401 ? 2'h3 : _ctriSigs_deco_T_505; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_507 = _ctriSigs_deco_T_1399 ? 2'h3 : _ctriSigs_deco_T_506; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_508 = _ctriSigs_deco_T_1397 ? 2'h3 : _ctriSigs_deco_T_507; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_509 = _ctriSigs_deco_T_1395 ? 2'h2 : _ctriSigs_deco_T_508; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_510 = _ctriSigs_deco_T_1393 ? 3'h4 : {{1'd0}, _ctriSigs_deco_T_509}; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_511 = _ctriSigs_deco_T_1391 ? 3'h1 : _ctriSigs_deco_T_510; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_512 = _ctriSigs_deco_T_1389 ? 3'h1 : _ctriSigs_deco_T_511; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_513 = _ctriSigs_deco_T_1387 ? 3'h1 : _ctriSigs_deco_T_512; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_514 = _ctriSigs_deco_T_1385 ? 3'h1 : _ctriSigs_deco_T_513; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_515 = _ctriSigs_deco_T_1383 ? 3'h1 : _ctriSigs_deco_T_514; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_516 = _ctriSigs_deco_T_1381 ? 3'h1 : _ctriSigs_deco_T_515; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_517 = _ctriSigs_deco_T_1379 ? 3'h1 : _ctriSigs_deco_T_516; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_518 = _ctriSigs_deco_T_1377 ? 3'h1 : _ctriSigs_deco_T_517; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_519 = _ctriSigs_deco_T_1375 ? 3'h1 : _ctriSigs_deco_T_518; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_520 = _ctriSigs_deco_T_1373 ? 3'h1 : _ctriSigs_deco_T_519; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_521 = _ctriSigs_deco_T_1371 ? 3'h1 : _ctriSigs_deco_T_520; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_522 = _ctriSigs_deco_T_1369 ? 3'h1 : _ctriSigs_deco_T_521; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_523 = _ctriSigs_deco_T_1367 ? 3'h2 : _ctriSigs_deco_T_522; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_524 = _ctriSigs_deco_T_1365 ? 3'h2 : _ctriSigs_deco_T_523; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_525 = _ctriSigs_deco_T_1363 ? 3'h2 : _ctriSigs_deco_T_524; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_526 = _ctriSigs_deco_T_1361 ? 3'h2 : _ctriSigs_deco_T_525; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_527 = _ctriSigs_deco_T_1359 ? 3'h2 : _ctriSigs_deco_T_526; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_528 = _ctriSigs_deco_T_1357 ? 3'h2 : _ctriSigs_deco_T_527; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_529 = _ctriSigs_deco_T_1355 ? 3'h2 : _ctriSigs_deco_T_528; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_530 = _ctriSigs_deco_T_1353 ? 3'h2 : _ctriSigs_deco_T_529; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_531 = _ctriSigs_deco_T_1351 ? 3'h2 : _ctriSigs_deco_T_530; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_532 = _ctriSigs_deco_T_1349 ? 3'h2 : _ctriSigs_deco_T_531; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_533 = _ctriSigs_deco_T_1347 ? 3'h2 : _ctriSigs_deco_T_532; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_534 = _ctriSigs_deco_T_1345 ? 3'h2 : _ctriSigs_deco_T_533; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_535 = _ctriSigs_deco_T_1343 ? 3'h2 : _ctriSigs_deco_T_534; // @[Mux.scala 98:16]
  wire [2:0] ctriSigs_deco_3 = _ctriSigs_deco_T_1341 ? 3'h3 : _ctriSigs_deco_T_535; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_90 = _ctriSigs_deco_T_1429 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_91 = _ctriSigs_deco_T_1427 ? 2'h3 : _ctriSigs_deco_T_90; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_92 = _ctriSigs_deco_T_1425 ? 2'h3 : _ctriSigs_deco_T_91; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_93 = _ctriSigs_deco_T_1423 ? 2'h3 : _ctriSigs_deco_T_92; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_94 = _ctriSigs_deco_T_1421 ? 2'h1 : _ctriSigs_deco_T_93; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_95 = _ctriSigs_deco_T_1419 ? 2'h1 : _ctriSigs_deco_T_94; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_96 = _ctriSigs_deco_T_1417 ? 2'h1 : _ctriSigs_deco_T_95; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_97 = _ctriSigs_deco_T_1415 ? 2'h1 : _ctriSigs_deco_T_96; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_98 = _ctriSigs_deco_T_1413 ? 2'h1 : _ctriSigs_deco_T_97; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_99 = _ctriSigs_deco_T_1411 ? 2'h1 : _ctriSigs_deco_T_98; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_100 = _ctriSigs_deco_T_1409 ? 2'h1 : _ctriSigs_deco_T_99; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_101 = _ctriSigs_deco_T_1407 ? 2'h2 : _ctriSigs_deco_T_100; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_102 = _ctriSigs_deco_T_1405 ? 2'h2 : _ctriSigs_deco_T_101; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_103 = _ctriSigs_deco_T_1403 ? 2'h2 : _ctriSigs_deco_T_102; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_104 = _ctriSigs_deco_T_1401 ? 2'h2 : _ctriSigs_deco_T_103; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_105 = _ctriSigs_deco_T_1399 ? 2'h2 : _ctriSigs_deco_T_104; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_106 = _ctriSigs_deco_T_1397 ? 2'h2 : _ctriSigs_deco_T_105; // @[Mux.scala 98:16]
  wire [1:0] _ctriSigs_deco_T_107 = _ctriSigs_deco_T_1395 ? 2'h1 : _ctriSigs_deco_T_106; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_108 = _ctriSigs_deco_T_1393 ? 3'h4 : {{1'd0}, _ctriSigs_deco_T_107}; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_109 = _ctriSigs_deco_T_1391 ? 3'h7 : _ctriSigs_deco_T_108; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_110 = _ctriSigs_deco_T_1389 ? 3'h7 : _ctriSigs_deco_T_109; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_111 = _ctriSigs_deco_T_1387 ? 3'h7 : _ctriSigs_deco_T_110; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_112 = _ctriSigs_deco_T_1385 ? 3'h7 : _ctriSigs_deco_T_111; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_113 = _ctriSigs_deco_T_1383 ? 3'h7 : _ctriSigs_deco_T_112; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_114 = _ctriSigs_deco_T_1381 ? 3'h7 : _ctriSigs_deco_T_113; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_115 = _ctriSigs_deco_T_1379 ? 3'h7 : _ctriSigs_deco_T_114; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_116 = _ctriSigs_deco_T_1377 ? 3'h7 : _ctriSigs_deco_T_115; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_117 = _ctriSigs_deco_T_1375 ? 3'h7 : _ctriSigs_deco_T_116; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_118 = _ctriSigs_deco_T_1373 ? 3'h7 : _ctriSigs_deco_T_117; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_119 = _ctriSigs_deco_T_1371 ? 3'h7 : _ctriSigs_deco_T_118; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_120 = _ctriSigs_deco_T_1369 ? 3'h7 : _ctriSigs_deco_T_119; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_121 = _ctriSigs_deco_T_1367 ? 3'h1 : _ctriSigs_deco_T_120; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_122 = _ctriSigs_deco_T_1365 ? 3'h1 : _ctriSigs_deco_T_121; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_123 = _ctriSigs_deco_T_1363 ? 3'h1 : _ctriSigs_deco_T_122; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_124 = _ctriSigs_deco_T_1361 ? 3'h1 : _ctriSigs_deco_T_123; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_125 = _ctriSigs_deco_T_1359 ? 3'h1 : _ctriSigs_deco_T_124; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_126 = _ctriSigs_deco_T_1357 ? 3'h1 : _ctriSigs_deco_T_125; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_127 = _ctriSigs_deco_T_1355 ? 3'h1 : _ctriSigs_deco_T_126; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_128 = _ctriSigs_deco_T_1353 ? 3'h1 : _ctriSigs_deco_T_127; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_129 = _ctriSigs_deco_T_1351 ? 3'h1 : _ctriSigs_deco_T_128; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_130 = _ctriSigs_deco_T_1349 ? 3'h1 : _ctriSigs_deco_T_129; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_131 = _ctriSigs_deco_T_1347 ? 3'h1 : _ctriSigs_deco_T_130; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_132 = _ctriSigs_deco_T_1345 ? 3'h1 : _ctriSigs_deco_T_131; // @[Mux.scala 98:16]
  wire [2:0] _ctriSigs_deco_T_133 = _ctriSigs_deco_T_1343 ? 3'h5 : _ctriSigs_deco_T_132; // @[Mux.scala 98:16]
  wire [2:0] ctriSigs_deco_0 = _ctriSigs_deco_T_1341 ? 3'h5 : _ctriSigs_deco_T_133; // @[Mux.scala 98:16]
  wire [31:0] ctriSigs_instTy = {{29'd0}, ctriSigs_deco_0}; // @[Core.scala 104:22 Decoder.scala 91:39]
  wire  _imm_sigBit_T = ctriSigs_instTy == 32'h6; // @[Decoder.scala 151:38]
  wire  imm_sigBit = ctriSigs_instTy == 32'h6 ? 1'h0 : If2IdInst[31]; // @[Decoder.scala 151:29]
  wire [32:0] imm_hi_hi_hi = imm_sigBit ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 72:12]
  wire  _imm_b30_20_T = ctriSigs_instTy == 32'h5; // @[Decoder.scala 152:38]
  wire [10:0] _imm_b30_20_T_3 = imm_sigBit ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [10:0] imm_hi_hi_lo = ctriSigs_instTy == 32'h5 ? If2IdInst[30:20] : _imm_b30_20_T_3; // @[Decoder.scala 152:29]
  wire [7:0] _imm_b19_12_T_4 = imm_sigBit ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] imm_hi_lo_hi = ctriSigs_instTy != 32'h5 & ctriSigs_instTy != 32'h4 ? _imm_b19_12_T_4 : If2IdInst[19:12]; // @[Decoder.scala 153:29]
  wire  _imm_b11_T = ctriSigs_instTy == 32'h2; // @[Decoder.scala 154:38]
  wire  _imm_b11_T_6 = _imm_b30_20_T | _imm_sigBit_T; // @[Decoder.scala 156:46]
  wire  _imm_b11_T_7 = _imm_b30_20_T | _imm_sigBit_T ? 1'h0 : imm_sigBit; // @[Decoder.scala 156:31]
  wire  _imm_b11_T_8 = ctriSigs_instTy == 32'h4 ? If2IdInst[20] : _imm_b11_T_7; // @[Decoder.scala 155:31]
  wire  imm_hi_lo_lo = ctriSigs_instTy == 32'h2 ? If2IdInst[7] : _imm_b11_T_8; // @[Decoder.scala 154:29]
  wire [5:0] imm_lo_hi_hi = _imm_b11_T_6 ? 6'h0 : If2IdInst[30:25]; // @[Decoder.scala 157:29]
  wire  _imm_b4_1_T_1 = ctriSigs_instTy == 32'h3; // @[Decoder.scala 159:39]
  wire [3:0] _imm_b4_1_T_8 = _imm_sigBit_T ? If2IdInst[19:16] : If2IdInst[24:21]; // @[Decoder.scala 160:30]
  wire [3:0] _imm_b4_1_T_9 = ctriSigs_instTy == 32'h3 | _imm_b11_T ? If2IdInst[11:8] : _imm_b4_1_T_8; // @[Decoder.scala 159:30]
  wire [3:0] imm_lo_hi_lo = _imm_b30_20_T ? 4'h0 : _imm_b4_1_T_9; // @[Decoder.scala 158:29]
  wire  _imm_b0_T_6 = _imm_sigBit_T & If2IdInst[15]; // @[Decoder.scala 163:31]
  wire  _imm_b0_T_7 = ctriSigs_instTy == 32'h1 ? If2IdInst[20] : _imm_b0_T_6; // @[Decoder.scala 162:31]
  wire  imm_lo_lo = _imm_b4_1_T_1 ? If2IdInst[7] : _imm_b0_T_7; // @[Decoder.scala 161:29]
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
  wire  branchBus_flag = _branchBus_flag_T_23 | _ctriSigs_deco_T_1395 | _ctriSigs_deco_T_1393; // @[Core.scala 145:45]
  wire [63:0] jump_target = _opVec_0_T + _opVec_1_T_1; // @[Core.scala 143:37]
  wire [63:0] _branchBus_target_T_3 = jump_target & 64'hfffffffffffffffe; // @[Core.scala 147:41]
  wire [63:0] _branchBus_target_T_6 = If2IdPc + _opVec_1_T_1; // @[Core.scala 147:75]
  wire [63:0] branchBus_target = _ctriSigs_deco_T_1395 ? _branchBus_target_T_3 : _branchBus_target_T_6; // @[Core.scala 146:26]
  reg  exCtrlSigs_memcen; // @[Core.scala 157:28]
  reg [3:0] exCtrlSigs_memwen; // @[Core.scala 157:28]
  wire  load_stall = exCtrlSigs_memcen & exCtrlSigs_memwen == 4'h0; // @[Decoder.scala 214:24]
  wire  hd_1_ready = ~load_stall; // @[Core.scala 81:22]
  wire  hd_1_valid = ~branchBus_flag; // @[Core.scala 82:22]
  wire  _T_3 = ~hd_1_ready; // @[Core.scala 91:15]
  wire  _ctriSigs_deco_T_242 = _ctriSigs_deco_T_1393 | (_ctriSigs_deco_T_1395 | (_ctriSigs_deco_T_1397 | (
    _ctriSigs_deco_T_1399 | (_ctriSigs_deco_T_1401 | (_ctriSigs_deco_T_1403 | (_ctriSigs_deco_T_1405 | (
    _ctriSigs_deco_T_1407 | (_ctriSigs_deco_T_1409 | (_ctriSigs_deco_T_1411 | (_ctriSigs_deco_T_1413 | (
    _ctriSigs_deco_T_1415 | (_ctriSigs_deco_T_1417 | (_ctriSigs_deco_T_1419 | (_ctriSigs_deco_T_1421 | (
    _ctriSigs_deco_T_1423 | (_ctriSigs_deco_T_1425 | (_ctriSigs_deco_T_1427 | _ctriSigs_deco_T_1429))))))))))))))))); // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_243 = _ctriSigs_deco_T_1391 ? 4'hf : {{3'd0}, _ctriSigs_deco_T_242}; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_244 = _ctriSigs_deco_T_1389 ? 4'hc : _ctriSigs_deco_T_243; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_245 = _ctriSigs_deco_T_1387 ? 4'he : _ctriSigs_deco_T_244; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_246 = _ctriSigs_deco_T_1385 ? 4'hb : _ctriSigs_deco_T_245; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_247 = _ctriSigs_deco_T_1383 ? 4'hd : _ctriSigs_deco_T_246; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_248 = _ctriSigs_deco_T_1381 ? 4'ha : _ctriSigs_deco_T_247; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_249 = _ctriSigs_deco_T_1379 ? 4'h6 : _ctriSigs_deco_T_248; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_250 = _ctriSigs_deco_T_1377 ? 4'h3 : _ctriSigs_deco_T_249; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_251 = _ctriSigs_deco_T_1375 ? 4'h5 : _ctriSigs_deco_T_250; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_252 = _ctriSigs_deco_T_1373 ? 4'h2 : _ctriSigs_deco_T_251; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_253 = _ctriSigs_deco_T_1371 ? 4'h4 : _ctriSigs_deco_T_252; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_254 = _ctriSigs_deco_T_1369 ? 4'h1 : _ctriSigs_deco_T_253; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_255 = _ctriSigs_deco_T_1367 ? 4'hf : _ctriSigs_deco_T_254; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_256 = _ctriSigs_deco_T_1365 ? 4'hc : _ctriSigs_deco_T_255; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_257 = _ctriSigs_deco_T_1363 ? 4'he : _ctriSigs_deco_T_256; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_258 = _ctriSigs_deco_T_1361 ? 4'hb : _ctriSigs_deco_T_257; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_259 = _ctriSigs_deco_T_1359 ? 4'hd : _ctriSigs_deco_T_258; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_260 = _ctriSigs_deco_T_1357 ? 4'ha : _ctriSigs_deco_T_259; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_261 = _ctriSigs_deco_T_1355 ? 4'h1 : _ctriSigs_deco_T_260; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_262 = _ctriSigs_deco_T_1353 ? 4'h8 : _ctriSigs_deco_T_261; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_263 = _ctriSigs_deco_T_1351 ? 4'h6 : _ctriSigs_deco_T_262; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_264 = _ctriSigs_deco_T_1349 ? 4'h3 : _ctriSigs_deco_T_263; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_265 = _ctriSigs_deco_T_1347 ? 4'h4 : _ctriSigs_deco_T_264; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_266 = _ctriSigs_deco_T_1345 ? 4'h1 : _ctriSigs_deco_T_265; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_267 = _ctriSigs_deco_T_1343 ? 4'h1 : _ctriSigs_deco_T_266; // @[Mux.scala 98:16]
  wire [3:0] ctriSigs_deco_1 = _ctriSigs_deco_T_1341 ? 4'h1 : _ctriSigs_deco_T_267; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_637 = _ctriSigs_deco_T_1407 ? 1'h0 : _ctriSigs_deco_T_1409 | (_ctriSigs_deco_T_1411 | (
    _ctriSigs_deco_T_1413 | (_ctriSigs_deco_T_1415 | (_ctriSigs_deco_T_1417 | (_ctriSigs_deco_T_1419 | (
    _ctriSigs_deco_T_1421 | (_ctriSigs_deco_T_1423 | (_ctriSigs_deco_T_1425 | (_ctriSigs_deco_T_1427 |
    _ctriSigs_deco_T_1429))))))))); // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_638 = _ctriSigs_deco_T_1405 ? 1'h0 : _ctriSigs_deco_T_637; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_639 = _ctriSigs_deco_T_1403 ? 1'h0 : _ctriSigs_deco_T_638; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_640 = _ctriSigs_deco_T_1401 ? 1'h0 : _ctriSigs_deco_T_639; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_641 = _ctriSigs_deco_T_1399 ? 1'h0 : _ctriSigs_deco_T_640; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_642 = _ctriSigs_deco_T_1397 ? 1'h0 : _ctriSigs_deco_T_641; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_643 = _ctriSigs_deco_T_1395 ? 1'h0 : _ctriSigs_deco_T_642; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_644 = _ctriSigs_deco_T_1393 ? 1'h0 : _ctriSigs_deco_T_643; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_645 = _ctriSigs_deco_T_1391 ? 1'h0 : _ctriSigs_deco_T_644; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_646 = _ctriSigs_deco_T_1389 ? 1'h0 : _ctriSigs_deco_T_645; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_647 = _ctriSigs_deco_T_1387 ? 1'h0 : _ctriSigs_deco_T_646; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_648 = _ctriSigs_deco_T_1385 ? 1'h0 : _ctriSigs_deco_T_647; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_649 = _ctriSigs_deco_T_1383 ? 1'h0 : _ctriSigs_deco_T_648; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_650 = _ctriSigs_deco_T_1381 ? 1'h0 : _ctriSigs_deco_T_649; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_651 = _ctriSigs_deco_T_1379 ? 1'h0 : _ctriSigs_deco_T_650; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_652 = _ctriSigs_deco_T_1377 ? 1'h0 : _ctriSigs_deco_T_651; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_653 = _ctriSigs_deco_T_1375 ? 1'h0 : _ctriSigs_deco_T_652; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_654 = _ctriSigs_deco_T_1373 ? 1'h0 : _ctriSigs_deco_T_653; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_655 = _ctriSigs_deco_T_1371 ? 1'h0 : _ctriSigs_deco_T_654; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_656 = _ctriSigs_deco_T_1369 ? 1'h0 : _ctriSigs_deco_T_655; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_657 = _ctriSigs_deco_T_1367 ? 1'h0 : _ctriSigs_deco_T_656; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_658 = _ctriSigs_deco_T_1365 ? 1'h0 : _ctriSigs_deco_T_657; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_659 = _ctriSigs_deco_T_1363 ? 1'h0 : _ctriSigs_deco_T_658; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_660 = _ctriSigs_deco_T_1361 ? 1'h0 : _ctriSigs_deco_T_659; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_661 = _ctriSigs_deco_T_1359 ? 1'h0 : _ctriSigs_deco_T_660; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_662 = _ctriSigs_deco_T_1357 ? 1'h0 : _ctriSigs_deco_T_661; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_663 = _ctriSigs_deco_T_1355 ? 1'h0 : _ctriSigs_deco_T_662; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_664 = _ctriSigs_deco_T_1353 ? 1'h0 : _ctriSigs_deco_T_663; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_665 = _ctriSigs_deco_T_1351 ? 1'h0 : _ctriSigs_deco_T_664; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_666 = _ctriSigs_deco_T_1349 ? 1'h0 : _ctriSigs_deco_T_665; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_667 = _ctriSigs_deco_T_1347 ? 1'h0 : _ctriSigs_deco_T_666; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_668 = _ctriSigs_deco_T_1345 ? 1'h0 : _ctriSigs_deco_T_667; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_760 = _ctriSigs_deco_T_1429 ? 4'h8 : 4'h0; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_761 = _ctriSigs_deco_T_1427 ? 4'h4 : _ctriSigs_deco_T_760; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_762 = _ctriSigs_deco_T_1425 ? 4'h2 : _ctriSigs_deco_T_761; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_763 = _ctriSigs_deco_T_1423 ? 4'h1 : _ctriSigs_deco_T_762; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_764 = _ctriSigs_deco_T_1421 ? 4'h0 : _ctriSigs_deco_T_763; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_765 = _ctriSigs_deco_T_1419 ? 4'h0 : _ctriSigs_deco_T_764; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_766 = _ctriSigs_deco_T_1417 ? 4'h0 : _ctriSigs_deco_T_765; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_767 = _ctriSigs_deco_T_1415 ? 4'h0 : _ctriSigs_deco_T_766; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_768 = _ctriSigs_deco_T_1413 ? 4'h0 : _ctriSigs_deco_T_767; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_769 = _ctriSigs_deco_T_1411 ? 4'h0 : _ctriSigs_deco_T_768; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_770 = _ctriSigs_deco_T_1409 ? 4'h0 : _ctriSigs_deco_T_769; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_771 = _ctriSigs_deco_T_1407 ? 4'h0 : _ctriSigs_deco_T_770; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_772 = _ctriSigs_deco_T_1405 ? 4'h0 : _ctriSigs_deco_T_771; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_773 = _ctriSigs_deco_T_1403 ? 4'h0 : _ctriSigs_deco_T_772; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_774 = _ctriSigs_deco_T_1401 ? 4'h0 : _ctriSigs_deco_T_773; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_775 = _ctriSigs_deco_T_1399 ? 4'h0 : _ctriSigs_deco_T_774; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_776 = _ctriSigs_deco_T_1397 ? 4'h0 : _ctriSigs_deco_T_775; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_777 = _ctriSigs_deco_T_1395 ? 4'h0 : _ctriSigs_deco_T_776; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_778 = _ctriSigs_deco_T_1393 ? 4'h0 : _ctriSigs_deco_T_777; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_779 = _ctriSigs_deco_T_1391 ? 4'h0 : _ctriSigs_deco_T_778; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_780 = _ctriSigs_deco_T_1389 ? 4'h0 : _ctriSigs_deco_T_779; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_781 = _ctriSigs_deco_T_1387 ? 4'h0 : _ctriSigs_deco_T_780; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_782 = _ctriSigs_deco_T_1385 ? 4'h0 : _ctriSigs_deco_T_781; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_783 = _ctriSigs_deco_T_1383 ? 4'h0 : _ctriSigs_deco_T_782; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_784 = _ctriSigs_deco_T_1381 ? 4'h0 : _ctriSigs_deco_T_783; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_785 = _ctriSigs_deco_T_1379 ? 4'h0 : _ctriSigs_deco_T_784; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_786 = _ctriSigs_deco_T_1377 ? 4'h0 : _ctriSigs_deco_T_785; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_787 = _ctriSigs_deco_T_1375 ? 4'h0 : _ctriSigs_deco_T_786; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_788 = _ctriSigs_deco_T_1373 ? 4'h0 : _ctriSigs_deco_T_787; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_789 = _ctriSigs_deco_T_1371 ? 4'h0 : _ctriSigs_deco_T_788; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_790 = _ctriSigs_deco_T_1369 ? 4'h0 : _ctriSigs_deco_T_789; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_791 = _ctriSigs_deco_T_1367 ? 4'h0 : _ctriSigs_deco_T_790; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_792 = _ctriSigs_deco_T_1365 ? 4'h0 : _ctriSigs_deco_T_791; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_793 = _ctriSigs_deco_T_1363 ? 4'h0 : _ctriSigs_deco_T_792; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_794 = _ctriSigs_deco_T_1361 ? 4'h0 : _ctriSigs_deco_T_793; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_795 = _ctriSigs_deco_T_1359 ? 4'h0 : _ctriSigs_deco_T_794; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_796 = _ctriSigs_deco_T_1357 ? 4'h0 : _ctriSigs_deco_T_795; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_797 = _ctriSigs_deco_T_1355 ? 4'h0 : _ctriSigs_deco_T_796; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_798 = _ctriSigs_deco_T_1353 ? 4'h0 : _ctriSigs_deco_T_797; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_799 = _ctriSigs_deco_T_1351 ? 4'h0 : _ctriSigs_deco_T_798; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_800 = _ctriSigs_deco_T_1349 ? 4'h0 : _ctriSigs_deco_T_799; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_801 = _ctriSigs_deco_T_1347 ? 4'h0 : _ctriSigs_deco_T_800; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_802 = _ctriSigs_deco_T_1345 ? 4'h0 : _ctriSigs_deco_T_801; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_905 = _ctriSigs_deco_T_1407 ? 1'h0 : _ctriSigs_deco_T_1409 | (_ctriSigs_deco_T_1411 | (
    _ctriSigs_deco_T_1413 | (_ctriSigs_deco_T_1415 | (_ctriSigs_deco_T_1417 | (_ctriSigs_deco_T_1419 |
    _ctriSigs_deco_T_1421))))); // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_906 = _ctriSigs_deco_T_1405 ? 1'h0 : _ctriSigs_deco_T_905; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_907 = _ctriSigs_deco_T_1403 ? 1'h0 : _ctriSigs_deco_T_906; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_908 = _ctriSigs_deco_T_1401 ? 1'h0 : _ctriSigs_deco_T_907; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_909 = _ctriSigs_deco_T_1399 ? 1'h0 : _ctriSigs_deco_T_908; // @[Mux.scala 98:16]
  wire  _ctriSigs_deco_T_910 = _ctriSigs_deco_T_1397 ? 1'h0 : _ctriSigs_deco_T_909; // @[Mux.scala 98:16]
  wire  ctriSigs_deco_6 = _ctriSigs_deco_T_1341 | (_ctriSigs_deco_T_1343 | (_ctriSigs_deco_T_1345 | (
    _ctriSigs_deco_T_1347 | (_ctriSigs_deco_T_1349 | (_ctriSigs_deco_T_1351 | (_ctriSigs_deco_T_1353 | (
    _ctriSigs_deco_T_1355 | (_ctriSigs_deco_T_1357 | (_ctriSigs_deco_T_1359 | (_ctriSigs_deco_T_1361 | (
    _ctriSigs_deco_T_1363 | (_ctriSigs_deco_T_1365 | (_ctriSigs_deco_T_1367 | (_ctriSigs_deco_T_1369 | (
    _ctriSigs_deco_T_1371 | (_ctriSigs_deco_T_1373 | (_ctriSigs_deco_T_1375 | (_ctriSigs_deco_T_1377 | (
    _ctriSigs_deco_T_1379 | (_ctriSigs_deco_T_1381 | (_ctriSigs_deco_T_1383 | (_ctriSigs_deco_T_1385 | (
    _ctriSigs_deco_T_1387 | (_ctriSigs_deco_T_1389 | (_ctriSigs_deco_T_1391 | (_ctriSigs_deco_T_1393 | (
    _ctriSigs_deco_T_1395 | _ctriSigs_deco_T_910))))))))))))))))))))))))))); // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1032 = _ctriSigs_deco_T_1421 ? 4'h8 : 4'h0; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1033 = _ctriSigs_deco_T_1419 ? 4'h7 : _ctriSigs_deco_T_1032; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1034 = _ctriSigs_deco_T_1417 ? 4'h6 : _ctriSigs_deco_T_1033; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1035 = _ctriSigs_deco_T_1415 ? 4'h5 : _ctriSigs_deco_T_1034; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1036 = _ctriSigs_deco_T_1413 ? 4'h4 : _ctriSigs_deco_T_1035; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1037 = _ctriSigs_deco_T_1411 ? 4'h3 : _ctriSigs_deco_T_1036; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1038 = _ctriSigs_deco_T_1409 ? 4'h2 : _ctriSigs_deco_T_1037; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1039 = _ctriSigs_deco_T_1407 ? 4'h0 : _ctriSigs_deco_T_1038; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1040 = _ctriSigs_deco_T_1405 ? 4'h0 : _ctriSigs_deco_T_1039; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1041 = _ctriSigs_deco_T_1403 ? 4'h0 : _ctriSigs_deco_T_1040; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1042 = _ctriSigs_deco_T_1401 ? 4'h0 : _ctriSigs_deco_T_1041; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1043 = _ctriSigs_deco_T_1399 ? 4'h0 : _ctriSigs_deco_T_1042; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1044 = _ctriSigs_deco_T_1397 ? 4'h0 : _ctriSigs_deco_T_1043; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1045 = _ctriSigs_deco_T_1395 ? 4'h1 : _ctriSigs_deco_T_1044; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1046 = _ctriSigs_deco_T_1393 ? 4'h1 : _ctriSigs_deco_T_1045; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1047 = _ctriSigs_deco_T_1391 ? 4'h1 : _ctriSigs_deco_T_1046; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1048 = _ctriSigs_deco_T_1389 ? 4'h1 : _ctriSigs_deco_T_1047; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1049 = _ctriSigs_deco_T_1387 ? 4'h1 : _ctriSigs_deco_T_1048; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1050 = _ctriSigs_deco_T_1385 ? 4'h1 : _ctriSigs_deco_T_1049; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1051 = _ctriSigs_deco_T_1383 ? 4'h1 : _ctriSigs_deco_T_1050; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1052 = _ctriSigs_deco_T_1381 ? 4'h1 : _ctriSigs_deco_T_1051; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1053 = _ctriSigs_deco_T_1379 ? 4'h1 : _ctriSigs_deco_T_1052; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1054 = _ctriSigs_deco_T_1377 ? 4'h1 : _ctriSigs_deco_T_1053; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1055 = _ctriSigs_deco_T_1375 ? 4'h1 : _ctriSigs_deco_T_1054; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1056 = _ctriSigs_deco_T_1373 ? 4'h1 : _ctriSigs_deco_T_1055; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1057 = _ctriSigs_deco_T_1371 ? 4'h1 : _ctriSigs_deco_T_1056; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1058 = _ctriSigs_deco_T_1369 ? 4'h1 : _ctriSigs_deco_T_1057; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1059 = _ctriSigs_deco_T_1367 ? 4'h1 : _ctriSigs_deco_T_1058; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1060 = _ctriSigs_deco_T_1365 ? 4'h1 : _ctriSigs_deco_T_1059; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1061 = _ctriSigs_deco_T_1363 ? 4'h1 : _ctriSigs_deco_T_1060; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1062 = _ctriSigs_deco_T_1361 ? 4'h1 : _ctriSigs_deco_T_1061; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1063 = _ctriSigs_deco_T_1359 ? 4'h1 : _ctriSigs_deco_T_1062; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1064 = _ctriSigs_deco_T_1357 ? 4'h1 : _ctriSigs_deco_T_1063; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1065 = _ctriSigs_deco_T_1355 ? 4'h1 : _ctriSigs_deco_T_1064; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1066 = _ctriSigs_deco_T_1353 ? 4'h1 : _ctriSigs_deco_T_1065; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1067 = _ctriSigs_deco_T_1351 ? 4'h1 : _ctriSigs_deco_T_1066; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1068 = _ctriSigs_deco_T_1349 ? 4'h1 : _ctriSigs_deco_T_1067; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1069 = _ctriSigs_deco_T_1347 ? 4'h1 : _ctriSigs_deco_T_1068; // @[Mux.scala 98:16]
  wire [3:0] _ctriSigs_deco_T_1070 = _ctriSigs_deco_T_1345 ? 4'h1 : _ctriSigs_deco_T_1069; // @[Mux.scala 98:16]
  reg [6:0] exCtrlSigs_excTy; // @[Core.scala 157:28]
  reg [3:0] exCtrlSigs_wbdSel; // @[Core.scala 157:28]
  reg [63:0] exOpVec_0; // @[Core.scala 158:28]
  reg [63:0] exOpVec_1; // @[Core.scala 158:28]
  reg [63:0] exPc; // @[Core.scala 159:28]
  reg [31:0] exInst; // @[Core.scala 160:28]
  reg [63:0] exStoreData; // @[Core.scala 162:28]
  wire  _GEN_10 = _T_3 | ctriSigs_deco_6; // @[Core.scala 170:31 Core.scala 171:17 Core.scala 178:17]
  wire [6:0] ctriSigs_excTy = {{3'd0}, ctriSigs_deco_1}; // @[Core.scala 104:22 Decoder.scala 91:39]
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
    end else if (_ctriSigs_deco_T_1341) begin // @[Mux.scala 98:16]
      exCtrlSigs_memcen <= 1'h0;
    end else if (_ctriSigs_deco_T_1343) begin // @[Mux.scala 98:16]
      exCtrlSigs_memcen <= 1'h0;
    end else begin
      exCtrlSigs_memcen <= _ctriSigs_deco_T_668;
    end
    if (reset) begin // @[Core.scala 157:28]
      exCtrlSigs_memwen <= 4'h0; // @[Core.scala 157:28]
    end else if (_T_3) begin // @[Core.scala 170:31]
      exCtrlSigs_memwen <= 4'h0; // @[Core.scala 171:17]
    end else if (_ctriSigs_deco_T_1341) begin // @[Mux.scala 98:16]
      exCtrlSigs_memwen <= 4'h0;
    end else if (_ctriSigs_deco_T_1343) begin // @[Mux.scala 98:16]
      exCtrlSigs_memwen <= 4'h0;
    end else begin
      exCtrlSigs_memwen <= _ctriSigs_deco_T_802;
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
    end else if (_ctriSigs_deco_T_1341) begin // @[Mux.scala 98:16]
      exCtrlSigs_wbdSel <= 4'h1;
    end else if (_ctriSigs_deco_T_1343) begin // @[Mux.scala 98:16]
      exCtrlSigs_wbdSel <= 4'h1;
    end else begin
      exCtrlSigs_wbdSel <= _ctriSigs_deco_T_1070;
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
