module moore(clk,reset,in,out);
input wire clk;
input wire reset;
input wire in;
output reg out;
parameter s0=4'b0000,
s1=4'b0001,
s2=4'b0010,
s3=4'b0011,
s4=4'b0100;
reg[3:0] state,next_state;
always @(*)begin
 case(state)
	 s4:out=1;
	 default:out=0;
 endcase
 end
 always @(*) begin
	 next_state=state;
case (state)
s0:begin
if (in) 
  next_state=s1;
 else
   next_state=s0;
end
s1: begin
if (!in) 
next_state=s2;
 else
next_state=s1;
end
s2:begin
if (in) 
next_state=s3;
else 
next_state =s0;
end
s3: begin
if (!in) 
next_state=s4;
else
next_state=s1;
end
s4:begin
	if (in) begin
next_state=s3;

end
else 
next_state=s0;
end
endcase
end
always @(posedge clk or posedge reset) begin
if (reset) begin
state <=s0;
end
else
state <= next_state;
end
endmodule


// testbench
module moore_tb;
reg clk;
reg reset;
reg in;
wire out;
moore uut(clk,reset,in,out);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$display("Time\tclk\treset\tin\tout\t");
$monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,reset,in,out);


reset=1;
#10; in=0; reset=0;
in=1;#10;
in=0;#10;
in=0;#10;
reset=0;
in=1;#10;
in=0;#10;
in=1;#10;
in=0;#10;
reset=0;
in=1;#10;
in=0;#10;
in=1;#10;
in=0;#10;

$finish;
end
endmodule



