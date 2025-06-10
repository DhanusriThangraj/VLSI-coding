Using the for loop, initialize locations 0 to 1023 of a 4-bit register array cache_var to 0. 

  // design code
  module cache_vars;
  reg [3:0] cache_vars [0:1023];
  integer i;
  initial begin
    $display("Time\tcache_vars\t");
     end
  initial begin
    for (i = 0; i <= 1023; i = i + 1)
      begin
        cache_vars[i]=0;
         $display("%0d\t%0b", i, cache_vars[i]);
     end
  end
endmodule

// output
Time	cache_vars	
0	0
1	0
2	0
3	0
4	0
5	0
6	0
7	0
8	0
.  .

.  .
.  .
.   .
.   .
1023 0

