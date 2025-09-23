// Design a clock with time period = 40 and a duty cycle of 25% by using the always and initial statements.
//   The value of clock at time = 0 should be initialized to 0. 
Time period = 40 units
Duty cycle = 25%, which means the clock is HIGH for 10 units and LOW for 30 units
Initial clock value = 0

  Clock goes from 0 → 1 after 30 time units
  Then from 1 → 0 after 10 time units
  Hence, one full cycle = 30 + 10 = 40 units
  Duty cycle = 10 / 40 = 25%
  
// design code
module clock;
  reg clock;
  initial begin
    $display("Time\tclock\t");
    $monitor("%0t\t%b",$time,clock);
    #1000 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end 
  initial begin
    clock=0;end
  always begin
    #30 clock=1;
    #10 clock=0; 
  end
endmodule

// output
Time	clock	
0	0
30	1
40	0
70	1
80	0
   
