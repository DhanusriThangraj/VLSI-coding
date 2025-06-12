// Design 8:3 priority encoder using casez statements. 

// design code
module priority_encoder(
  input [7:0]d,
  output reg [2:0]out);
  
  always @(d) begin
    casez (d)
      8'b00000001:out=3'b000;
      8'b0000001?:out=3'b001;
      8'b000001??:out=3'b010;
      8'b00001???:out=3'b011;
      8'b0001????:out=3'b100;
      8'b001?????:out=3'b101;
      8'b01??????:out=3'b110;
      8'b1???????:out=3'b111;
      default:out=3'bxxx;
    endcase
  end
    endmodule

// testbench
module priority_encoder_tb;
  reg [7:0]d;
  wire [2:0]out;
  priority_encoder uut (d,out);
  initial begin
    $display("Time\td\t\tout\t");
    $monitor("%0t\t%b\t%b\t",$time,d,out);
     
    #10; d=8'b00010101;
    #10; d=8'b00010001;
    #10; d=8'b11010101;
    #10; d=8'b11010101;
    #10; d=8'b00010001;
    #10; d=8'b11110101;
  end
endmodule


// output
Time	   d		out	
0	  xxxxxxxx	xxx	
10	00010101	100	
20	00010001	100	
30	11010101	111	
50	00010001	100	
60	11110101	111
