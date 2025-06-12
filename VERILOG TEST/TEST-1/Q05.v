// Generate a 100 Hz Clock from a 50 MHz Clock in Verilog
// design code
module generate_clock(
  input clk_50mhz,
 input reset,
 output reg clk_100hz);
  
  reg [18:0]counter;
  always @ (posedge clk_50mhz or posedge reset) begin
    if (reset) begin
      counter <= 19'd0;
      clk_100hz <= 1'b0;
    end
    else begin
      if (counter==19'd249999) begin
        counter <=19'd0;
        clk_100hz = ~clk_100hz;
      end
      else begin
        counter=counter+1;
      end
    end
  end
endmodule

// testbench
module generate_clock(
  input clk_50mhz,
 input reset,
 output reg clk_100hz);
  
  reg [18:0]counter;
  always @ (posedge clk_50mhz or posedge reset) begin
    if (reset) begin
      counter <= 19'd0;
      clk_100hz <= 1'b0;
    end
    else begin
      if (counter==19'd249999) begin
        counter <=19'd0;
        clk_100hz = ~clk_100hz;
      end
      else begin
        counter=counter+1;
      end
    end
  end
endmodule
        


