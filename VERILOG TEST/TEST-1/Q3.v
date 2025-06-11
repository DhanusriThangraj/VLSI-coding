// Design configurable full adder using parameter construct (Test it for 8 bit and 16 bit full adder). 
//   Use $Strobe for Displaying result on transcript 

// design code
module full_adder #(parameter N=8) (
  input [N-1:0]a,
  input [N-1:0]b,
  input cin,
  output reg [N-1:0]sum,carry);
  
  assign sum = a^b^cin;
  assign carry =(a&b)|(b&cin)|(cin&a);
  
endmodule
// testbench
module full_adder_tb;
  parameter N=8;
  reg [N-1:0]a;
  reg [N-1:0]b;
  reg cin;
  wire [N-1:0]sum,carry;
  
  full_adder #(N) uut (a,b,cin,sum,carry);
   initial begin
     $strobe("Time\ta\t\tb\t\tcin\tsum\t\tcarry");
     $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t",$time,a,b,cin,sum,carry);
     
     a=8'b00010101; b=8'b10111010; cin=1;
    #10 a=8'b00010101; b=8'b10101010; cin=0;
    #10 a=8'b11010101; b=8'b10101010; cin=1;
    #10 a=8'b00011101; b=8'b10101010; cin=0;
    #10 a=8'b01110101; b=8'b10111010; cin=1;
   end
endmodule

// output for 8bit
Time	a		b		cin	sum		carry
0 	00010101	10111010	1	10101110	00010001	
10	00010101	10101010	0	10111111	00000000	
20	11010101	10101010	1	01111110	10000001	
30	00011101	10101010	0	10110111	00001000	
40	01110101	10111010	1	11001110	00110001
// output for 16bit
Time	      a	             	b		       cin	    sum		          carry
0	  0000000000010101	0000000010111010	1	0000000010101110	0000000000010001	
10	0000000000010101	0000000010101010	0	0000000010111111	0000000000000000	
20	0000000011010101	0000000010101010	1	0000000001111110	0000000010000001	
30	0000000000011101	0000000010101010	0	0000000010110111	0000000000001000	
40	0000000001110101	0000000010111010	1	0000000011001110	0000000000110001	
  
