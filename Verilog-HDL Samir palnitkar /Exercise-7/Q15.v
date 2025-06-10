Using a forever statement, design a clock with time period = 10 and duty cycle = 40% Initial value of clock is 0. 
//   To design a clock signal in Verilog using a forever loop with the following parameters:
// Time period = 10 units
// Duty cycle = 40% → HIGH for 4 units, LOW for 6 units

Initial value of clock = 0

  // design code
  module clock;
  reg clock;
  initial begin
    $display("Time\tclock\t");
    $monitor("%0t\t%b\t",$time,clock);
   #100 $finish;end
 
  initial begin
    clock=0; 
   forever begin
          #6 clock=1;
          #4 clock=0;
  end
  end    
endmodule

// output
Time	clock	
0 	0	
6 	1	
10	0	
16	1	
20	0	
26	1	
30	0	
36	1	
40	0	
46	1	
50	0	
56	1	
60	0	
66	1	
70	0	
76	1	
80	0	
86	1	
90	0	
96	1	
testbench.sv:54: $finish called at 100 (1s)
100	0	
