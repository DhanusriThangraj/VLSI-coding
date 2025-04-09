module demux1to4(
  input wire din,
  input wire[1:0] sel,
  output reg [3:0]dout
);
  always @(*) begin
      dout=4'b0000;
      case(sel)
        2'b00:dout[0]=din;
        2'b01:dout[1]=din;
        2'b10:dout[2]=din;
        2'b11:dout[3]=din;
        default : dout=4'b0000;
       
      endcase
  end
      endmodule

// testbench
module demux1to4_tb;
  reg din;
  reg [1:0]sel;
  wire [3:0]dout;
  demux1to4 dut (.din(din),
                 .sel(sel),
                 .dout(dout)
                );
  initial begin
    $display("Time\tsel\tdin\tdout");
    $monitor ("%0dns\t%b\t%b\t%b",$time,sel,din,dout);
    din=1'b1;sel=2'b00;#10;
    din=1'b1;sel=2'b01;#10;
    din=1'b1;sel=2'b10;#10;
    din=1'b1;sel=2'b11;#10;
    din=1'b0;sel=2'b00;#10;
    
    $finish;
  end 
endmodule
