module full_adder(sum,cout,a,b,cin);
input a,b,cin;
output sum,cout;
wire a,b,cin;
reg sum,cout;
always @(*)
begin
sum=a^b^cin;
cout=(a&b)|(b&cin)|(cin&a);
end
endmodule

module ripple_carry_adder (
input  [3:0]a,
input  [3:0]b,
input  cin,
  output reg [3:0]sum,output cout);

wire c1,c2,c3;
  full_adder FA0(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(c1));
  full_adder FA1(.a(a[1]),.b(b[1]),.cin(c1),.sum(sum[1]),.cout(c2));
  full_adder FA2(.a(a[2]),.b(b[2]),.cin(c2),.sum(sum[2]),.cout(c3));
  full_adder FA3(.a(a[3]),.b(b[3]),.cin(c3),.sum(sum[3]),.cout(cout));
endmodule

// testbench
module ripple_carry_adder_4bit_tb;
  reg  [3:0] a, b;
reg        cin;
  wire [3:0] sum;
wire       cout;
  ripple_carry_adder uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout)
);
initial begin
  $display("time\ta\tb\tcin\tsum\tcout");
  $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,cin,sum,cout);
    a= 4'b0101; b = 4'b0011; cin = 0; #10;
    a = 4'b1111; b = 4'b0001;cin = 0; #10;
    a = 4'b1000; b= 4'b1000; cin = 1; #10;

    $finish;
end
endmodule



