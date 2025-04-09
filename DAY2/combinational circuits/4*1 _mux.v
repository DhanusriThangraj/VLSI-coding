module mux4to1(input wire [1:0] sel,    
    input wire d0, d1, d2, d3, 
    output reg y    );
always @(*)begin
case(sel)
    2'b00: y=d0;
    2'b01: y=d1;
    2'b10: y=d2;
    2'b11: y=d3;
 default:y= 1'b0;
endcase
endmodule


// testbench
module mux4to1_tb
  reg [1:0]sel;
  reg d0,d1,d2,d3;
wire y;
4*1mux uut(.sel(sel),.d0(d0),
           .d1(d1),
           .d2(d2),
           .d3(d3),
           .y(y));
initial begin
  $display("Time\t sel d0 d1 d2 d3 |y ");
  $monitor("%0t\t %b %b %b %b %b| %b",$time,d0,d1,d2,d3,y);
d0=1; d1=0; d2=1; d3=0;
 sel=2'b00;#10;
 sel=2'b01;#10;
 sel=2'b10;#10;
 sel=2'b11;#10;
  
$finish;
end
endmodule
