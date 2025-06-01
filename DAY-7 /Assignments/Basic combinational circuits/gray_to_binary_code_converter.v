// design code
module gray_to_binary_code_converter
  (input wire [3:0]gray,
   output reg [3:0]bin);
  
  assign bin[3]=gray[3];
  assign bin[2]=bin[3]^gray[2];
  assign bin[1]=bin[2]^gray[1];
  assign bin[0]=bin[1]^gray[0];
endmodule

// testbench
module gray_to_binary_code_converter_tb;
  reg [3:0]gray;
  wire [3:0]bin;
  gray_to_binary_code_converter uut (.gray(gray),.bin(bin));
  initial begin
    $display("Time\tgray\tbin\t");
    $monitor("%0t\t%b\t%b\t",$time,gray,bin);
    
    gray=4'b0000;
    #10; gray=4'b0010;
    #10; gray=4'b0110;
    #10; gray=4'b0001;
    #10; gray=4'b1100;
    #10; gray=4'b0110;
    #10; gray=4'b1000;
    #10; gray=4'b0110;
    #10; gray=4'b1100;
    
  end 
endmodule
