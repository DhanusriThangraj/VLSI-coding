// design code
module binary_to_gray_code_converter
  (input wire [3:0]bin,
   output reg [3:0]gray);
  
  assign gray[3]=bin[3];
  assign gray[2]=bin[3]^bin[2];
  assign gray[1]=bin[2]^bin[1];
  assign gray[0]=bin[1]^bin[0];
endmodule
  // testbench
module binary_to_gray_code_converter_tb;
  reg [3:0]bin;
  wire [3:0]gray;
  binary_to_gray_code_converter uut (.bin(bin),.gray(gray));
  initial begin
    $display("Time\tbin\tgray\t");
    $monitor("%0t\t%b\t%b\t",$time,bin,gray);
    
    bin=4'b0000;
    #10; bin=4'b0010;
    #10; bin=4'b0110;
    #10; bin=4'b0001;
    #10; bin=4'b1100;
    #10; bin=4'b0110;
    #10; bin=4'b1000;
    #10; bin=4'b0110;
    #10; bin=4'b1100;
    
  end 
endmodule
        
