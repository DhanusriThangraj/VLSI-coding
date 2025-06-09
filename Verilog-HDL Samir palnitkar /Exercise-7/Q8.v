// Design the D-flipflop in exercise 7 with asynchronous clear (D_FF clears whenever clear goes high.
// It does not wait for next negative edge). Test the D_FF. 

// design code
module D_FF(clock,clear,d,q);
  input clock,clear,d;
  output reg q;
  always @(negedge clock or posedge clear) begin
    if (clear) begin
      q<=0;end
     else
       q<=d;
  end
endmodule

// testbench
module D_FF_tb;
  reg clock,clear,d;
  wire q;
  D_FF uut (clock,clear,d,q);
  initial begin
    clock=0;
    forever #10 clock=~clock; 
  end
  initial begin
    $display("Time\tclock\tclear\td\tq\t");
    $monitor("%0t\t%b\t%b\t%b\t%b",$time,clock,clear,d,q);
    
     #10 clear=1;
     #10 d=1;
     #10 clear=0;
     #10 d=1;
     #10 d=0;
    #20 $finish;
  end 
endmodule

// output
Time	clock	clear	d	q	
0	         0	x	x	x
10	       1	1	x	x
20	       0	1	1	0
30	       1	0	1	1
40	       0	0	1	1
50	       1	0	0	1
60	       0	0	0	0
70	       1	0	0	0
