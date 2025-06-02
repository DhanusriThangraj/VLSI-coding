// design code
module half_adder(
  input a,b,
  output sum,carry);
  assign sum=a^b;
  assign carry=a&b;
endmodule

module full_adder(
  input a,
  input b,
  input cin,
  output sum,
  output cout);
  
  wire sum1,carry1,carry2;
  half_adder HA0 (.a(a),.b(b),.sum(sum1),.carry(carry1));
  half_adder HA1 (.a(sum1),.b(cin),.sum(sum),.carry(carry2));
  assign cout =carry1|carry2;
endmodule


  // testbench

module full_adder_tb;
  reg a,b,cin;
  wire sum,cout;
  
  full_adder uut (a,b,cin,sum,cout);
  initial begin
    $display("Time\ta\tb\tcin\tsum\tcout");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,cin,sum,cout);
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $finish;
  end
endmodule
