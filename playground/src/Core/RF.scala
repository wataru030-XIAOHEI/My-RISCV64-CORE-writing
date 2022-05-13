package Core

import chisel3._
import constant.Consts._
import Bus.RFio



class RF extends Module{
  val io = IO (new Bundle{
    val channel = new RFio
  })

  val rfR = Mem(32,UInt(DWORD_LEN.W))
  when(io.channel.wen && io.channel.waddr =/= 0.U(ADDR_LEN.W)){
    rfR(io.channel.waddr) := io.channel.wdata
  }

  //ren可以去掉
  io.channel.rdata1 := Mux(io.channel.raddr1 === 0.U(ADDR_LEN.W),
                          0.U(DWORD_LEN.W),
                          rfR(io.channel.raddr1)
                          )
  io.channel.rdata2 := Mux(io.channel.raddr2 === 0.U(ADDR_LEN.W),
                          0.U(DWORD_LEN.W),
                          rfR(io.channel.raddr2)
                          )
}
