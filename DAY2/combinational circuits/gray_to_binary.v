module gray_to_binary(input [3:0]gray, output [3:0]binary);
assign binary[3] = gray[3];
assign binary[2] = binary[3]^gray[2];
assign binary[1] = binary[2]^gray[1];
assign binary[0] = binary[1]^gray[0];
endmodule


// testbench
module gray_to_binary_testbench_tb;
reg [3:0]gray;
wire [3:0]binary;
gray_to_binary uut (.gray(gray),.binary(binary));
initial begin
  $display("Time\t gray | binary");
  $monitor("%0t\t %b | %b" ,$time,gray,binary);
#10; gray=4'b0000;
#10; gray=4'b0001;
#10; gray=4'b0010;
#10; gray=4'b0011;
#10; gray=4'b0100;
#10; gray=4'b0101;
#10; gray=4'b0110;
#10; gray=4'b0111;
#10; gray=4'b1000;
#10; gray=4'b1001;
#10; gray=4'b1010;
#10; gray=4'b1011;
#10; gray=4'b1100;
#10; gray=4'b1101;
#10; gray=4'b1110;
#10; gray=4'b1111;
#10;
$finish;
end
endmodule
