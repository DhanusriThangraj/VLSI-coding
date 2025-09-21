
module mealy(clk,reset,in,out);
input wire clk;
input wire reset;
input wire in;
output reg out;
parameter s0=2'b00,
s1=2'b01,
s2=2'b10,
s3=2'b11;
reg[1:0]state ,next_state;
always @(*) begin
  next_state = state;
  out=0;
case (state)
	s0:begin
	      	if (in) begin
                  next_state =s1;
             end 
     end
	s1:begin
	if (!in)
          next_state=s2;
         else
           next_state =s1;
          end
         s2:begin
       	 if (in) begin
         next_state= s3;
        end
      else
     next_state=s0;
end
s3:begin 
if (in) begin
 next_state=s1;
out=1;
end
else
 next_state=s2;
end
endcase
end
always @ (posedge clk or posedge reset) begin
	if (reset) begin
	  state<=s0;
  end
	else
          state<=next_state;
  end 
  endmodule


// testbench
module mealy_tb;
 reg  clk;
 reg reset;
 reg in;
 wire out;
 mealy uut (clk,reset,in,out);
initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
$display("Time\tclk\treset\tin\tout");
$monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,reset,in,out);

reset=1;
in=0;

#10; 
reset=0;#10;
in=1;#10;
in=0;#10;
in=1;#10;
in=1;#10;

in=0;#10;
in=1;#10;
in=0;#10;
in=1;#10;
in=1;#10;
in=1;#10;

$finish;

end
endmodule
