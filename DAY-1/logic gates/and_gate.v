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

