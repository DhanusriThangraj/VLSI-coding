// design code
module mux_2to1(input in1,in2,s,
output out);
bufif1 #(1:3:5,2:4:6,3:5:7)(out,in1,s);
bufif0 #(1:3:5,2:4:6,3:5:7)(out,in2,s);
endmodule


// testbench
module mux_2to1_tb;
reg in1,in2,s;
output out;

mux_2to1 uut(in1,in2,s,out);
initial begin

$display("Time\tin1\tin2\ts\tout\t");
$monitor("%0t\t%b\t%b\t%b\t%b",$time,in1,in2,s,out);

#10;in1=1; in2=1; s=0;
#10;in1=0; in2=0; s=1;
#10;in1=0; in2=1; s=0;
#10;in1=1; in2=0; s=1;

#10;$finish;
end 
endmodule

// output 
Time	in1	in2	s	out	
0	x	x	x	x
10	1	1	0	x
13	1	1	0	1
20	0	0	1	1
24	0	0	1	x
25	0	0	1	0
30	0	1	0	0
33	0	1	0	x
35	0	1	0	1
40	1	0	1	1
testbench.sv:18: $finish called at 50 (1s)
Done
