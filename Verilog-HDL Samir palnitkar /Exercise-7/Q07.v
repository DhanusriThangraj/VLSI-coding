// Design a negative edge-triggered D-flipflop (D_FF) with synchronous clear, active high (D_FF clears only at a negative edge of clock when clear is high).
// Use behavioral statements only. (Hint: Output q of D_FF must be declared as reg).
// Design a clock with a period of 10 units and test the D_FF. 

// design code
module D_FF(clock,clear,d,q);
  input clock,clear,d;
  output reg q;
  always @(negedge clock) begin
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
0	        0	x	x	x
10        1	1	x	x
20	      0	1	1	0
30	      1	0	1	0
40	      0	0	1	1
50	      1	0	0	1
60	      0	0	0	0
70	      1	0	0	0


