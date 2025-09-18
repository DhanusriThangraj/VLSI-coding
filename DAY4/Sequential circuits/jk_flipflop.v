// behaviroural
module jk_flipflop (clk,j,k,q,qbar);
  input clk,j,k;
  output reg q,qbar;
  always @(posedge clk)begin
    case({j,k})
      2'b00:q<=q;
      2'b10:q<=1;
      2'b01:q<=0;
      2'b11:q<=~q;
      endcase
        end
        always @(*) begin
          qbar=~q;
        end 
endmodule


// testbench
module jk_flipflop_tb;
  reg clk,j,k;
  wire q,qbar;
  jk_flipflop uut (.clk(clk),.j(j),.k(k),.q(q),.qbar(qbar));
  initial begin
    clk=0;
     forever  #10 clk=~clk;
    end
   initial begin
     $dumpfile("jk_flipflop.vcd");
     $dumpvars(0,jk_flipflop_tb);       
  end
    initial begin
      $display("Time\tclk\tj\tk\tQ\tQbar");
      $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,clk,j,k,q,qbar);
    #10; j=1; k=0;
    #10; j=0; k=1;
    #10; j=1; k=0;
    #10; j=0; k=0;
    #10; j=1; k=1;  
       
    #10;
     
    $finish;
        
  end 
endmodule
