// behavioral level
module sr_flipflop(clk,s,r,q,qbar);
  input clk,s,r;
  output reg q,qbar;
  
  always @(posedge clk) 
    begin
      
     case ({s,r})
     2'b00:q<= q;
     2'b10:q<= 1;
     2'b01:q<= 0;
     2'b11:q<= 1'bx;
  endcase
    end
      
    always @(*) begin
     qbar<=~q;
    end
    endmodule

// testbench
module sr_flipflop_tb;
  reg clk,s,r;
  wire q,qbar;
  sr_flipflop uut (.clk(clk),.s(s),.r(r),.q(q),.qbar(qbar));
  initial begin
    clk=0;
     forever  #10 clk=~clk;
    end
   initial begin
      $dumpfile("sr_flipflop.vcd");
      $dumpvars(0,sr_flipflop_tb);
     end
    initial begin
      $display("Time\tclk\tS\tR\tQ\tQbar");
     $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,clk,s,r,q,qbar);
    #10; s=1; r=0;
    #10; s=0; r=1;
    #10; s=1; r=0;
    #10; s=0; r=0;
    #10; s=1; r=1;  #10;
       
    #10;
     
    $finish;
        
  end 
endmodule
