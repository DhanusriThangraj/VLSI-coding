// design code
module subtraction(
  input [3:0]a,
  input [3:0]b,
  input cin,
  output [3:0]sub,
   output cout,
  output overflow);
  
  wire [4:0]temp_sub;
  
 
  assign temp_sub[4:0]=a-b-cin;
  assign sub = temp_sub[3:0];
  assign cout=temp_sub[4];
  
  assign overflow = (a[3]!=b[3])&&(sub[3]!=a[3]);
endmodule

// testbench
module subtraction_tb;
  reg [3:0]a;
  reg[3:0]b;
  reg cin;
  wire [3:0]sub;
  wire cout;
  wire overflow;
  
  subtraction uut (a,b,cin,sub,cout,overflow);
  initial begin
    $display("Time\ta\tb\tcin\tsub\tcout\toverflow");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t",$time,a,b,cin,sub,cout,overflow);
    
        a = 4'b0011; b = 4'b0100; cin = 0; #10;
        a = 4'b1100; b = 4'b0011; cin = 1; #10;
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1000; b = 4'b1000; cin = 1; #10;
        a = 4'b0110; b = 4'b1000; cin = 1; #10;
    
    $finish;
  end
endmodule
