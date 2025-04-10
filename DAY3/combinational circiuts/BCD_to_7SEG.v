module bcd_to_7segment( input wire [3:0]bcd ,output reg [6:0]seg
                      ); 
  always @(*)
    begin
      case(seg)
        4'b0000: seg = 7'b1111110; 
        4'b0001: seg = 7'b0110000; 
        4'b0010: seg = 7'b1101101; 
        4'b0011: seg = 7'b1111001; 
        4'b0100: seg = 7'b0110011; 
        4'b0101: seg = 7'b1011011; 
        4'b0110: seg = 7'b1011111; 
        4'b0111: seg = 7'b1110000; 
        4'b1000: seg = 7'b1111111; 
        4'b1001: seg = 7'b1111011; 
        default: seg = 7'b0000000; 
      endcase
    end
endmodule


// testbench

module bcd_to_7segment_tb;
  reg [3:0]bcd;
  wire [6:0]seg;
  bcd_to_7segment uut(.bcd(bcd),.seg(seg));
  initial begin
    $display ("Time\tBCD\t7SEGMENT");
    $monitor("%0t\t%b\t%b",$time,bcd,seg);
    
    #10; bcd=4'd0;
    #10; bcd=4'd1;
    #10; bcd=4'd2;
    #10; bcd=4'd3;
    #10; bcd=4'd4;
    #10; bcd=4'd5;
    #10; bcd=4'd6;
    #10; bcd=4'd7;
    #10; bcd=4'd8;
    #10; bcd=4'd9;
    #10; bcd=4'd10;
    #10; bcd=4'd11;
    #10; bcd=4'd12;
    #10; bcd=4'd13;
    #10; bcd=4'd14;
    #10; bcd=4'd15;
    #10;
    $finish;
  end
endmodule
  
  
