module full_adder(sum,carry,a,b,c);
input a,b,c;
output sum,carry;
wire a,b,c;
reg sum,carry;
always @(a,b,c)
begin
sum=a^b^c;
  carry=(a&b)|(b&c)|(c&a);
end
endmodule


// testbench
module full_adder_testbench;
reg a,b,c;
wire sum,carry;
full_adder uut(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
initial begin
  $display ("time\t a b c| sum carry");
  $monitor ("%0t\t %b %b %b| %b %b",$time,a,b,c,sum,carry);
#10;a=0;b=0;c=0;
#10;a=0;b=0;c=1;
#10;a=0;b=1;c=0;
#10;a=0;b=1;c=1;
#10;a=1;b=0;c=0;
#10;a=1;b=0;c=1;
#10;a=1;b=1;c=0;
#10;a=1;b=1;c=1;
                                                                                                                                               
end
endmodule
