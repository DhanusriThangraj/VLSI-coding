module half_sub (
input a,input b, output diff,output borrow);
assign diff= a^b;
assign borrow =~(a&b);
endmodule

// testbench
module half_sub_testbench;
reg a,b;
wire diff,borrow;
half_sub uut(.a(a),.b(b),.diff(diff),.borrow(borrow));
initial begin
$display("Time\t a b | diff borrow");
$monitor("%0t\t %b %b | %b %b",$time ,a,b,diff,borrow);
#10; a=0; b=0;
#10; a=0; b=1;
#10; a=1; b=0;
#10; a=1; b=1;
 #10;

 $finish;
end
endmodule
