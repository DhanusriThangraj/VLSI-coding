// 18. Design an 8-bit counter by using a forever loop, named block, and disabling of named block. 
//   The counter starts counting at count = 5 and finishes at count = 67. The count is incremented at positive edge of clock.
//   The clock has a time period of 10. The counter counts through the loop only once and then is disabled. (Hint: Use the disable statement).

module disable_block;
  reg clock;
  reg [7:0]count;
  initial begin
    $display("time\tclock\tcount\t");
    $monitor("%0t\t%b\t%d\t",$time,clock,count);
  end
  initial begin
    clock=0;
    forever #5 clock=~clock;
  end
  initial begin
    count=5;
    begin:counted_loop
      forever begin
        @(posedge clock)
        count=count+1; 
      end
      if (count<67) begin
        disable counted_loop;
        end
  end
  end
        endmodule
