// 2. Ripple carry adder using genvr 
// design code
module full_adder  (
  input a,
  input b,
  input cin,
  output sum,cout);
  assign sum=a^b^cin;
  assign cout=(a&b)|(b&cin)|(a&cin);
endmodule

module ripple_carry_adder #(parameter N=4)
  (
  input [N-1:0]A,
  input [N-1:0]B,
  input Cin,
    output [N-1:0]sum,
    output cout);
  
  wire [N:0]carry;
  assign carry[0]=Cin;
  assign cout=carry[N];
  
  genvar i; 
    generate
      for (i=0; i<N;i=i+1) begin:adder
          full_adder fa1(.a(A[i]),.b(B[i]),.cin(carry[i]),.sum(sum[i]),.cout(carry[i+1]));
        end
    endgenerate
  
endmodule

// testbench
module ripple_carry_adder_tb;
 parameter N=4;
  reg [3:0]A;
  reg [3:0]B;
  reg Cin;
  wire [3:0]sum,cout;
  
  ripple_carry_adder #(N) uut (A,B,Cin,sum,cout);
   initial begin
     $display("Time\tA\tB\tCin\tsum\tcout");
     $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t",$time,A,B,Cin,sum,cout);
     A=4'b0101; B=4'b1011; Cin=1;
    #10 A=4'b0101; B=4'b1010; Cin=0;
    #10 A=4'b0101; B=4'b1010; Cin=1;
    #10 A=4'b1101; B=4'b1010; Cin=0;
    #10 A=4'b0111; B=4'b1101; Cin=1;   
  $finish;
   end
endmodule

// output

Time	A  	B	   Cin sum	cout
0	  0101	1011	1	0001	0001	
10	0101	1010	0	1111	0000	
20	0101	1010	1	0000	0001	
30	1101	1010	0	0111	0001	
40	0111	1101	1	0101	0001	
