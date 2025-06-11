  // Implement Y-ABC+A.B.E+B.CCID using delay value 3 for and gates, 2 for or gates and 4 for not gates.
  // Use two inputs and, or gates only. Use $Monitor for displaying result on transcript,also turn off display for 50 time units and then continue displaying the results. 
  // Note: B/C means (not B) and (not c) 
// design code
module gates(input a,b,c,d,e,
            output reg y);
  wire w1,w2,w3,w4,w5,w6,w7,w8;
  wire notb,notc,notd;
  
  not   #(4) n1 (notb,b);
  not   #(4) n2 (notc,c);
  not   #(4) n3 (notd,d);
  
  and   #(3)a1(w1,a,notb);
  and   #(3)a5(w2,w1,notc);
  
  and   #(3)a2(w3,a,b);
  and   #(3)a6(w4,w3,e);
  
  
  and   #(3)a3(w5,notb,c);
  and   #(3)a4(w6,c,notd);
  
  or #(2) or1 (w7,w2,w4);
  or #(2) or2 (w8,w5,w6);
  or #(2) or3  (y,w7,w8); 
endmodule
// testbench
module gates_tb;
  reg a,b,c,d,e;
  wire y;
  gates uut (a,b,c,d,e,y);
  initial begin   
    $dumpfile("gates.vcd");
    $dumpvars();
  end
  initial begin
    $strobe("Time\ta\tb\tc\td\te\ty");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b",$time,a,b,c,d,e,y);
    
    #10 a=1; b=0; c=1; d=1; e=0;
    #10 a=1; b=0; c=0; d=0; e=0;
    #10 a=1; b=1; c=1; d=1; e=0;
    #10 a=1; b=0; c=0; d=0; e=1;
    #10; $finish;
    
  end
endmodule

// output

Time	a	b	c	d	e	y
0	   x	x	x	x	x	x
10	 1	0	1	1	0	x
20   1	0	0	0	0	x
21	 1	0	0	0	0	1
27	 1	0	0	0	0	0
30	 1	1	1	1	0	0
31	 1	1	1	1	0	1
40	 1	0	0	0	1	1
41	 1	0	0	0	1	0
47	 1	0	0	0	1	1
50	 1	0	0	0	1	0
    
