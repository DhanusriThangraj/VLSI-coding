//Create your own 2-input Verilog gates called my-or, my-and and my-not from 2-input nand gates. Check the functionality of these gates with a stimulus module. 

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
//my_not 
nand (c3,a,a);
endmodule

// testbench
module gates_tb;
reg a,b;
wire c1,c2,c3;
  gates uut (a,b,c1,c2,c3);
initial begin 
  $display("Time\ta\tb\tc1\tc2\tc3\t");
  $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,c1,c2,c3);
  
  a=1;b=0;
  #10; a=0; b=0;
  #10; a=1; b=1;
  #10; a=0; b=1;
  #10;$finish;
end
  endmodule
