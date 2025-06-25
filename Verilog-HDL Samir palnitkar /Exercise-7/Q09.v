// Using the wait statement, design a level-sensitive latch that takes clock and d as inputs and q as output.
// q = d whenever clock = 1. 


// design code
module D_FF(clock,d,q);
  input clock,d;
  output reg q;
  always @(clock or d) begin
    if (clock) begin
      wait (!clock);
      q=d;
    end
  end
endmodule

// testbench
module D_FF_tb;
  reg clock,d;
  wire q;
  D_FF uut (clock,d,q);
  initial begin
    clock=0;
    forever #10 clock=~clock; 
  end
  initial begin
    $display("Time\tclock\td\tq\t");
    $monitor("%0t\t%b\t%b\t%b\t",$time,clock,d,q);
    d=1;
     #10 d=0;
     #10 d=1;
     #10 d=0;
    #20 $finish;
  end 
endmodule

// output
Time	clock	d	q	
0	      0	1	x	
10	    1	0	x	
20	    0	1	1	
30	    1	0	1	
40	    0	0	0	
50	    1	0	0	

      
      
