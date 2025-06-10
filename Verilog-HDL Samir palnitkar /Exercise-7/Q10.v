// Design the 4-to-1 multiplexer in Example 7-14 by using if and else statements. 
//   The port interface must remain the same. 

// design code
module mux(
  input i0,i1,i2,i3,
  input[1:0]sel,
       output reg y);
  always @(*) begin
    
    if (sel==2'b00) begin
      y=i0;
  end
   else if (sel==2'b01) begin
      y=i1;
  end
   else if (sel==2'b10) begin
      y=i2;
  end
   else if (sel==2'b11) begin
      y=i3;
  end
  end
    endmodule

// testbench
module mux_tb;
  reg i0,i1,i2,i3;
  reg [1:0]sel;
  wire y;
  mux uut (i0,i1,i2,i3,sel,y);
  initial begin
    $display ("Time\ti0\ti1\ti2\ti3\tsel\ty");
    $monitor ("%0t\t%b\t%b\t%b\t%b\t%b\t%b",$time,i0,i1,i2,i3,sel,y);
    
    i0=1; i1=0; i2=1; i3=1;
    
    #10; sel=2'b00;
    #10; sel=2'b01;
    #10; sel=2'b10;
    #10; sel=2'b11;  
    #10;$finish;
  end
endmodule

// output
Time	i0 i1	i2 i3	sel	y
0	      1	0	1	1	xx	x
10     	1	0	1	1	00	1
20     	1	0	1	1	01	0
30	    1	0	1	1	10	1
40	    1	0	1	1	11	1
