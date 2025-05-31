// design code
module demux_1_to_4 (
  input wire [1:0]s,
  output reg [3:0]d,
   input wire y);
   always @(*) begin
      d=4'b0000;
     
   case(s)
     2'b00:d[0]=y;
     2'b01:d[1]=y;
     2'b10:d[2]=y;
     2'b11:d[3]=y;
   endcase
   end
endmodule

// testbench 
module demux_1_to_4_tb;
  reg [1:0]s;
  wire[3:0]d;
  reg y;
  demux_1_to_4 uut (s,d,y);
  initial begin
    $display("Time\td\ts\ty\t");
    $monitor("%0t\t%b\t%b\t%b",$time,d,s,y);

    
     s=2'b00; y=1;
    #10; s=2'b01; 
    #10; s=2'b10;
    #10; s=2'b11;
         s=2'b00; y=0;
    #10; s=2'b01; 
    #10; s=2'b10;
    #10; s=2'b11;
    $finish;
  end 
endmodule
