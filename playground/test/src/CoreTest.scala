import Core._ 
class CoreTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "Module"
    it should "work" in {
        test(new Core).withAnnotations(Seq(WriteVcdAnnotation)) {dut =>
            while(1){
                dut.clock.step(1)
            }
        }
    }
}