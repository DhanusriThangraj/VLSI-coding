//A 2-input xor gate can be built from my_and, my_or and my_not gates. 
//Construct an xor module in Verilog that realizes the logic function, z = xy' + x'y. Inputs are x and y, and z is the output. 
//Write a stimulus module that exercises all four combinations of x and y inputs.

// design code
module gates(a,b,c1,c2,c3);
input a,b;
output c1,c2,c3;
wire w1,w2,w3;
//my_or
nand a1 (w1,a,a);
nand b1 (w2,b,b);
nand c (c1,w1,w2);
//my_and
nand (w3,a,b);
nand (c2,w3,w3);
//ny_not 
nand (c3,a,a);
endmodule

module Xor_gate(x,y,z);
  input x,y;
  output z;
  wire xnot,ynot,w4,w5;
//  z=(~xy+x~y)
//   ~x,~y
  gates G1 (.c3(xnot),.a(x),.b(x));
  gates G2 (.c3(ynot),.a(y),.b(y)); 
//   x~y,~xy
  gates G3 (.c2(w4),.a(x),.b(ynot));
  gates G4 (.c2(w5),.a(xnot),.b(y));
//   z
  gates G5 (.c1(z),.a(w4),.b(w5));
endmodule

// testbench
module Xor_gate_tb;
reg x,y;
wire z;
  Xor_gate uut (x,y,z);
initial begin 
  $display("Time\tx\ty\tz");
  $monitor("%0t\t%b\t%b\t%b",$time,x,y,z);
  
  x=1;y=0;
  #10; x=0; y=0;
  #10; x=1; y=1;
  #10; x=0; y=1;
  #10;$finish;
end
  endmodule
  
  

 
