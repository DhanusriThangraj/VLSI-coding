// design code
module encoder_4_to_2(
  input wire clk,
  input wire enable,
  input wire [3:0]d,
  output reg [1:0]out
);
  always @(*) begin
    if (enable)begin
      case(d)
        4'b0001: out=2'b00;
        4'b0010: out=2'b01;
        4'b0100: out=2'b10;
        4'b1000: out=2'b11;
        default: begin 
          out=2'bxx;end
    endcase
    end
  end
endmodule

// testbench
module encoder_4_to_2_tb;
  reg clk;
  reg enable ;
  reg [3:0]d;
  wire [1:0]out;
  encoder_4_to_2 uut (clk,enable,d,out);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $display ("Time\tclk\tenable\td\tout\t");
    $monitor ("%0t\t%b\t%b\t%b\t%b",$time,clk,enable,d,out);
    
    enable=0;
    #10 enable=1;
    #5; d=4'b0001;
     #5; d=4'b0010;
     #5; d=4'b0100;
     #5; d=4'b1000;
    $finish;
  end 
endmodule
