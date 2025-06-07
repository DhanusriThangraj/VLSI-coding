// design code
module jk_flipflop(input clear,clock,
input j,k,
output q,qbar);
wire a,b,cbar,ybar,y,c,d;
  assign a=~(qbar&j&clock&clear);
  assign cbar=~clock;
  assign  b=~(clock&k&q);
  assign  ybar=~(y&clear&b);
  assign  y=~(a&ybar);
  assign  c=~(y&cbar);
  assign  d=~(cbar&ybar);
  assign q = ~(c & qbar);
  assign qbar = ~(q & clear & d);
endmodule

// testbench
module jk_flipflop_tb;
  reg clear,clock;
  reg j,k;
  wire q,qbar;
  jk_flipflop uut (clear,clock,j,k,q,qbar);
  
  initial begin 
    clock=0;
    forever #10 clock=~clock; end
  initial begin
    $display("Time\tclear\tclock\tj\tk\tq\tqbar\t");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b",$time,clear,clock,j,k,q,qbar);
   // Time 0
  clear = 0; j = 0; k = 0;
  #10;
  // Time 10: clear=1, posedge clk, J=0 K=0 (hold)
  clear = 1; j = 0; k = 0;
  #10;
  // Time 20: clk=0, J=0 K=1 (no posedge → hold)
  j = 0; k = 1;
  #10;
  // Time 30: posedge clk, J=1 K=0 → Set (Q=1)
  j = 1; k = 0;
  #10;
  // Time 40: clk=0, J=1 K=1 (no posedge → hold)
  j = 1; k = 1;
  #10;
  // Time 50: posedge clk, J=1 K=1 → Toggle (Q=0)
  j = 1; k = 1;
  #10;
  // Time 60: clk=0, J=1 K=1 (no posedge → hold)
  $finish;
  end
endmodule
