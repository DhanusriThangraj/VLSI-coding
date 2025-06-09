// What is the order of execution of statements in the following Verilog code? 
// Is there any ambiguity in the order of execution? What are the final values of a, b, c, d? 
// initial 
// begin 
// a = 1'b0; #0 c = b; 
// end 
// initial 
// begin 
// b= 1'bl; 
// end 
// #0 d = a;

// design code
module  blocking;
  reg a,b,c,d;
initial 
begin 
  $display("Time\ta\tb\tc\td");          
  $monitor("%0t\t%b\t%b\t%b\t%b",$time,a,b,c,d);
a = 1'b0;
#0 c = b; 
end 
initial 
begin 
  b= 1'b1; 
  #0 d=0;
end 
endmodule

// output
Time	a	b	c	d
0   	0	1	1	0
