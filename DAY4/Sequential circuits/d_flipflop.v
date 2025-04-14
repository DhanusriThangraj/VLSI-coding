
module d_flipflop(clk,d,q,qbar);
  input clk,d;
  output reg q,qbar;
  
  always @(posedge clk)
   begin
    q<=d;
  end
  always @(*) begin
    qbar<=~q;
  end 
endmodule

// testbench
module d_flipflop_tb;
  reg clk,d;
  wire q,qbar;
  d_flipflop uut (.clk(clk),.d(d),.q(q),.qbar(qbar));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("d_flipflop.vcd");
    $dumpvars(0,d_flipflop_tb);
  end
  initial begin
    $display("Time\t\t\tclk\td\tq\tqbar");
    $monitor("0%t\t%b\t%b\t%b\t%b",$time,clk,d,q,qbar);
    
    #10; d=1;
    #10; d=0;
    #10; d=1;
    #10; d=0;
    #10;
    $finish;
  end
endmodule
    
