module down_counter (clk,reset,count);
input clk;
input reset;
output reg [3:0]count;

always @ (posedge clk or posedge reset) begin
if (reset) begin
  count<=4'd15;
  end
else begin
  count<=count-1;
end
end
endmodule

// testbench
module down_counter_tb;
reg clk;
reg reset;
wire [3:0]count;
down_counter uut(clk,reset,count);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$dumpfile("down_counter.vcd");
$dumpvars(0,down_counter_tb);
end
initial begin
$display("Time\tclk\treset\tcount");
$monitor("%0t\t%b\t%b\t%b",$time,clk,reset,count);

#10;  reset=0;
#10;  reset=1;
#10;
$finish;
end
endmodule
