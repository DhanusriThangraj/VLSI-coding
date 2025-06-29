// Below is a block with nested sequential and parallel blocks. When does the block finish and what is the order of execution of events? At what simulation times does each statement finish execution? 
// initial begin 
// x= 1' b0 
// #5 y = 1 ; 
// fork 
// #20 a = x #15 b = y 
// join 
// #40 x = 1 ; 
// fork 
// #10 p = x 
// begin 
// #10 a = y 
// #30 b = x 
// end 
// #5 m = y 
// join 
// end 


// design code
module blocking;
  reg a,b,x,y,p,m;
initial begin 
  $display("Time\ta\tb\tx\ty\tp\tm\t"); $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t",$time,a,b,x,y,p,m);end
  initial begin
  x= 0 ;
  #5 y = 1 ; 
    fork 
  #20 a = x ;
  #15 b = y ;
     join 
#40 x = 1 ; 
     fork 
      #10 p = x ;
begin 
#10 a = y ;
#30 b = x ;
end 
#5 m = y ;
     join 
end 
endmodule


// output
Time	a	b	x	y	p	m	
0   	x	x	0	x	x	x	
5	    x	x	0	1	x	x	
20   	x	1	0	1	x	x	
25  	0	1	0	1	x	x	
65	  0	1	1	1	x	x	
70	  0	1	1	1	x	1	
75	  1	1	1	1	1	1	
