module ALU_operation (input  [3:0]A,input[3:0]B,input [2:0]sel,output reg [3:0]ALU_out,output reg zero);
always @(*) begin
  case(sel)
3'b000:ALU_out=A+B;
3'b001:ALU_out=A-B;
3'b010:ALU_out=A&B;
3'b011:ALU_out=A|B;
3'b100:ALU_out=A^B;
3'b101:ALU_out=~(A^B);
3'b110:ALU_out=A<<B;
3'b111:ALU_out=A>>B;
default:ALU_out=4'b0000;
endcase
zero=(ALU_out==4'b0000)?1:0;
end
endmodule

// testbench
module ALU_operation_tb;
reg [3:0]A;
reg [3:0]B;
reg [2:0]sel;
wire[3:0] ALU_out;
wire zero;
  ALU_operation uut(.A(A),.B(B),.sel(sel),.ALU_out(ALU_out),.zero(zero));
initial begin
  $display("Time\tA\tB\tsel\tAlu_out\tzero");
  $monitor("%0t\t \%b\t%b\t%b\t%b\t %b",$time,A,B,sel,ALU_out,zero);
 A=4'b0011; B=4'b0101;
#10; sel=3'b000;
#10; sel=3'b001;
#10; sel=3'b010;
#10; sel=3'b011;
#10; sel=3'b100;
#10; sel=3'b101;
#10; sel=3'b110;
#10; sel=3'b111;
#10;
  $finish;
end
endmodule
