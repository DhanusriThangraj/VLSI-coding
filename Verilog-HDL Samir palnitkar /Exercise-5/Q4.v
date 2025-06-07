// design code
module SR_latch(input wire set,reset,
               output reg q,qbar);
  nor #(1)(q,set,qbar);
  nor #(1)(qbar,reset,q);
endmodule
// testbench
module sr_latch_tb;
  reg set,reset;
  wire q,qbar;
  SR_latch uut(set,reset,q,qbar);
  initial begin
    $display("Time\tset\treset\tq\tqbar");
    $monitor("%0t\t%b\t%b\t%b\t%b",$time,set,reset,q,qbar);
     
     #10; set=0; reset=0;
     #10; set=0; reset=1;
     #10; set=1; reset=0;
     #10; set=1; reset=1;
     
     #10;$finish;
  end
endmodule
