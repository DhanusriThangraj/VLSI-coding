// Gate level
module and_gate(y,a,b);
  input a,b;
  output y;
  and (y,a,b);
endmodule

// data flow
module and_gate(y,a,b);
  input a,b;
  output y;
  assign  y=a&b;
   endmodule

// behavioural level
module and_gate(
  input a,
  input b,
  output reg y
);

  always @*
  begin
    y = a & b;
  end

endmodule



// Testbench
module and_gate_tb;
  reg a, b;
  wire y;
  and_gate uut (
    .a(a),
    .b(b),
    .y(y)
  );
 initial begin
    $display("Time\t a b | y");
    $display("-----------------");
    a = 0; b = 0;
    #10 $display("%g\t %b %b | %b", $time, a, b, y);
    a = 0; b = 1;
    #10 $display("%g\t %b %b | %b", $time, a, b, y);
    a = 1; b = 0;
    #10 $display("%g\t %b %b | %b", $time, a, b, y);
    a = 1; b = 1;
    #10 $display("%g\t %b %b | %b", $time, a, b, y);
    $finish;
  end
endmodule

