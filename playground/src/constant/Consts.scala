package constant


import chisel3._
import chisel3.util._
import constant.Inst._


//RV64------ I / M
object Consts {
  val DWORD_LEN     = 64
  val WORD_LEN      = 32
  val INST_LEN      = 32

  val PC_RST_VALUE  = "h0000_0000_8000_0000".U(DWORD_LEN.W)
  val NOP           = "h0000_0013".U(INST_LEN.W)
  val UNIMP         = "hc000_1073".U(INST_LEN.W)

  val ADDR_LEN      = log2Ceil(32)
  val CSR_ADDR_LEN  = 12

  val EXE_SEL_LEN = log2Ceil(32)

  val ALU_X       = 0.U(EXE_SEL_LEN.W)
  val ALU_ADD     = 1.U(EXE_SEL_LEN.W)
  val ALU_SUB     = 2.U(EXE_SEL_LEN.W)
  val ALU_AND     = 3.U(EXE_SEL_LEN.W)
  val ALU_OR      = 4.U(EXE_SEL_LEN.W)
  val ALU_XOR     = 5.U(EXE_SEL_LEN.W)
  val ALU_SLL     = 6.U(EXE_SEL_LEN.W)
  val ALU_SRL     = 7.U(EXE_SEL_LEN.W)
  val ALU_SRA     = 8.U(EXE_SEL_LEN.W)
  val ALU_SLT     = 9.U(EXE_SEL_LEN.W)
  val ALU_SLTU    = 10.U(EXE_SEL_LEN.W)

  val BR_BEQ      = 11.U(EXE_SEL_LEN.W)
  val BR_BNE      = 12.U(EXE_SEL_LEN.W)
  val BR_BLT      = 13.U(EXE_SEL_LEN.W)
  val BR_BGE      = 14.U(EXE_SEL_LEN.W)
  val BR_BLTU     = 15.U(EXE_SEL_LEN.W)
  val BR_BGEU     = 16.U(EXE_SEL_LEN.W)

  val ALU_JALR    = 17.U(EXE_SEL_LEN.W)

  val ALU_MUL     = 18.U(EXE_SEL_LEN.W)
  val ALU_MULH    = 19.U(EXE_SEL_LEN.W)
  val ALU_MULHSU  = 20.U(EXE_SEL_LEN.W)
  val ALU_MULHU   = 21.U(EXE_SEL_LEN.W)
  val ALU_MULW    = 22.U(EXE_SEL_LEN.W)

  val ALU_DIV     = 23.U(EXE_SEL_LEN.W)
  val ALU_DIVW    = 24.U(EXE_SEL_LEN.W)
  val ALU_REM     = 25.U(EXE_SEL_LEN.W)
  val ALU_REMW    = 26.U(EXE_SEL_LEN.W)

  //-----EXU INST OVER--------

  //----OP SRC ----------------
  val OP1_LEN   = log2Ceil(4)
  val OP1_SRC1  = 0.U(OP1_LEN.W)
  val OP1_PC    = 1.U(OP1_LEN.W)
  val OP1_X     = 2.U(OP1_LEN.W)
  val OP1_IMM   =  3.U(OP1_LEN.W)//ZERO EXTEND

  val OP2_LEN   = log2Ceil(8)
  val OP2_X     = 0.U(OP2_LEN.W)
  val OP2_SRC2   = 1.U(OP2_LEN.W)
  val OP2_IMMI  = 2.U(OP2_LEN.W)
  val OP2_IMMS  = 3.U(OP2_LEN.W)
  val OP2_IMMU  = 4.U(OP2_LEN.W)
  val OP2_IMMJ  = 5.U(OP2_LEN.W)

  //是否写回到mem
  val MEM_X   = false.B
  val MEM_EN   = true.B

  //是否写回到通用寄存器 Rf_wEN
  val REG_WEN_X   = false.B
  val REG_WEN  =  true.B

  //写回的数据类型
  val WB_LEN  = log2Ceil(3)
  val WB_X   = 0.U(WB_LEN.W)
  val WB_ALU = 1.U(WB_LEN.W)
  val WB_PC  = 2.U(WB_LEN.W)
  val WB_LOAD = 3.U(WB_LEN.W)

  /**
   * @param inst 输入的指令，32位宽度
   * @return ctrl_signal_array 返回控制信号阵列
   */
  //指令查询表默认值
  val DEFAULT =   List(ALU_X,OP1_X,OP2_X,MEM_X,REG_WEN_X,WB_X)
  //指令查询表

  /**
   *
   * @param inst 指令
   * @return 根据指令类型来返回相对应的数据控制信号
   */
  def CTRL_BUS_LOOKUP_TABLE(inst:UInt) = ListLookup(inst,DEFAULT,Array(
    ADDI    ->    List(ALU_ADD, OP1_SRC1, OP2_IMMI,MEM_X, REG_WEN,   WB_ALU),
    ADD     ->    List(ALU_ADD, OP1_SRC1, OP2_SRC2,MEM_X, REG_WEN,   WB_ALU),
    SUB     ->    List(ALU_SUB, OP1_SRC1, OP2_SRC2,MEM_X, REG_WEN,   WB_ALU),
    LUI     ->    List(ALU_ADD, OP1_X,    OP2_IMMU,MEM_X, REG_WEN,   WB_ALU),
    JAL     ->    List(ALU_ADD, OP1_PC,   OP2_IMMJ,MEM_X, REG_WEN,   WB_PC),
    JALR    ->    List(ALU_JALR,OP1_SRC1, OP2_IMMI,MEM_X, REG_WEN,   WB_PC),
    AUIPC   ->    List(ALU_ADD, OP1_PC,   OP2_IMMU,MEM_X, REG_WEN,   WB_ALU),
    SD      ->    List(ALU_ADD, OP1_SRC1, OP2_IMMS,MEM_EN,REG_WEN_X, WB_X),

    BEQ     ->    List(BR_BEQ,OP1_SRC1,OP2_SRC2,MEM_X,REG_WEN_X,WB_X)
  ))
}
