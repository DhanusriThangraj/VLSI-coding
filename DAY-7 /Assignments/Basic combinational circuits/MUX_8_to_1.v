module mux_8_to_1(input [2:0]s,
                  input d0,d1,d2,d3,d4,d5,d6,d7,
                  output reg y);
  always @ (*) begin
    case (s)
      3'b000:y=d0;
      3'b001:y=d1;
      3'b010:y=d2;
      3'b011:y=d3;
      3'b100:y=d4;
      3'b101:y=d5;
      3'b110:y=d6;
      3'b111:y=d7;
    endcase
  end
endmodule


// testbench
module mux_8_to_1_tb;
  reg [2:0]s;
   reg d0,d1,d2,d3,d4,d5,d6,d7;
   wire y;
   mux_8_to_1 uut (s,d0,d1,d2,d3,d4,d5,d6,d7,y);
  initial begin
    $display("Time\ts\td0\td1\td2\td3\td4\td5\td6\td7\ty\t");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",$time,s,d0,d1,d2,d3,d4,d5,d6,d7,y);
    
   d0=1; d1=1; d2=0; d3=1; d4=1; d5=0;
    d6=1; d7=1;
    
    s=3'b000;
     #10 s=3'b001;
     #10 s=3'b010;
     #10 s=3'b011;
     #10 s=3'b100;
     #10 s=3'b101;
     #10 s=3'b110;
     #10 s=3'b111;
    $finish;
  end
endmodule
    
    
    
    
    
    
  
