package utils
import chisel3.util._ 
import chisel3._
class dpi extends BlackBox with HasBlackBoxInline {
    val io = IO(new Bundle{
        val inst_in = Input(UInt(32.W))
    })


    setInline("dpi.v",
            """
            |module dpi (input [31:0] inst_in);
            |import "DPI-C" function bit is_ebreak(input int inst);
            |always @(*) begin
            |   if(is_ebreak(inst_in) == 1)begin
            |       $display("\n\33[1;34mebreak! inst : 0x%016h",inst_in);
            |       $display("\33[0m\n");
            |       $finish;
            |   end else begin
            | 
            |   end   
            |   end
            |endmodule
            """.stripMargin)
}
