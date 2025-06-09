Blocking assignment (=): Executes in order, one after the other, just like normal programming languages.
It blocks the next statement from running until the current one finishes.
It's used in initial or always blocks for sequential logic or simulation control.

module blocking;
  reg [7:0] a, b, c, d, e;

  initial begin
    $display("Time\ta\tb\tc\td\te");
    $monitor("%0t\t%h\t%h\t%h\t%h\t%h\t",$time,a, b, c, d, e);   
    a = 8'hDA;
    #10 b = 8'hF1;
    #12 c = 8'h30; 
    #10 b = a;
    #12 a = b; 
  end
initial begin
    #5 d = 8'hAA;
    #5 e = 8'h55;
   
  end
endmodule

// output
Time	a	 b	 c	d 	e
0	   da	xx	xx	xx	xx	
5	   da	xx	xx	aa	xx	
10   da	f1	xx	aa	55	
22	 da	f1	30	aa	55	
32	 da	da	30	aa	55
