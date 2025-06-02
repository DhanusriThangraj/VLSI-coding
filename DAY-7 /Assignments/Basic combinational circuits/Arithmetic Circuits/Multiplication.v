// design code
module multiplication(
  input [3:0]a,
  input [3:0]b,
  output [7:0]out);
  
  assign out=a*b;
endmodule

// testbench
module multiplication_tb;
  reg [3:0]a;
  reg [3:0]b;
  wire [7:0]out;
  multiplication uut (a,b,out);
  initial begin 
    $display("Time\ta\tb\tout\t");
    $monitor("%0t\t%d\t%d\t%d\t",$time,a,b,out);
    
        a=4'd11; b=4'd12; #10;
        a=4'd18; b=4'd14; #10;
        a=4'd2; b=4'd2; #10;
    $finish;
  end 
endmodule
