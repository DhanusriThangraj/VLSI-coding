module d_flipflop(clk,reset,d,q);
  input clk,reset,d;
  output reg q;
  always @(posedge clk or posedge reset)
    begin
    if (reset)
      q<=0;
   else 
     q=d;
    end 
endmodule
  

module siso_shift(clk,reset,din ,dout);
  input clk,reset,din;
  output reg dout;
  wire q0,q1,q2,q3;
  
    d_flipflop d0 (.d(din),.clk(clk),.reset(reset),.q(q0));
    d_flipflop d1 (.d(q0),.clk(clk),.reset(reset),.q(q1));
    d_flipflop d2 (.d(q1),.clk(clk),.reset(reset),.q(q2));
    d_flipflop d3 (.d(q2),.clk(clk),.reset(reset),.q(q3));
   assign dout=q3;
    
    endmodule
// testbench
module siso_shift_tb;
  reg clk,reset,din;
  wire dout;
  siso_shift uut(.clk(clk),.reset(reset),.din(din),.dout(dout));
  initial begin 
    clk =0;
    forever #5 clk =~clk;
  end
  initial begin
    $dumpfile("siso_shift.vcd");
    $dumpvars(0,siso_shift_tb);
  end
    initial begin
    $display("Time\tclk\treset\tdin\tdout");
    $monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,reset,din,dout);
     #10; reset=1; din=0;
     #10; din=1;
     #10; din=0;
     #10; din=1;
     #10; din=0;
     #10; reset=0; din=1;
     #10; din=0;
     #10; din=1;
     #10; din=1;
     #10;
      
      
      $finish;
    end 
endmodule
