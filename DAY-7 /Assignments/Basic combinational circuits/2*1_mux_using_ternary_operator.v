// design code

module mux_2_to_1 (
  input wire [1:0]i,
  input wire s,
  output reg out
);
  assign out=s?i[1]:i[0];
endmodule

// testbench
module mux_2_to_1_tb;
  reg [1:0]i;
  reg s;
  wire out;
  mux_2_to_1 uut (i,s,out);
  initial begin
    $display ("Time\ti\ts\tout\t");
    $monitor ("%0t\t%b\t%b\t%b",$time,i,s,out);
    #3;s=0;i=01;
    #1; s=0; i=11;
    #5; s=1; i=10;
    #1; s=1; i=11;
    #5; s=0; i=10;
    #17;$finish;
  end
endmodule
    
