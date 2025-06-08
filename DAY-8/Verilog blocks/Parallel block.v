A parallel block can execute statements concurrently and delay control can be used to provide time-ordering of the assignments. 
Statements are launched in parallel by wrapping them within the fork and join keywords.

// design code
module parallel;
	bit [31:0] data;
	initial fork
      $display("Time\tdata");
      $monitor("%0t\t%d",$time,data);		
		#10   data = 4'b1010;
		#20   data = 5'b10111;
     #30   data = 4'b1101; 
     #40   data = 4'b1111; 
    join
endmodule

// output
Time	data
0	       0
10	     10
20	     23
30	     13
40	     15
