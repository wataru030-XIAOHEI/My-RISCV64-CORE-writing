package Core
import chisel3._
import Config.GoParameter
trait rfParam extends GoParameter {
  val rdDp    : Int = 2
  val wrDp    : Int = 1
  val rfNums  : Int = 32

}


class rf extends rfParam {
  protected val gpr = Mem(rfNums,UInt(XLEN.W))

  /**
   * @param address write address
   * @param data    write data
   * @param enBy    write enable
   */
  def write(address : UInt , data : UInt , enBy : Bool ) : Unit = {
    when(address =/= 0.U && enBy ){
      gpr(address) := data
    }
  }

  /**
   * @param address   read address
   * @return  read data from rf
   */
  def read(address : UInt) : UInt = {
    val ret = Mux(address === 0.U ,0.U , gpr(address))
    ret
  }
}
