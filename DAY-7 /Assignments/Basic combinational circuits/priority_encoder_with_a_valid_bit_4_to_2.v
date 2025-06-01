// design code
module priority_encoder_with_a_valid_bit_4_to_2 (
  input wire [3:0]in,
output reg valid,
  output reg [1:0]out);
  
  always @(*) begin
    casez(in) 
      4'b0001:begin
        out=2'b00;
        valid=1;
      end
      4'b001?:begin
      out=2'b01;
        valid=1;
      end
      4'b01??:begin
      out=2'b10;
        valid=1;
      end
      4'b1???:begin
      out=2'b11;
        valid=1;
      end
     
      default:
       begin 
          out=2'bxx;
         valid=0;
        end
   
    endcase
  end
endmodule

// testbench
module priority_encoder_with_a_valid_bit_4_to_2_tb;
  reg [3:0]in;
  wire valid;
  wire [1:0]out;
  priority_encoder_with_a_valid_bit_4_to_2 uut(.in(in),.valid(valid),.out(out));
  initial begin
    $display("Time\tin\tvalid\tout\t");
    $monitor ("%0t\t%b\t%b\t%b\t",$time,in,valid,out);

    in = 4'b0000; #10;
        in = 4'b0001; #10;
        in = 4'b0010; #10;
        in = 4'b0011; #10;
        in = 4'b0100; #10;
        in = 4'b0101; #10;
        in = 4'b0110; #10;
        in = 4'b0111; #10;
        in = 4'b1000; #10;
        in = 4'b1001; #10;
        in = 4'b1010; #10;
        in = 4'b1011; #10;
        in = 4'b1100; #10;
        in = 4'b1101; #10;
        in = 4'b1110; #10;
        in = 4'b1111; #10;

    #5; $finish;   
  end 
endmodule
  
