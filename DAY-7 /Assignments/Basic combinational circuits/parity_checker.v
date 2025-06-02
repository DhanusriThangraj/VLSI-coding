// design code
module parity_checker(
  input wire [3:0]din,
  input wire parity_bit,
output reg even_parity,
output reg odd_parity);
  
  assign even_parity= ~((^din)^parity_bit);
  assign odd_parity=((^din)^parity_bit);
endmodule

// testbench
module parity_checker_tb;
  reg [3:0]din;
  reg parity_bit;
  wire even_parity;
  wire odd_parity;
   
  parity_checker uut (din,parity_bit,even_parity,odd_parity);
  initial begin
    $display("Time\tdin\tparity_bit\teven_parity\todd_parity");
    $monitor("%0t\t%b\t%b\t\t%b\t\t%b\t",$time,din,parity_bit,even_parity,odd_parity);
    
    din= 4'b0001; parity_bit=1;
     #5; din=4'b0011; parity_bit=1;
     #5; din=4'b1011; parity_bit=0;
     #5; din=4'b0011; parity_bit=1;
     #5; din=4'b1111; parity_bit=0;
    #5;$finish;
  end
    endmodule
