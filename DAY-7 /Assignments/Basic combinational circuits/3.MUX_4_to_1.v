module mux_4_to_1 (
  input wire [1:0]s,
  input wire d0,d1,d2,d3,
   output reg y);
   always @(*) begin
     
   case(s)
    2'b00:y=d0;
    2'b01:y=d1;
    2'b10:y=d2;
    2'b11:y=d3;
     default:y=1'b0;
  endcase
  end
endmodule


// testbench
module mux_4_to_1_tb;
  reg [1:0]s;
  reg d0,d1,d2,d3;
  wire y;
  mux_4_to_1 uut (s,d0,d1,d2,d3,y);
  initial begin
    $display("Time\td0\td1\td2\td3\ts\ty\t");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b",$time,d0,d1,d2,d3,s,y);
    d0=1; d2=1;
    d3=0;
    d1=0;
    
     s=2'b00;
    #10; s=2'b01;
    #10; s=2'b10;
    #10; s=2'b11;
    $finish;
  end 
endmodule
    
