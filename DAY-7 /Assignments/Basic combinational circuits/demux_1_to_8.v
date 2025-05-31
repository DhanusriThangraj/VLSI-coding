// design code
module demux_1_to_8 (
  input wire [2:0]s,
  output reg [7:0]d,
   input wire y);
   always @(*) begin
      d=4'b0000;
     
   case(s)
     3'b000:d[0]=y;
     3'b001:d[1]=y;
     3'b010:d[2]=y;
     3'b011:d[3]=y;
     3'b100:d[4]=y;
     3'b101:d[5]=y;
     3'b110:d[6]=y;
     3'b111:d[7]=y;
   endcase
   end
endmodule

// testbench
module demux_1_to_8_tb;
  reg [2:0]s;
  wire[7:0]d;
  reg y;
  demux_1_to_8 uut (s,d,y);
  initial begin
    $display("Time\td\t\ts\ty\t");
    $monitor("%0t\t%b\t%b\t%b",$time,d,s,y);

    
     s=3'b000; y=1;
    #10; s=3'b001; 
    #10; s=3'b010;
    #10; s=3'b111; 
     #10;    s=3'b000; y=0;
    #10; s=3'b001; 
    #10; s=3'b010;
    #10; s=3'b011;
    $finish;
  end 
endmodule
