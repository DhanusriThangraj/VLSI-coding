// design code
module multiplier_using_shift_add(
input clk,
input rst,
input start,
  input [3:0]A,
  input [3:0]B,
  output reg [7:0]product,
 output reg done);
  
  reg [3:0]Ain;
  reg [3:0]Bin;
  reg [7:0]temp_product;
  reg [2:0]count;
  reg active;
  
  always @(posedge clk or posedge rst) begin
    if(rst)begin
      temp_product<=0;
      Ain<=0;
      Bin<=0;
      count<=0;
      done<=0;
      active<=0;
      product<=0;
    end
      
    if(start&&!active)begin
      temp_product<=0;
      Ain<=A;//multiplicand
      Bin<=B;//multiplier
      count<=0;
      done<=0;
      active<=1;
    end
    else if (active)begin
      if (Bin[0]==1)begin
        temp_product=temp_product+(Ain<<count);
      end
      
      Bin<=Bin>>1;
      count<=count+1;
      
      if (count==3'd3)begin
        product<=temp_product;
        done<=1;
       
      end
    end
  end
endmodule


// testbench
module multiplier_using_shift_add_tb;
  reg clk;
  reg rst;
  reg start;
  reg[3:0]A;
  reg [3:0]B;
  wire [7:0] product;
  wire done;
  
  multiplier_using_shift_add uut (clk,rst,start,A,B,product,done);
  
  initial begin
    clk=0;
    forever #10 clk=~clk;
  end
   initial begin
     $display("Time\tclk\trst\tstart\tA\tB\tproduct\tdone");
     $monitor("%0t\t%b\t%b\t%b\t%d\t%d\t%d\t%b",$time,clk,rst,start,A,B,product,done);
   rst = 1; start = 0; A = 4'd12; B = 4'd11;
    #20;
    rst = 0;

    
    start = 1;
    #20;
    start = 0;

   
    wait(done == 1);   
    #10;
    
     #10;$finish;
      
   end
endmodule
     
     
     
     
