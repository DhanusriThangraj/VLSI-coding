module block_nonblock();
   reg a, b, c, d , e, f ;
  // Blocking assignments
 initial begin
   $display("Time\ta\tb\tc\td\te\tf\t");
    $monitor("%0t\t%h\t%h\t%h\t%h\t%h\t",$time,a, b, c, d, e,f);   
     a = #10 1'b1;//  assigns 1 to a at time 10
     b = #20 1'b0;//  assigns 0 to b at time 30
     c = #40 1'b1;//  assigns 1 to c at time 70
   end
  // Nonblocking assignments
  initial begin
    d <=  #10  1'b1;//  assigns 1 to d at time 10
    e <=  #20  1'b0;//  assigns 0 to e at time 20
    f <=  #40  1'b1;// assigns 1 to f at time 40
 end
   endmodule

// output
Time	a	b	c	d	e	f	
0	    x x	x	x	x	x
10	  1 x	x	1	x	x
20  	1	x	x	1	0	x
30  	1	0	x	1	0	x
40  	1	0	x	1	0	1
70  	1	0	1	1	0	1
