// design code
module comparator_4_bit(
  input wire [3:0]a,
  input wire [3:0]b,
  output reg a_greater_b,
  output reg a_lesser_b,
  output reg a_equal_b
  );
  assign a_greater_b=(a>b);
  assign a_lesser_b =(a<b);
  assign a_equal_b  =(a==b);
endmodule

// testbench 
module comparator_4_bit_tb;
  reg [3:0]a;
  reg [3:0]b;
  wire a_greater_b;
  wire a_lesser_b;
  wire a_equal_b;
  comparator_4_bit uut (a,b,a_greater_b,a_lesser_b,a_equal_b);
  initial begin
    $display("Time\ta\tb\ta_greater_b\ta_lesser_b\ta_equal_b\t");
    $monitor("%0t\t%b\t%b\t%b\t\t%b\t\t%b",$time,a,b,a_greater_b,a_lesser_b,a_equal_b);
        a=4'b0000;  b=4'b0100;
    #10;a=4'b1000;  b=4'b0100;
    #10;a=4'b1100;  b=4'b0100;
    #10;a=4'b1010;  b=4'b0100;
    #10;a=4'b1000;  b=4'b0110;
    #10;a=4'b1000;  b=4'b1100;
    #10;a=4'b1000;  b=4'b1000;
  end
endmodule
