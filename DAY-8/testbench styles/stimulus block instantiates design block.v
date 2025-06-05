// design code
  module ripple_counter(input clk,
                            input reset,
                            output reg [3:0]q);
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      q<=4'b0000;
    end
    else
      q<=q+1;
  end
endmodule

// testbench
module ripple_counter_tb;
  reg clk;
  reg reset;
  wire [3:0]q;
  ripple_carry_counter uut (.clk(clk),.reset(reset),.q(q));
 
   initial begin 
     clk=0;
     forever #5clk=~clk;
   end
  
  initial begin
    $display("Time\tclk\treset\tq\t");
    $monitor ("%0t\t%b\t%b\t%b",$time,clk,reset,q);
    
    #10; reset=1;
    #10; reset=0;
    #40; reset=0;
    
    $finish;
    
  end 
endmodule

