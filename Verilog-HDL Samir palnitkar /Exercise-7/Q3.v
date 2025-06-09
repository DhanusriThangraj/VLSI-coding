// 3. Given below is an initial block with blocking procedural assignments. 
//   At what simulation time is each statement executed? What are the intermediate and final values of a, b, c, d? 
// initial 
// begin 
// a = 1'b0; 
// b #10 1'b1; #5 1'b0; 
// d #20 (a, b, c); 
// end 

// design code
module blocking;
  reg a,b,c;
  reg [2:0]d;
initial 
begin 
  $display("Time\ta\tb\tc\td\t");       $monitor("%0t\t%b\t%b\t%b\t%b\t",$time,a,b,c,d);
 a = 1'b0; 
 b =#10 1'b1;
 c = #5 1'b0; 
 d =#20 {a, b, c}; 
end
endmodule

// output
Time	a	b	c	d	
0   	0	x	x	xxx	
10  	0	1	x	xxx	
15	  0	1	0	xxx	
35	  0	1	0	010	
