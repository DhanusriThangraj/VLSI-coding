// Gate_level 
module not_gate(y,a);
  input a;
  output y;
  not(y,a);
endmodule


// Data flow
module not_gate(y, a);
  input a;
  output y;
  assign y=~a;
endmodule

// behavioural level
module not_gate(y,a);
  input a;
  output reg y;
  always @(a)
   y=~a;
  
endmodule

// Testbench
module not_gate_tb;
  reg a;
  wire y;
 not_gate dut (
    .y(y),
    .a(a)
  );

  initial begin
    $display("Time\t a\t y");
    $monitor("%0t\t %b\t %b", $time, a, y);

    a = 0; #10;
    a = 1; #10;

    
    $finish;
  end
endmodule

