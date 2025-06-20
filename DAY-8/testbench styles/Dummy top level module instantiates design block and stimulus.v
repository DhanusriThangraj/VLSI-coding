// design code
module ripple_carry_counter(input clk,
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
//testbench
module ripple_carry_counter_tb(
  output reg d_clk,
  output reg d_reset,
  input wire [3:0]d_q);
   initial begin 
     d_clk=0;
     forever #5d_clk= ~d_clk;
   end
  
  initial begin
    $display("Time\td_clk\td_reset\td_q\t");
    $monitor("%0t\t%b\t%b\t%b",$time,d_clk,d_reset,d_q);
    
    #10; d_reset=1;
    #10; d_reset=0;
    #40; d_reset=0;
    
    $finish;
    
  end 
endmodule

// dummu top level module
module dummy_top_level_module;
  reg clk1,reset1;
  wire [3:0]q1;
  ripple_carry_counter uut1 (.clk(clk1),.reset(reset1),.q(q1));
  
  ripple_carry_counter_tb uut2 (.d_clk(clk1),.d_reset(reset1),.d_q(q1));
  
endmodule
  
