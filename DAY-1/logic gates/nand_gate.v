// gate_level
module nand_gate(y,a,b);
  input a,b;
  output y;
  nand(y,a,b);
endmodule

// data flow
module nand_gate(y,a,b);
  input a,b;
  output y;
  assign y=~(a&b);
endmodule


// behavioural level
module nand_gate(y,a,b);
  input a,b;
  output reg y;
  always @(a,b)
    y=~(a&b);
endmodule

// testbench
module nand_gate_tb;
  reg a,b;
  wire y;
  nand_gate dut(
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
