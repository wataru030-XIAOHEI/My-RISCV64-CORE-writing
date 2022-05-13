package Core

import Bus.{DMemIo, IMemIO}
import chisel3.util._
import chisel3._
import constant.Consts.{DWORD_LEN, WORD_LEN}




class IMem extends Module{
  val io = IO(new Bundle{
    val IMemio = new IMemIO()
  })
  val mem = Mem(16384,1.U(8.W))

  io.IMemio.inst := Cat(
    mem(io.IMemio.pc + 3.U(WORD_LEN.W) ),
    mem(io.IMemio.pc + 2.U(WORD_LEN.W) ),
    mem(io.IMemio.pc + 1.U(WORD_LEN.W) ),
    mem(io.IMemio.pc                   )
  )
}

class DMem extends Module{
  val io = IO (new Bundle{
    val DMemio = new DMemIo()
  })
  val mem = Mem(16384,UInt(8.W))

  io.DMemio.rdata := Cat(//read double word
    mem(io.DMemio.addr + 7.U(WORD_LEN.W)),
    mem(io.DMemio.addr + 6.U(WORD_LEN.W)),
    mem(io.DMemio.addr + 5.U(WORD_LEN.W)),
    mem(io.DMemio.addr + 4.U(WORD_LEN.W)),
    mem(io.DMemio.addr + 3.U(WORD_LEN.W)),
    mem(io.DMemio.addr + 2.U(WORD_LEN.W)),
    mem(io.DMemio.addr                  )
  )
  when(io.DMemio.wen){
    mem(io.DMemio.addr + 7.U(WORD_LEN.W)) := io.DMemio.rdata(63,  56)
    mem(io.DMemio.addr + 6.U(WORD_LEN.W)) := io.DMemio.rdata(55,  48)
    mem(io.DMemio.addr + 5.U(WORD_LEN.W)) := io.DMemio.rdata(47,  40)
    mem(io.DMemio.addr + 4.U(WORD_LEN.W)) := io.DMemio.rdata(39,  32)
    mem(io.DMemio.addr + 3.U(WORD_LEN.W)) := io.DMemio.rdata(31,  24)
    mem(io.DMemio.addr + 2.U(WORD_LEN.W)) := io.DMemio.rdata(23,  16)
    mem(io.DMemio.addr + 1.U(WORD_LEN.W)) := io.DMemio.rdata(15,  8 )
    mem(io.DMemio.addr                  ) := io.DMemio.rdata( 7,  0 )
  }
}
