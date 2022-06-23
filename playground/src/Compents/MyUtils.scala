package Compents

import chisel3._
object MyUtils  {
  val handShake = Wire( new HandShake )
}

class HandShake extends Bundle  {
  val ready = Bool()
  val valid = Bool()
}