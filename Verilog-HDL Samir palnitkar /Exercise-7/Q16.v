Using the repeat loop, delay the statement a = a + 1 by 20 positive edges of clock. 
  
  // design code
  module repeat_on_posedge;
  reg clock;
  reg a;
   initial begin
     clock=0;
     forever #5 clock=~clock; 
  end
  initial begin
    $display("Time\tclock\ta\t");
    $monitor("%0t\t%b\t%b\t",$time,clock,a);
  repeat (20)@(posedge clock)begin
    a=0;
    a=a+1;
  end  
    $finish;  
  end
endmodule

// output
Time	clock	a	
0  	0	x	
5 	1	1	
10	0	1	
15	1	1	
20	0	1	
25	1	1	
30	0	1	
35	1	1	
40	0	1	
45	1	1	
50	0	1	
55	1	1	
60	0	1	
65	1	1	
70	0	1	
75	1	1	
80	0	1	
85	1	1	
90	0	1	
95	1	1	
100	0	1	
105	1	1	
110	0	1	
115	1	1	
120	0	1	
125	1	1	
130	0	1	
135	1	1	
140	0	1	
145	1	1	
150	0	1	
155	1	1	
160	0	1	
165	1	1	
170	0	1	
175	1	1	
180	0	1	
185	1	1	
190	0	1	
testbench.sv:79: $finish called at 195 (1s)
195	1	1
