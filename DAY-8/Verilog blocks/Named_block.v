Both sequential and parallel blocks can be named and variables in a named block can be accessed by referring to its hierarchical name. 
The named blocks can also be terminated using the ‘disable’ keyword.

Both sequential and parallel blocks can be named by adding : name_of_block after the keywords begin and fork.
  By doing so, the block can be referenced in a disable statement.

  // design code
  module named_block;
  reg [3:0] i1, i2, i3;
  reg [3:0] x1, x2, x3;
   // sequential block
  initial begin: seq_blk1
    $display("Time\ti1\ti2\ti3\tx1\tx2\tx3");
    $monitor("%0t\t%d\t%d\t%d\t%d\t%d\t%d\t", $time, i1, i2, i3, x1, x2,x3);
    i1 = 3;
    i2 = 2;
    #4 i3 = 7;
  end
   initial begin: seq_blk2
    
    // Parallel block
    fork: par_blk1
      
      #10 x1 = i1;
      #5 x2 = i2;
      #6 x3 = i3;
    join
    #15 x1 = i1 + i2;
  end 
endmodule
  // output
Time	i1	i2	i3	x1	x2	x3
0	     3	 2	 x	 x	 x	 x	
4	     3	 2	 7	 x	 x	 x	
5   	 3	 2	 7	 x	 2	 x	
6	     3	 2	 7	 x	 2	 7	
10  	 3	 2	 7	 3	 2	 7	
25	   3	 2	 7	 5	 2	 7	

  
