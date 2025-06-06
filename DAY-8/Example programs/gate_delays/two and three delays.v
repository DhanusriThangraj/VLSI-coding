// design code
module gate_delays (input 	a, b,
            	output out1, out2 ,out3);	
  and 	   	#(3,5) o1 (out1, a, b);
  bufif0   	#(5,7) b1 (out2, a, b);
  or        #(7,9) a1 (out3, a, b);
endmodule

// design code
module gate_delays (input 	a, b,
            	output out1, out2 ,out3);
  bufif1 	#(3,5,6) o1 (out1, a, b);
  bufif0 	#(2,5,7) b1 (out2, a, b);
  notif1    #(2,6,9) a1 (out3, a, b);
  endmodule
// testbench
module gate_delays_tb;
  reg a, b;
  wire out1, out2, out3;

 gate_delays uut (a,b,out1,out2,out3);
 
  initial begin
    $display("Time\ta\tb\tout1\tout2\tout3");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,out1,out2,out3);
    
   $dumpfile("gate_delays.vcd");
   $dumpvars;
    
   {a, b} <= 0;
    #10 a <= 1;
    #10 b <= 1;
    #10 a <= 0;
    #10 b <= 0;
    #10; $finish;
  end
endmodule

// Basic gates (and, or, not, xor) only need 1 or 2 delays — they never go to Z.
// No 3rd delay needed because they don’t turn off or go to high-impedance (Z).


// Tri-state gates require all 3 delays to accurately simulate their enable/disable behavior.







