module magnitude_comparator( input wire [3:0]a, input wire [3:0]b,
output reg a_greater,output reg a_equal,output reg a_lesser );
  assign a_greater = a>b;
  assign a_equal = a==b;
  assign a_lesser = a<b;
endmodule

// testbench
module magnitude_comparator_tb;
  reg [3:0]a;
  reg[3:0]b;
  wire  a_greater,a_equal,a_lesser;
  magnitude_comparator uut(.a(a),.b(b),.a_greater(a_greater),.a_equal(a_equal),.a_lesser(a_lesser));
  initial begin 
    $dispaly("Time\t a b | a_greater |a_equal | a_lesser");
    $monitor("%0t\t %b %b | %b %b %b",$time,a,b,a_greater,a_equal,a_lesser);
            a= 4'b0000; b = 4'b0000; #10;
        #10;a = 4'b0010; b = 4'b0001; 
        #10;a = 4'b0101; b = 4'b1000; 
        #10;a = 4'b1111; b = 4'b1111; 
        #10;a = 4'b0110; b = 4'b0111; 
        #10;a = 4'b1010; b = 4'b1001;
        #10;
    $finish;
  end
endmodule
    
