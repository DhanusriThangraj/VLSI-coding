4. Repeat exercise 3 if nonblocking procedural assignments were used. 

  // design code
  module non_blocking;
  reg a,b,c;
  reg [2:0]d;
initial 
begin 
  $display("Time\ta\tb\tc\td\t");       $monitor("%0t\t%b\t%b\t%b\t%b\t",$time,a,b,c,d);
 a <= 1'b0; 
 b <=#10 1'b1;
 c <= #5 1'b0; 
 d <= #20{a, b, c}; 
end
endmodule

// output
Time	a	b	c	 d	
0	   0	x	x	xxx	
5	   0	x	0	xxx	
10	 0	1	0	0xx	
