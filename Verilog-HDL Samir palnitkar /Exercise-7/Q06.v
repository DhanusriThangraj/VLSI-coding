// What is the final value of d in the following example. (Hint: See intra-assignment delays). 
// initial 
// begin 
// b = 1'b1 ;
// c= 1' b0;
// #10 b = 1b'0 
// initial 
// begin 
//   d =#25 (b|c); 
// end 

// design code
module blocking;
  reg b,c,d;
initial 
 begin 
   $display("Time\tb\tc\td");         
   $monitor("%0t\t%b\t%b\t%b",$time,b,c,d);
 b = 1'b1 ;
 c= 1'b0;
   #10 b = 1'b0 ; end
initial 
begin 
  d =#25(b|c); 
  end 
   endmodule

// output
Time	b	c	d
0   	1	0	x
10  	0	0	x
25	  0	0	1
