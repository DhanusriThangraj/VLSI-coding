// Behavioural level
module sr_latch(q,qbar,s,r);
  input s,r;
  output reg q,qbar;
  always @(*)
    begin
      if (s&&r)begin
        q=1'bx;
        qbar=1'bx;
    end
  else if (s)
    begin
      q=1;
      qbar=0;
    end
  else if (r)
    begin
      q=0;
      qbar=1;
    end
    end
endmodule


// gate level
module sr_latch(
  input s,r,
  output reg q,qbar);
nand(q,s,qbar);
nand(qbar,r,q);
endmodule

// data flow
module sr_latch(s,r,q,qbar);
  input wire s,r;
  output reg q,qbar;
  assign q=~(r|qbar);
  assign qbar=~(s|q);
endmodule

// testbench

module sr_latch_tb;
  reg s,r;
  wire q,qbar;
  sr_latch dut(.s(s),.r(r),.q(q),.qbar(qbar));
initial begin
  $display("Time\t\t\ts\tr\tq\tqbar");
    $monitor("0%t\t%b\t%b\t%b\t%b",$time,s,r,q,qbar);
  end 
  initial begin
     s=1; r=1;#10;
     s=0; r=1;#10;
     s=1; r=0;#10;
     s=0; r=0;#10;
     s=0; r=1;#10;
     s=1; r=1;#10;
     $finish;
  end
endmodule
      
