// design code
module carry_look_ahead_adder(
  input wire [3:0]a,
  input wire [3:0]b,
  input wire cin,
  output reg [3:0]sum,
  output reg cout
   );
  wire [3:0] G;
  wire [3:0] P;
  wire [4:0] c;
  
  assign G=a&b;
  assign P=a^b;
  
  
  assign c[0]=cin;
  assign c[1]=G[0]|(P[0]&cin);
  assign c[2]=G[1]|(P[1]&G[0])|(P[1]&P[0]&cin);
  assign c[3]=G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&cin);
  assign c[4]=G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&cin);
  
  assign sum[3:0]=P^c[3:0];
  assign cout=c[4];  
endmodule

// testbench
module carry_look_ahead_adder_tb;
  reg [3:0]a;
  reg [3:0]b;
  reg cin;
  wire [3:0]sum;
  wire cout;
   
  carry_look_ahead_adder uut (a,b,cin,sum,cout);
  
  initial begin
    $display ("Time\ta\tb\tcin\tsum\tcout\t");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,cin,sum,cout);
    
    #1; a=4'b0010; b=4'b0101; cin=1;
    #5; a=4'b1010; b=4'b0101; cin=0;
    #5; a=4'b1110; b=4'b0111; cin=1;
    #5; a=4'b0011; b=4'b1101; cin=0;
    #5; a=4'b1010; b=4'b0111; cin=1;
    #2; $finish;
  end 
endmodule
