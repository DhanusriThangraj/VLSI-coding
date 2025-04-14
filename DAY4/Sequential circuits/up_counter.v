module up_counter(clk,en,reset,count);
  input wire en;
  input wire reset;
  input wire clk;
  output reg [3:0]count;
  always @(posedge clk or posedge reset)
    if (reset) begin
      count<=4'b0000;
    end
  else if (en) begin
     count=count+1;
  end
endmodule

// testbench
module up_counter_tb;
  reg en,reset,clk;
  wire [3:0]count;
  up_counter uut(.en(en),.reset(reset),.clk(clk),.count(count));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("up_counter.vcd");
    $dumpvars(0,up_counter_tb);
  end
     initial begin
      $display("Time\ten\trst\tclk\tcount");
       $monitor("%0t\t%b\t%b\t%b\t%b",$time,en,reset,clk,count);
       
       
       #10; reset=1; en=0;
       #10; reset=0;
       #10; en=1;
       #10; en=0;
        reset = 1; en = 0; #10;
        reset = 0; en = 1; #150; 
        en = 0; #20;           
        en = 1; #30;          
       reset = 1; #10;               
    reset = 0; #20;
       #10;
       $finish; 
       end
      endmodule
