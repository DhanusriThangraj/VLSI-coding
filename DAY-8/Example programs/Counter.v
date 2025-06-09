// design code
module counter (clock, clear,Q); 
input clock, clear; 
output [3:0] Q; 

reg [3:0] Q; 
always @(posedge clear or negedge clock) 
begin 
if (clear) 
Q = 4'd0; 
else 
  Q = (Q+ 1); 
end 
endmodule

// testbench
module counter_tb;
  reg clock,clear;
  wire [3:0]Q;
 counter uut (clock, clear,Q);
  initial begin
    clock=0;
   
    forever #10 clock=~clock;
    end
 initial begin
   $display("Time\tclock\tclear\tQ");
   $monitor("%0t\t%b\t%b\t%b",$time,clock, clear,Q);
   #10;clear=0;
   #10;clear=1;
   #10;clear=0;
   #100;
   $finish;
   
 end
endmodule

// output
Time	clock	clear	Q
       0	0	x	xxxx
10	1	0	xxxx
20	0	1	0000
30	1	0	0000
40	0	0	0001
50	1	0	0001
60	0	0	0010
70	1	0	0010
80	0	0	0011
90	1	0	0011
100	0	0	0100
110	1	0	0100
120	0	0	0101
testbench.sv:18: $finish called at 130 (1s)
130	1	0	0101
