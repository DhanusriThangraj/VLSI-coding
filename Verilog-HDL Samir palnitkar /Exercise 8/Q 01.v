// Define a function to calculate the factorial of a 4-bit number.
//The output is a 32-bit value. Invoke the function by using stimulus and check results.

module factorial;
function automatic integer factorial;
  input [3:0] fact;
  begin
    if (fact>=2)
      factorial = factorial (fact-1)* fact;
    else 
      factorial=1;
  end 
endfunction
integer result;
initial begin
  result= factorial(4);
$display("factorial of 10 is %d",result); end
endmodule
