// design code
module decoder_4_to_2(
  input wire clk,
  input wire enable,
  input wire [1:0]d,
  output reg [3:0]out
);
  always @(*) begin
    if (enable)begin
      case(d)
         2'b00:out=4'b0001;
         2'b01:out=4'b0010;
         2'b10:out=4'b0100;
         2'b11:out=4'b1000;
        
         default: begin 
          out=4'b0000;
        end
    endcase
    end
  end
endmodule

// testbench
module decoder_4_to_2_tb;
  reg clk;
  reg enable ;
  reg [1:0]d;
  wire [3:0]out;
  decoder_4_to_2 uut (clk,enable,d,out);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $display ("Time\tclk\tenable\td\tout\t");
    $monitor ("%0t\t%b\t%b\t%b\t%b",$time,clk,enable,d,out);
    
    enable=0;
     #10; enable=1;
     #5; d=2'b00;
     #5; d=2'b01;
     #5; d=2'b10;
     #5; d=2'b11;
      #5; d=3'b11x;
    
    #2;$finish;
  end 
endmodule
