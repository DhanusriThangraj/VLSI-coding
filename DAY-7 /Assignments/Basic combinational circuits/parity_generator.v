// design code
module parity_generator(
  input wire [3:0]din,
output reg even_parity,
output reg odd_parity);
  assign even_parity= ~(^din);
  assign odd_parity=~din;
endmodule

// testbench
module parity_generator_tb;
  reg [3:0]din;
  wire even_parity;
  wire odd_parity;
   
  parity_generator uut (din,even_parity,odd_parity);
  initial begin
    $display("Time\tdin\teven_parity\todd_parity");
    $monitor("%0t\t%b\t%b\t\t%b\t",$time,din,even_parity,odd_parity);
    
    din= 4'b0001;
     #5; din=4'b0011;
     #5; din=4'b1011;
     #5; din=4'b0011;
     #5; din=4'b1111;
    #5;$finish;
  end
    endmodule
    
