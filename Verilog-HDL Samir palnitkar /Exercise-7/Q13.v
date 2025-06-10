. Using a while loop, design a clock generator.
  Initial value of clock is 0. Time period for the clock is 10. 

    // design code
    module clock;
  reg clock;
  initial begin 
    $display("Time\tclock\t");
    $monitor("%0t\t%b\t",$time,clock);
  end
  initial begin
     clock=0;
    while ($time<100) 
   begin
    #5 clock=~clock;  
     // Half of the time period (10/2 = 5)
  end    
    #10 $finish;
  end
endmodule

// output
Time	clock	
0  	0	
5  	1	
10	0	
15	1	
20	0	
25	1	
30	0	
35	1	
40	0	
45	1	
50	0	
55	1	
60	0	
65	1	
70	0	
75	1	
80	0	
85	1	
90	0	
95	1	
100	0	
testbench.sv:15: $finish called at 110 (1s)
