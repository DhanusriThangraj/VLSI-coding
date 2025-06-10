Using a case statement, design an 8-function ALU that takes 4-bit inputs a and b and a 3-bit input signal select, and gives a 5-bit output out. The ALU implements the following functions based on a 3-bit input signal select. Ignore any overflow or underflow bits. 
Select Signal    Function 
3'b000            out = a 
3'b001            out = a + b 
3'b010            out = a - b 
3'b011            out = a / b 
3'b100            out= a% * b (remainder) 
3'b101            out = a <<1
3'b110            out = a >>1
3'b111            out = (a > b) (magnitude compare)

//design code
  module alu(
  input [3:0]a,b,
  input [2:0]sel,
  output reg [4:0]out);
  always @(*) begin 
    case(sel)
      3'b000:out=a;
      3'b001:out=a+b;
      3'b010:out=a*b;
      3'b011:out=a/b;
      3'b100:out=a%b;
      3'b101:out=a<<2;
      3'b110:out=a>>1;
      3'b111:out=a<b;
    endcase
  end
endmodule

  // testbench
  module alu_tb;
  reg [3:0]a,b;
  reg [2:0]sel;
  wire [4:0]out;
  
  alu uut (a,b,sel,out);
  initial begin
    $display("Time\ta\tb\tsel\tout\t");
    $monitor("%0t\t%d\t%d\t%d\t%d\t",$time,a,b,sel,out);
    a=4'b0011;
    b=4'b1010;
    sel=3'b000; 
    repeat(8) begin
    #10 sel=sel+1;
      end
    #10 $finish; end
endmodule
// output
  Time	a	b	sel	out	
0	      3	10	0	 3	
10	    3	10	1	13	
20	    3	10	2	30	
30	    3	10	3	 0	
40	    3	10	4	 3	
50	    3	10	5	12	
60	    3	10	6	 1	
70	    3	10	7	 1	
80	    3	10	0	 3




 
 
