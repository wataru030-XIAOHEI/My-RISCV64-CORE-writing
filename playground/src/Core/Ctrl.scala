//package Core
//
//import chisel3._
//import chisel3.util._
//import constant.Consts._
//
//
//class Ctrl{
//
//  val DEFAULT_DATA :UInt = 0.U(DWORD_LEN.W)
//  def wb_data_mux(wb_sel:UInt,alu_out:UInt,
//                  pc_plus4:UInt,mem_d:UInt) :UInt = {
//    MuxLookup(wb_sel,DEFAULT_DATA,Seq(
//    WB_ALU      ->      alu_out ,
//    WB_PC       ->      pc_plus4,
//    WB_LOAD     ->      mem_d
//    ))
//  }
//  // alu_out_mux
//  def alu_out_mux(exec_fun:UInt,op1:UInt,op2:UInt):UInt = {
//    MuxLookup(exec_fun ,DEFAULT_DATA,Seq(
//    ALU_ADD   -> ( op1 + op2 ),
//    ALU_SUB   -> ( op1 - op2 ),
//    ALU_AND   -> ( op1 & op2 ),
//    ALU_OR    -> ( op1 | op2 ),
//    ALU_JALR  -> (( op1 + op2 ) & (~1.U(DWORD_LEN.W))),
//    ALU_XOR   -> ( op1 ^ op2 )
//    ))
//  }
//  // branch_flag_gen
//  def branch_flag_gen(exec_fun:UInt,default:Bool,
//    op1:UInt,op2:UInt):Bits = {
//    MuxLookup(exec_fun , default , Seq(
//      BR_BEQ    ->    (op1 === op2),
//      BR_BNE    ->    (op1 =/= op2),
//      BR_BLT    ->    (op1.asSInt()     <  op2.asSInt()),
//      BR_BGE    ->    (~(op1.asSInt()   <  op2.asSInt())),
//      BR_BGEU   ->    (~(op1.asUInt()   <  op2.asUInt())),
//      BR_BLTU   ->    (op1.asUInt()     <  op2.asUInt())
//    ))
//  }
//}