// design code
module Addition (
  input [3:0]a,
  input [3:0]b,
  input cin,
  output [3:0]sum,
   output cout,
  output overflow);
  
  wire [4:0]temp_sum;
  
 
  assign temp_sum[4:0]=a+b+cin;
  assign sum = temp_sum[3:0];
  assign cout=temp_sum[4];
  
  assign overflow = (a[3]==b[3])&&(sum[3]!=a[3]);
endmodule

// testbench
module Addition_tb;
  reg [3:0]a;
  reg[3:0]b;
  reg cin;
  wire [3:0]sum;
  wire cout;
  wire overflow;
  
  Addition uut (a,b,cin,sum,cout,overflow);
  initial begin
    $display("Time\ta\tb\tsum\tcin\tcout\toverflow");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t",$time,a,b,cin,sum,cout,overflow);
    
        a = 4'b0011; b = 4'b0100; cin = 0; #10;
        a = 4'b1100; b = 4'b0011; cin = 1; #10;
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1000; b = 4'b1000; cin = 1; #10;
    $finish;
  end
endmodule
