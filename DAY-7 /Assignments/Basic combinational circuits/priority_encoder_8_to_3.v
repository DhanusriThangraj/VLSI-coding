//design code
module priority_encoder_8_to_3 (
  input wire [7:0]in,
output reg valid,
  output reg [2:0]out);
  
  always @(*) begin
    casez(in) 
      8'b00000001:begin
        out=3'b000;
        valid=1;
      end
      8'b0000001?:begin
        out=3'b001;
        valid=1;
      end
     8'b000001??:begin
        out=3'b010;
        valid=1;
      end
     8'b00001???:begin
        out=3'b011;
        valid=1;
      end
     8'b0001????:begin
        out=3'b100;
        valid=1;
      end
     8'b001?????:begin
        out=3'b101;
        valid=1;
      end
     8'b01??????:begin
        out=3'b110;
        valid=1;
      end
     8'b1???????:begin
        out=3'b111;
        valid=1;
      end
   default:
       begin 
          out=3'bxxx;
         valid=0;
        end
   
    endcase
  end
endmodule

//testbench
module priority_encoder_8_to_3_tb;
  reg [7:0]in;
  wire valid;
  wire [2:0]out;
  priority_encoder_8_to_3 uut(.in(in),.valid(valid),.out(out));
  initial begin
    $display("Time\tin\t\tvalid\tout\t");
    $monitor ("%0t\t%b\t%b\t%b\t",$time,in,valid,out);

  
        in = 8'b00000001; #10;
        in = 8'b00001101; #10;
        in = 8'b01100001; #10;
        in = 8'b00000001; #10;
        in = 8'b00000111; #10;
        in = 8'b11000001; #10;
        in = 8'b01100001; #10;
        in = 8'b00100001; #10;
       
    #5; $finish;   
  end 
endmodule
  
