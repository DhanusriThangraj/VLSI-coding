// 18. Design an 8-bit counter by using a forever loop, named block, and disabling of named block. 
//   The counter starts counting at count = 5 and finishes at count = 67. The count is incremented at positive edge of clock.
//   The clock has a time period of 10. The counter counts through the loop only once and then is disabled. (Hint: Use the disable statement).

module counter;
  reg clk;
  reg[7:0]count;
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $display("Time\tclk\tcount");
    $monitor("%0t\t\t%0b\t%0d\t",$time,clk,count);
    #700; $finish;
  end
  
  initial begin
    count=5;
    begin:counter_loop
      forever begin
        @(posedge clk)
        count=count+1;
        
          if(count==67)begin
        disable counter_loop;
      end
      end  
    end        
  end
endmodule
