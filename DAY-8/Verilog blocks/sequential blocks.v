Statements are wrapped using begin and end keywords and will be executed sequentially in the given order, one after the other. 

// design code
module seqential;
	bit [31:0] data;
	initial begin
      $display("Time\tdata");
      $monitor("%0t\t%d",$time,data);		
		#10   data = 4'b1010;
		#20   data = 5'b10111;
        #30   data = 4'b1101; 
        #40   data = 4'b1111; 
	end
endmodule

// outputs
Time	data
0	      0
10	    10
30	    23
60	    13
100	    15
