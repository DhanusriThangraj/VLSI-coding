// design code
module serial_adder_with_shift_register(
input clk,
input reset,
input [3:0]A,
input [3:0]B,
input start,
output reg [3:0]sum,
output reg done
 );
  
  reg [3:0]Ain;
  reg [3:0]Bin;
  reg carry;
  reg [2:0]count;
  reg active;
   
  always @(posedge clk or posedge reset)begin
    if (reset) begin
      Ain<=0;
      Bin<=0;
      sum<=0;
      carry<=0;
      count<=0;
      done<=0;
      active<=0;
    end
  else if(start) begin
      Ain<=A;
      Bin<=B;
      sum<=0;
      carry<=0;
      count<=0;
      done<=0;
      active<=1;
  end
  else  if (count<4)begin

    {carry, sum[count]} <= Ain[0] + Bin[0] + carry;
   Ain<=Ain>>1;
   Bin<=Bin>>1;
   count=count+1;
    if (count==3)begin
      done<=1;end
  end
  end
endmodule

// testbench
module serial_adder_with_shift_register_tb;
  
    reg clk, reset, start;
    reg [3:0] A, B;
    wire [3:0] sum;
    wire done;

   serial_adder_with_shift_register uut (
        .clk(clk),
     .reset(reset),
        .start(start),
        .A(A),
        .B(B),
        .sum(sum),
        .done(done)
    );

    
    always #5 clk = ~clk;

    initial begin
        $display("Time\tA\tB\tSum\tDone");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, A, B, sum, done);

        clk = 0;
        reset = 1;
        start = 0;
        #10;

        reset = 0;
        A = 4'b0101;   
        B = 4'b0011;   
        start = 1;
        #10;
        start = 0;

        #50; 
        $finish;
    end
endmodule

