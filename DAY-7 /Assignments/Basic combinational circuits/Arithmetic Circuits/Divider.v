// design code
module divider(
  input [3:0]dividend,
  input [3:0]divisor,
  output [3:0]quotient,
  output [3:0]reminder
);
  assign quotient=dividend/divisor;
  assign reminder=dividend%divisor;
endmodule

// testbench
module divider_tb;
  reg [3:0]dividend;
  reg [3:0]divisor;
  wire[3:0]quotient;
  wire[3:0]reminder;
  divider uut (dividend,divisor,quotient,reminder);
  initial begin
    $display("Time\tdividend\tdivisor\t\tquotient\treminder");
      $monitor("%0t\t%d\t\t%d\t\t%d\t\t%d",$time,dividend,divisor,quotient,reminder);
        dividend = 4'd9; divisor = 4'd2; #10;
        dividend = 4'd15; divisor = 4'd4; #10;
        dividend = 4'd8; divisor = 4'd3; #10;
        $finish;
  end
endmodule
