// design code
module ALU(
  input wire [3:0]a,
  input wire [3:0]b,
  input wire [1:0] sel,
  output reg [3:0]result,
  output reg carry_out,
  output reg zero,
  output reg overflow 
);
  wire[3:0]and_out;
  wire[3:0]or_out;
  wire[3:0]add_out;
  wire[3:0]sub_out;
  wire and_cout,sub_cout;
  wire add_ovf,sub_ovf;
  
  assign and_out= a&b;
  assign or_out = a|b;
  assign {add_cout,add_out}=a+b;
  assign {sub_cout,sub_out}=a-b;
   
  assign add_ovf = (a[3]==b[3])&&(add_out!=a[3]);
  assign sub_ovf = (a[3]!=b[3])&&(sub_out!=a[3]);
  
  always @(*) begin
    case (sel)
    2'b00:begin
      result=and_out;
      carry_out=0;
      overflow=0;
    end
     2'b01:begin
      result=or_out;
      carry_out=0;
      overflow=0;
    end
     2'b10:begin
      result=add_out;
      carry_out=add_cout;
      overflow=add_ovf;
    end
     2'b11:begin
      result=sub_out;
      carry_out=sub_cout;
      overflow=sub_ovf;
    end
    default:begin
      result=4'b0000;
      carry_out=0;
      overflow=0;
    end
    endcase
    zero=(result==4'b0000);
  end
endmodule

    // testbench
module ALU_tb;
  reg [3:0]a;
  reg [3:0]b;
  reg [1:0]sel;
  wire [3:0]result;
  wire carry_out;
  wire zero;
  wire overflow;
  
  ALU uut (a,b,sel,result,carry_out,zero,overflow);
  initial begin
    $display("Time\ta\tb\tsel\tresult\tcarry_out\tzero\toverflow\t");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t\t%b\t\t%b\t",$time,a,b,sel,result,carry_out,zero,overflow);
    
    #10;a=4'b0000; b=4'b0001; sel=2'b00;
    #10;a=4'b1110; b=4'b0001; sel=2'b01;
    #10;a=4'b1010; b=4'b0101; sel=2'b10;
    #10;a=4'b1100; b=4'b0011; sel=2'b11;
            // AND
        a = 4'b1100; b = 4'b1010; sel = 2'b00; #10;
        // OR
        a = 4'b1100; b = 4'b1010; sel = 2'b01; #10;
        // ADD
        a = 4'b0111; b = 4'b0001; sel = 2'b10; #10;
        a = 4'b1111; b = 4'b0001; sel = 2'b10; #10; // overflow case
        // SUB
        a = 4'b1000; b = 4'b0001; sel = 2'b11; #10;
        a = 4'b0000; b = 4'b0001; sel = 2'b11; #10; 
    #10;$finish;
  end 
endmodule
    
