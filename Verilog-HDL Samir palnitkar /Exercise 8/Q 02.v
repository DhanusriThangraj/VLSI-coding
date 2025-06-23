module product;
function [7:0]product;
  input [3:0]a,b;
  begin 
    product=a*b;
  end
  endfunction
reg [3:0]a,b;
reg [7:0]result;
initial 
  begin
     a=4'd10;
     b=4'd12;
    result=product(a,b);
    $display("a*b=%d",result);
  end
endmodule
