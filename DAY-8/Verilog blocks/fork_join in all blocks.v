BLOCKING
// design code
module blocking;
  reg [7:0] a, b, c, d, e;
  initial fork
    $display("Time\ta\tb\tc\td\te");
    $monitor("%0t\t%h\t%h\t%h\t%h\t%h\t",$time,a, b, c, d, e);   
    a = 8'hDA;
    #10 b = 8'hF1;
    #12 c = 8'h30;
    
    #10 b = a;
    #12 a = b;
      join
 initial fork
    #5 d = 8'hAA;
    #5 e = 8'h55;
    join
endmodule
// output
Time	a	 b	 c	 d 	e
0   	da	xx	xx	xx	xx	
5	    da	xx	xx	aa	55	
10  	da	f1	xx	aa	55	
12  	f1	f1	30	aa	55

NON-BLOCKING
module non_blocking;
  reg [7:0] a, b, c, d, e;
  initial fork 
    $display("Time\ta\tb\tc\td\te");      
    $monitor("%0t\t%h\t%h\t%h\t%h\t%h\t",$time,a, b, c, d, e);     
  #10  a <= 8'hDA;
  #17  b <= 8'hF1;
  #5   c <= 8'h30;  
  join
  initial fork
   #15 d <= 8'hAA;
   #15 e <= 8'h55;
  join
endmodule

// output
[2025-06-09 07:31:24 UTC] iverilog '-Wall' '-g2012' design.sv testbench.sv  && unbuffer vvp a.out  
Time	a 	b	  c	  d	  e
0	    xx	xx	xx	xx	xx	
5	    xx	xx	30	xx	xx	
10  	da	xx	30	xx	xx	
15	  da	xx	30	aa	55	
17  	da	f1	30	aa	55

BOTH BLOCKING AND NON-BLOCKING
module block_nonblock();
   reg a, b, c, d , e, f ;
   // Blocking assignments
 initial fork
   $display("Time\ta\tb\tc\td\te\tf\t");
    $monitor("%0t\t%h\t%h\t%h\t%h\t%h\t",$time,a, b, c, d, e,f);   
     a = #10 1'b1;//  assigns 1 to a at time 10
     b = #20 1'b0;//  assigns 0 to b at time 30
     c = #40 1'b1;//  assigns 1 to c at time 70
 join  
//   Nonblocking assignments
  initial fork
    d <=  #10  1'b1;//  assigns 1 to d at time 10
    e <=  #20  1'b0;//  assigns 0 to e at time 20
    f <=  #40  1'b1;// assigns 1 to f at time 40
    join
  endmodule

   // output
Time	a	b	c	d	e	f	
0	    x	x	x	x	x	x
10   	1	x	x	1	x	x
20  	1	0	x	1	0	x
40	  1	0	1	1	0	1
   


