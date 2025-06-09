// Declare a register called oscillate.
// Initialize it to 0 and make it toggle every 30 time units.
// Do not use always statement (Hint: Use the forever loop). 

// design code
module oscillate;
  reg oscillate;
  
  initial begin
    $display("Time\toscillate\t");
    $monitor("%0t\t%b",$time,oscillate); end
  initial begin
     oscillate =0;
    forever #30 oscillate=~oscillate;end
  initial 
    #1000 $finish; 
endmodule

// output
Time	oscillate	
0	0
30	1
60	0
90	1
120	0
150	1
180	0
210	1
240	0
270	1
300	0
330	1
360	0
390	1
420	0
450	1
480	0
510	1
540	0
570	1
600	0
630	1
660	0
690	1
720	0
750	1
780	0
810	1
840	0
870	1
900	0
930	1
960	0
990	1
