module half_adder(sum,carry,a,b);
input a,b;
output sum,carry;
wire a,b;
reg sum,carry;
  always @ (a , b)
begin
sum=a^b;
carry=a&b;
end
endmodule

// testbench
module half_adder_tb;
reg a,b;
wire sum,carry;
half_adder uut (.a(a),
                .b(b),
                .sum(sum),
                .carry(carry));
initial begin
  $display ("Time\t a b | sum carry");
  $monitor ("%0t\t %b %b | %b %b",$time,a,b,sum,carry);
#10; a=0;b=0;
#10; a=0;b=1;
#10; a=1;b=0;
#10; a=1;b=1;
$finish;
end
endmodule
