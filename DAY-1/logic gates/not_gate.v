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
