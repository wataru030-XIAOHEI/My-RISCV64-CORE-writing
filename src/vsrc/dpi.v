import "DPI-C" function bit is_ebreak(input int inst , input longint gpr_10 );
module dpi (input [31:0] inst , input [63:0] pc , input[63:0] gpr_a0); //$a0 == gpr[10]

always @(*) begin
   if(is_ebreak(inst,gpr_a0) == 1)begin
       $display("\n\33[1;34mebreak! pc : 0x%016h $a0 : 0x%016h", pc , gpr_a0 );
       $display("\33[0m\n");
       $finish;
   end else begin
 
   end   
   end
endmodule
            