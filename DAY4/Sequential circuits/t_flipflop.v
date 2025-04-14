// behavioural level
module t_flipflop (
    input clk,
    input reset,
    input t,
    output reg q,qbar
);
assign qbar=~q;
always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 0;
  else if (t)
        q <= ~q;
    else
        q<= q;  
end    
endmodule


// testbench
module t_flipflop_tb;
  reg clk,reset,t;
  wire q,qbar;
  t_flipflop uut (.clk(clk),.reset(reset),.t(t),.q(q),.qbar(qbar));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("t_flipflop.vcd");
    $dumpvars(0,t_flipflop_tb);
  end
  initial begin
    $display("Time\tclk\treset\tt\tq\tqbar");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,clk,reset,t,q,qbar);
    #10; reset =0; 
    #10; t=1;
    #10; t=0;
    #10; t=1;
    #10; reset =1; 
    #10; t=0;
    #10; t=1;
    #10; t=0;
    #10; t=1;
    
    $finish;
  end
endmodule
    
