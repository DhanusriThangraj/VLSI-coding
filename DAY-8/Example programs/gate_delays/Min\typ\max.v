

// design code
module gate_delays (input 	a, b,
                    output out1, out2 ,out3);
  and 	#(3:5:7,1:2:4)o1 (out1, a, b);
  bufif0 	#(1:2:5,2:4:5) b1 (out2, a, b);
  or        #(1:3:7,3:5:9) a1 (out3, a, b);
endmodule
// testbench
module gate_delays_tb;
  reg a, b;
  wire out1, out2, out3;
gate_delays uut (a,b,out1,out2,out3);
 initial begin
    $display("Time\ta\tb\tout1\tout2\tout3");    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,out1,out2,out3);
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


| Time | out1    | out2    | out3    | Explanation                  |
| ---- | ------- | ------- | ------- | ---------------------------- |
| 0    | x→0\@2  | x→0\@2  | x→0\@4  | Initial values settling      |
| 10   | 0       | 0       | 0       | Inputs change, no output yet |
| 13   | 0       | 0→1\@13 | 0       | bufif0 rising delay          |
| 15   | 0       | 1       | 0→1\@15 | OR rising delay              |
| 20   | 0       | 1       | 1       | `b` changes                  |
| 23   | 0       | 1→z\@23 | 1       | bufif0 fall delay            |
| 25   | 0→1\@25 | z       | 1       | AND rise delay               |
| 30   | 1       | z       | 1       | Inputs change                |
| 32   | 1→0\@32 | z       | 1       | AND fall delay               |
| 40   | 0       | z       | 1       | `b` changes                  |
| 44   | 0       | z→0\@44 | 1       | bufif0 fall delay            |
| 45   | 0       | 0       | 1→0\@45 | OR fall delay                |
| 47   | 0       | 0       | 0       | Final steady state           |

// out1 (AND gate)
// Delay: rise = 5, fall = 2


// out2 (bufif0 gate)
// Delay: rise = 2, fall = 4
// bufif0 enables driving output when b=0
// Output is high impedance (z) when b=1

// out3 (OR gate)
// Delay: rise = 3, fall = 5

//  #(3:5:7,1:2:4)
// 3=min(high)     1=min(high)
// 5=typ(normal)   2=typ(normal)
// 7=max(low)      4=max(low)
//  5 for rising and 2 for falling

