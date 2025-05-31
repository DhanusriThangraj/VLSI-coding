// design code
module decoder_8_to_3(
  input wire clk,
  input wire enable,
  input wire [2:0]d,
  output reg [7:0]out
);
  always @(*) begin
    if (enable)begin
      case(d)
         3'b000:out=8'b00000001;
         3'b001:out=8'b00000010;
         3'b010:out=8'b00000100;
         3'b011:out=8'b00001000;
         3'b100:out=8'b00010000;
         3'b101:out=8'b00100000;
         3'b110:out=8'b01000000;
         3'b111:out=8'b10000000;
         default: begin 
          out=8'bxxxxxxxx;
        end
    endcase
    end
  end
endmodule
// testbench
module decoder_8_to_3_tb;
  reg clk;
  reg enable ;
  reg [2:0]d;
  wire [7:0]out;
  decoder_8_to_3 uut (clk,enable,d,out);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $display ("Time\tclk\tenable\td\tout\t");
    $monitor ("%0t\t%b\t%b\t%b\t%b",$time,clk,enable,d,out);
    
    enable=0;
     #10; enable=1;
     #5; d=3'b000;
     #5; d=3'b001;
     #5; d=3'b100;
     #5; d=3'b110;
    #22;$finish;
  end 
endmodule
