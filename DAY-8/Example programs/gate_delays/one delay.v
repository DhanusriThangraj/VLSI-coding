// design code
module gate_delays (input a, b,
                  output out1, out2 ,out3);

	
  and       #(7) o1 (out1, a, b);
  bufif0    #(3) b1 (out2, a, b);
  or        #(5) a1 (out3, a, b);

endmodule

// testbench
module gate_delays_tb;
  reg a, b;
  wire out1, out2, out3;
 gate_delays uut (a,b,out1,out2,out3);
initial begin
    $display("Time\ta\tb\tout1\tout2\tout3");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,out1,out2,out3);
    
   $dumpfile("gate_delays.vcd");
   $dumpvars;
    
   {a, b} <= 0;
    #10 a <= 1;
    #10 b <= 1;
    #10 a <= 0;
    #10 b <= 0;
    #10; $finish;
  end
endmodule

//output
  5-09-13 09:21:25 UTC] iverilog '-Wall' '-g2012' design.sv testbench.sv  && unbuffer vvp a.out  
Time	a	b	out1	out2	out3

0	    0	0	x	x	x
3	    0	0	x	0	x
5	    0	0	x	0	0
7	    0	0	0	0	0
10	    1	0	0	0	0
13	    1	0	0	1	0
15	    1	0	0	1	1
20	    1	1	0	1	1
23	    1	1	0	z	1
27   	1	1	1	z	1
30	    0	1	1	z	1
37	    0	1	0	z	1
40	    0	0	0	z	1
43	    0	0	0	0	1
45	    0	0	0	0	0
testbench.sv:22: $finish called at 50 (1s)
Done
