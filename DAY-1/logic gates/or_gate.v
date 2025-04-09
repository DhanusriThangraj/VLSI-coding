// gate_level
module or_gate(y,a,b);
  input a,b;
  output y;
  or(y,a,b);
endmodule

// data flow
module or_gate(y,a,b);
  input a,b;
  output y;
  assign y=a|b;
endmodule

// behavioural level
module or_gate(y,a,b);
  input a,b;
  output  reg y;
  always @(a,b)
  y=a|b;
endmodule


// testbench
module or_gate_tb;
  reg a,b;
  wire y;
  or_gate dut(
    .a(a),
    .b(b),
    .y(y));
  initial begin
    $display ("Time\t a b |y");
    $display ("-----------");
   a=0;b=0;
    #10 $display("%g\t %b %b | %b",$time,a,b,y);
   a=0;b=1;
    #10 $display("%g\t %b %b | %b",$time,a,b,y);
  a=1;b=0;
     #10 $display("%g\t %b %b | %b",$time,a,b,y);
  a=1;b=1;
    #10 $display("%g\t %b %b | %b",$time,a,b,y);
     $finish;
  end
 endmodule
