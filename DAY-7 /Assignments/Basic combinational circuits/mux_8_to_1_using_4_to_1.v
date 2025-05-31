// design code
module mux_8_to_1_using_4_to_1(
  input wire [7:0] in,
  input wire [2:0] sel,
  output reg out
);
  wire [3:0] mux_a = in[3:0];  
  wire [3:0] mux_b = in[7:4];  

  always @(*) begin
    case(sel[2])
      1'b0: begin
        case(sel[1:0])
          2'b00: out = mux_a[0];
          2'b01: out = mux_a[1];
          2'b10: out = mux_a[2];
          2'b11: out = mux_a[3];
          default: out = 1'b0;
        endcase
      end
      1'b1: begin
        case(sel[1:0])
          2'b00: out = mux_b[0];
          2'b01: out = mux_b[1];
          2'b10: out = mux_b[2];
          2'b11: out = mux_b[3];
          default: out = 1'b0;
        endcase
      end
      default: out = 1'b0;
    endcase
  end
endmodule

// testbench
module mux_8_to_1_using_4_to_1_tb;
  reg [7:0]in;
  reg[2:0] sel;
  wire out;
   mux_8_to_1_using_4_to_1 uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  initial begin 
    $display ("Time\tin\t\tsel\tout\t");
    $monitor ("%0t\t%b\t%b\t%b\t",$time,in,sel,out);
    in=8'b01010110;
          sel=3'b000;
      #5; sel=3'b001;
      #5; sel=3'b010;
      #5; sel=3'b011;
      #5; sel=3'b100;
      #5; sel=3'b101;
      #5; sel=3'b100;
      #5; sel=3'b111;
    #1; $finish;
  end
endmodule
    
