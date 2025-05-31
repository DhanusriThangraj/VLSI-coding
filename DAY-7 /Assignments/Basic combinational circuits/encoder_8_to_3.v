// design code
module encoder_8_to_3(
  input wire clk,
  input wire enable,
  input wire [7:0]d,
  output reg [2:0]out
);
  always @(*) begin
    if (enable)begin
      case(d)
         8'b00000001:out=3'b000;
         8'b00000010:out=3'b001;
         8'b00000100:out=3'b010;
         8'b00001000:out=3'b011;
         8'b00010000:out=3'b100;
         8'b00100000:out=3'b101;
         8'b01000000:out=3'b110;
         8'b10000000:out=3'b111;
        
         default: begin 
          out=3'bxxx;
        end
    endcase
    end
  end
endmodule

// testbench
module encoder_8_to_3_tb;
  reg clk;
  reg enable ;
  reg [7:0]d;
  wire [2:0]out;
  encoder_8_to_3 uut (clk,enable,d,out);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $display ("Time\tclk\tenable\td\tout\t");
    $monitor ("%0t\t%b\t%b\t%b\t%b",$time,clk,enable,d,out);
    
    enable=0;
     #10; enable=1;
     #5; d=8'b00000001;
     #5; d=8'b00100000;
     #5; d=8'b00000100;
     #5; d=8'b00001000;
    $finish;
  end 
endmodule
