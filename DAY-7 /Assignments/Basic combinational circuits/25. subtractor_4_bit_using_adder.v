// design code
module  subtractor_4_bit_using_adder(
  input [3:0]a,
  input [3:0]b,
  output [3:0]diff,
  output borrow
   );
  
  wire [3:0]b_complement;
  wire cout;
 
  assign b_complement=~b;
  assign {cout,diff}=a+(b_complement+1);
  assign borrow=~cout;
endmodule

// testbench
module subtractor_4_bit_using_adder_tb;
  reg [3:0]a;
  reg [3:0]b;
  wire [3:0]diff;
  wire borrow;
 
  subtractor_4_bit_using_adder uut (a,b,diff,borrow);
  
  initial begin
    $display("Time\ta\tb\tdiff\tborrow\t");
    $monitor("%0t\t%b\t%b\t%b\t%b",$time,a,b,diff,borrow);
    
        a = 4'b0110; b = 4'b0011; #10; 
        a = 4'b0101; b = 4'b0101; #10; 
        a = 4'b0010; b = 4'b0100; #10; 
        a = 4'b1001; b = 4'b0001; #10; 
        a = 4'b0000; b = 4'b0001; #10; 
    #10;$finish;
  end
endmodule
  
