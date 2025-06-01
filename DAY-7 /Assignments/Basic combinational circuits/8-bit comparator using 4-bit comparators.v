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

module comparator_8_bit(
  input wire [7:0]a,
  input wire [7:0]b,
  output reg a_greater_b,
  output reg a_lesser_b,
  output reg a_equal_b);
  
  wire high_gt,high_ls,high_eq;
  wire low_gt,low_ls,low_eq;
  comparator_4_bit BC_1 (.a(a[3:0]),.b(b[3:0]),.a_greater_b(low_gt),.a_lesser_b(low_ls),.a_equal_b(low_eq));
  comparator_4_bit BC_2 (.a(a[3:0]),.b(b[3:0]),.a_greater_b(high_gt),.a_lesser_b(high_ls),.a_equal_b(high_eq));
  
  assign a_greater_b=high_gt|(high_eq&low_gt);
  assign a_lesser_b= high_ls|(high_eq&low_ls);
  assign a_equal_b=high_eq & low_eq;
   
endmodule
// testbench
module comparator_8_bit_tb;
  reg [7:0]a;
  reg [7:0]b;
  wire a_greater_b;
  wire a_lesser_b;
  wire a_equal_b;
  comparator_8_bit uut  (a,b,a_greater_b,a_lesser_b,a_equal_b);
  initial begin 
    $display ("Time\ta\t\tb\t\ta_greater_b\ta_lesser_b\ta_equal_b");
    $monitor("%0t\t%b\t%b\t\t%b\t\t%b\t\t%b",$time,a,b,a_greater_b,a_lesser_b,a_equal_b);
    
    #10;a=8'b1000;  b=8'b0100;
    #10;a=8'b1100;  b=8'b0100;
    #10;a=8'b1010;  b=8'b0100;
    #10;a=8'b1000;  b=8'b0110;
    #10;a=8'b1000;  b=8'b1100;
    #10;a=8'b1000;  b=8'b1000;
    #14;
    $finish;
    
  end
endmodule

