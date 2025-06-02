// design code
module barrel_shifter_left_and_right_4bit(
  input [3:0]din,
  input dir,
  input [1:0]shift_amt,
  output [3:0]dout);
  
  assign dout= (dir==1'b0)?(din<<shift_amt):(din>>shift_amt);
endmodule

// testbench
module barrel_shifter_left_and_right_4bit_tb;
  reg [3:0]din;
  reg dir;
  reg  [1:0]shift_amt;
  wire [3:0] dout;
  barrel_shifter_left_and_right_4bit uut (din,dir,shift_amt,dout);
  
 initial begin 
   $display("Time\tdin\tdir\tshift_amt\tdout\t");
   $monitor("%0t\t%b\t%b\t%d\t\t%b",$time,din,dir,shift_amt,dout);
   
   #1; dir=0; din=4'b0001; shift_amt=00;
   #5; dir=0; din=4'b0101; shift_amt=11;
   #5; dir=1; din=4'b0111; shift_amt=10;
   #5; dir=1; din=4'b1101; shift_amt=10;
   #5; dir=1; din=4'b1001; shift_amt=01;
 end 
endmodule
