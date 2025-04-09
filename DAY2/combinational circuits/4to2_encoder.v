module encoder4to2(
  input wire [3:0]din,
  input wire en,
  output reg [1:0]out,
  output reg valid
);
  always @(*) 
    if (en) begin
      valid=1'b1;
      case(din)
        4'b0001: out=2'b00;
        4'b0010: out=2'b01;
        4'b0100: out=2'b10;
        4'b1000: out=2'b11;
        default: begin 
          out=2'bxx;
          valid=1'b1;
        end
        endcase
        
        end else begin
          out=2'bzz;
          valid=1'b0;
        end
        
        endmodule

// testbench
module encoder4to2_tb;
  reg[3:0]din;
   reg en;
   wire [1:0]out;
   wire valid;
  encoder4to2 uut (.din(din),
    .en(en),
    .out(out),
    .valid(valid));
  initial begin    
    $display("time\ten\tdin\tdout\tvalid");
    $monitor("%0dns\t%b\t%b\t%b\t%b", $time, en, din, out, valid);
    en=0; din=4'b0001; #10;
    en=1; din=4'b0001; #10;
    din=4'b0010; #10;
    din=4'b0100; #10;
    din=4'b1000; #10;
    
    din=4'b0110; #10;
    din=4'b0000; #10;
    en=0;din=4'b0100; #10;
    $finish;
  end 
endmodule
    
