Nonblocking statements allow you to schedule assignments without blocking the procedural flow.
You can use the nonblocking procedural statement whenever you want to make several register assignments within 
the same time step without regard to order or dependence upon each other. 
It means that nonblocking statements resemble actual hardware more than blocking assignments.

// design code
module non_blocking;
  reg [7:0] a, b, c, d, e;

  initial begin
    $display("Time\ta\tb\tc\td\te");           
    $monitor("%0t\t%h\t%h\t%h\t%h\t%h\t",$time,a, b, c, d, e);     
    
  #10  a <= 8'hDA;
  #17  b <= 8'hF1;
  #5   c <= 8'h30;
   
  end
  initial begin
   #15 d <= 8'hAA;
   #15 e <= 8'h55;
  end
endmodule

// output
Time	a 	b	  c 	d	  e
0	    xx	xx	xx	xx	xx	
10	  da	xx	xx	xx	xx	
15	  da	xx	xx	aa	xx	
27  	da	f1	xx	aa	xx	
30  	da	f1	xx	aa	55	
32  	da	f1	30	aa	55	





