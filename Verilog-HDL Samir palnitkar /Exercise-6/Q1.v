// design code
module full_subtractor(
  input x,y,z,
  output reg D,B);
  
  assign D=((~x)&(~y)&z)|((~x)&y&(~z))|(x&(~y)&(~z))|(x&y&z);
  assign B=((~x)&y)|((~x)&z)|(y&z);
endmodule

// testbench
module full_subtractor_tb;
  reg x,y,z;
  wire D,B;
  
  full_subtractor uut (x,y,z,D,B);
  initial begin
    $display("Time\tx\ty\tz\tD\tB");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,x,y,z,D,B);
    
         x=0; y=0; z=0;
    #10; x=0; y=0; z=1;
    #10; x=0; y=1; z=0;
    #10; x=0; y=1; z=1;
    #10; x=1; y=0; z=0;
    #10; x=1; y=0; z=1;
    #10; x=1; y=1; z=0;
    #10; x=1; y=1; z=1;
    #10; $finish;
  end 
endmodule
