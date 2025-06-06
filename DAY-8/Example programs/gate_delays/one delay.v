// design code
module gate_delays (input 	a, b,
            	output out1, out2 ,out3);
  and 		#(7) o1 (out1, a, b);
  bufif0 	#(3) b1 (out2, a, b);
  or      #(5) a1 (out3, a, b);

endmodule

// testbench
module gate_delays_tb;
  reg a, b;
  wire out1, out2, out3;
  gate_delays uut (.out1(out1), .out2(out2),.out3(out3) .a(a), .b(b));
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
