// design code
module full_adder(input a,b,cin,
                  output sum,cout);
  assign sum=a^b^cin;
  assign cout=(a&b)|(a&cin)|(b&cin);
  endmodule


module ripple_carry_adder(
  input [3:0]a,
  input [3:0]b,
  input cin,
  output [3:0]sum,
  output cout);
  wire [3:1]c;
  
  full_adder FA0 (a[0],b[0],cin,sum[0],c[1]);
  full_adder FA1 (a[1],b[1],c[1],sum[1],c[2]);
  full_adder FA2 (a[2],b[2],c[2],sum[2],c[3]);
  full_adder FA3 (a[3],b[3],c[3],sum[3],cout);
endmodule
  // testbench
module ripple_carry_adder_tb;
  reg [3:0]a;
  reg [3:0]b;
  reg cin;
  wire [3:0]sum;
  wire cout;
  
  ripple_carry_adder uut(a,b,cin,sum,cout);
  initial begin
    $display("Time\ta\tb\tcin\tsum\tcout");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,cin,sum,cout);
    
        a = 4'b0000; b = 4'b0000; cin = 0; #10;  
        a = 4'b0011; b = 4'b0101; cin = 0; #10;  
        a = 4'b1010; b = 4'b0101; cin = 1; #10;  
        a = 4'b1111; b = 4'b0001; cin = 0; #10;  
        a = 4'b1001; b = 4'b1001; cin = 1; #10;  
    $finish;
  end
endmodule
