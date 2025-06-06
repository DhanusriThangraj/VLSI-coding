// design code
module SR_latch(input S,R,
               output Q,Qbar);
  nand N1(Q,S,Qbar);
  nand N2(Qbar,R,Q);
endmodule

// testbench
module SR_latch_tb;
  reg S,R;
  wire Q,Qbar;
  SR_latch uut(S,R,Q,Qbar);
  initial begin
    $display("Time\tS\tR\tQ\tQbar");
    $monitor("%0t\t%b\t%b\t%b\t%b",$time,S,R,Q,Qbar);
    
     #10; S=0; R=0;
     #10; S=0; R=1;
     #10; S=1; R=0;
     #10; S=1; R=1;
     #10;$finish;
  end
endmodule
    
