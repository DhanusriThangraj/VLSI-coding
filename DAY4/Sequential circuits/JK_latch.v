  // Gate_level 
  module jk_latch (j,k,en,q,qbar);
   input j,k,en;
   output q,qbar;
   wire s,r;
   and (s,j,en,qbar);
   and (r,k,en,q);
    nand (q,s,qbar);
    nand(qbar,r,q);
  endmodule     



// data flow
module jk_latch (
  input j,k,en,
  output q,qbar);
  wire s,r;
  assign s=en & j & ~k;
  assign r=en & ~j & k;
  assign q= ~(r|qbar);
  assign qbar= ~(s|q);
 endmodule

// testbench
module jk_latch_tb; 
  reg j,k,en;
  wire q,qbar;
  jk_latch dut(.j(j),.k(k),.en(en),.q(q),.qbar(qbar));
  initial begin
    $display("Time\t\t\tj\tk\ten\tq\tqbar");
    $monitor("0%t\t%b\t%b\t%b\t%b\t%b",$time,j,k,en,q,qbar);
        en = 1; j= 0; k = 0; #10;  // No change
        j = 1;  k= 0; #10;          // Set
        j = 0; k = 1; #10;          // Reset
        j = 1; k = 1; #10;          // Toggle
        en = 0; j = 1; k = 1; #10;  // Disabled, no change
        en = 1; j = 0; k = 0; #10;  // No change
    
    #10;
    $finish;
  end 
endmodule
