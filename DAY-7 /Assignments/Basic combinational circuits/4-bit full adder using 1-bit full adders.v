// design code
module full_adder(input a,b,cin,
                  output sum,cout);
  assign sum=a^b^cin;
  assign cout=(a&b)|(a&cin)|(b&cin);
  endmodule

module full_adder_using_1_bit_full_adders(
  input [3:0]a,
  input [3:0]b,
input cin,
  output [3:0]sum,
output cout);
  wire c1,c2,c3;
  
  full_adder FA0 (.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(c1));
  full_adder FA1 (.a(a[1]),.b(b[1]),.cin(c1),.sum(sum[1]),.cout(c2));
  full_adder FA2 (.a(a[2]),.b(b[2]),.cin(c2),.sum(sum[2]),.cout(c3));
  full_adder FA3 (.a(a[3]),.b(b[3]),.cin(c3),.sum(sum[3]),.cout(cout));
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
