// data flow
module d_latch (
    input d,
    input en,
    output q,qbar
);
  assign q = en ? d : q; 
  assign qbar=~q;
endmodule

// behavioural level
module d_latch (
    input d,
    input en,
    output reg q,qbar
);
    always @ (d or en) begin
      if (en)
        q <= d;
    end
  assign qbar=~q;
endmodule

// testbench
module d_latch_tb;
  reg d,en;
  wire q,qbar;
  d_latch uut (.d(d),.en(en),.q(q),.qbar(qbar));
  initial begin
    $display ("Time\td\ten\tq\tqbar");
    $monitor ("%0t\t %b\t %b\t %b\t %b",$time,d,en,q,qbar);
    
   #10; en=1; d=1;
   #10;       d=0;
   #10; en=0; d=1;
   #10;       d=0;
   #10;
   $finish;
  end 
endmodule

