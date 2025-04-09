module decoder_2to4(
input [1:0]in,
input en,
output reg [0:3]dout);
always @(*)
if(en)begin
case(in)
2'b00:dout=4b'0001;
2'b01:dout=4b'0010;
2'b10:dout=4b'0100;
2'b11:dout=4b'1000;
default:out=4b'0000;
endcase
endelse begin
out=4b'0000;
end
endmodule

  
  // testbench
  module decoder_2to4_tb;
reg in;
reg en;
wire dout[3:0];
2*4_decoder uut(.in(in),.en(en),.dout(dout));
initial begin
$display("Time\t en in | dout");
$display("%0t\t %b %b | %b",$time,in,en,dout);
en=0;
#10; in=2'b00;
#10; in=2'b01;
#10; in=2'b10;
#10; in=2'b11;
en=1;
#10; in=2'b00;
#10; in=2'b01;
#10; in=2'b10;
#10; in=2'b11;
$finish;
end
endmodule;

  
