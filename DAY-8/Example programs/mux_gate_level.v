// design code
module mux_gatelevel(input d0,d1,d2,d3,
input sel0,sel1,
output y);

wire D0,D1,D2,D3;
wire notsel0,notsel1;

not n1(notsel0,sel0);
not n2(notsel1,sel1);

and a1(D0,notsel0,notsel1,d0);
and a2(D1,notsel0,sel1,d1);
and a3(D2,sel0,notsel1,d2);
and a4(D3,sel0,sel1,d3);

or or1(y,D0,D1,D2,D3);
endmodule

// testbench code
module mux_gatelevel_tb;
reg d0,d1,d2,d3;
reg sel0,sel1;
wire y;
mux_gatelevel uut (d0,d1,d2,d3,sel0,sel1,y);
initial begin
$display("Time\td0\td1\td2\td3\tsel0\tsel1\ty");
$monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",$time,d0,d1,d2,d3,sel0,sel1,y);

#10; d0=0; d1=1; d2=1; d3=0;
#10;sel0=0;sel1=0;
#10;sel0=0;sel1=1;
#10;sel0=1;sel1=0;
#10;sel0=1;sel1=1;
#10;$finish;

end
endmodule
