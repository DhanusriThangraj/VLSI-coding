module priority_encoder4to2( input wire [3:0]d,
                            output reg  [1:0]y, output wire valid);
  assign y[1]=d[3]| d[2];
  assign y[0]=d[1]| d[3];
  assign valid=|d;
endmodule

// testbench
module priority_encoder4to2_tb;
  reg [3:0]d;
  wire [1:0]y;
  wire valid;
  priority_encoder4to2 uut (.d(d),.y(y),.valid(valid));
  initial begin
    $display("Time\t | d| y| valid");
    $monitor("0%t\t |%b |%b| %b",$time,d,y,valid);
       #10;  d=  4'b0000;
       #10;  d = 4'b0001; 
       #10; d = 4'b0010; 
       #10; d = 4'b0011; 
       #10;d = 4'b0100; 
       #10;d = 4'b0101; 
       #10;d = 4'b0110; 
       #10; d = 4'b0111; 
       #10; d = 4'b1000; 
       #10;d = 4'b1001; 
       #10; d = 4'b1010; 
       #10; d = 4'b1011; 
       #10; d = 4'b1100; 
       #10; d = 4'b1101; 
        #10;d = 4'b1110; 
       #10; d= 4'b1111; 
    #10;
  $finish;
  end 
endmodule
