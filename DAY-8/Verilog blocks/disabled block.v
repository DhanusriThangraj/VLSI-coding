The disable statement in Verilog is used to terminate execution of a named block (which could be a begin...end block or a named loop).
It is used to exit loops or blocks early, similar to a break in other programming languages but for named blocks.

// design code
module disabled;
  integer count = 0;
  // Disable below count_loop block
  initial begin
    begin: count_loop
      forever begin
        count++;
        $display("Time\tcount");
        $monitor("%0t\t%d",$time,count);
        if(count == 10) disable count_loop;
        #10;
        
      end
    end
  end
endmodule

// output
Time	count
0          1
Time	count
10          2
Time	count
20          3
Time	count
30          4
Time	count
40          5
Time	count
50          6
Time	count
60          7
Time	count
70          8
Time	count
80          9
Time	count
90         10
