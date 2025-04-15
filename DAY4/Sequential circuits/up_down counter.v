// Code your design here
module up_down_counter(clk,reset,up_down,count);
  input wire clk;
  input wire reset;
  input wire up_down;
  output reg [3:0]count;
  always @(posedge clk or posedge reset)
    if (reset) begin
      count<=4'b0000;
    end else begin
      if (up_down) begin
     count <=count+1;
      end else  begin
       count <=count-1;
    end     
  end
 
endmodule

// testbench
module up_down_counter_tb;
  reg clk;
  reg reset;
  reg up_down;
  wire count;
  up_down_counter uut(clk,reset,up_down,count);
  initial begin 
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("up_down_counter.vcd");
    $dumpvars(0,up_down_counter_tb);
  end
   initial begin
     $display("Time\tclk\treset\tup_down\tcount\t");
     $monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,reset,up_down,count);
     
     #10;reset =1; 
     #10; up_down =1;
     #20; up_down=0;
     #20;reset =0;
     #50;up_down = 1;
     #80;up_down = 0;
     #10;reset = 1;
     #30;reset = 0;
        
     $finish;
   end
     endmodule
     
     
