module full_sub (
    input wire a,      
    input wire b,      
    input wire c,      
    output  diff,  
    output wire borrow 
);

    assign diff = a ^ b ^ c;
    assign borrow = (~a & b) | (~a & c) | (b & c);

endmodule

// testbench
`timescale 1ns / 1ps

module full_sub_testbench;
    reg a, b, c;             
    wire diff, borrow;       
    full_sub uut (
        .a(a),
        .b(b),
        .c(c),               
        .diff(diff),
        .borrow(borrow)
    );

    initial begin
        $display("Time\t a b c | diff borrow");
        $display("---------------------------");
        $monitor("%0t\t %b %b %b |   %b     %b", $time, a, b, c, diff, borrow);
      #10 a = 0; b = 0; c = 0;
        #10 a = 0; b = 0; c = 1;
        #10 a = 0; b = 1; c = 0;
        #10 a = 0; b = 1; c = 1;
        #10 a = 1; b = 0; c = 0;
        #10 a = 1; b = 0; c = 1;
        #10 a = 1; b = 1; c = 0;
        #10 a = 1; b = 1; c = 1;

        #10;
        $finish;
    end

endmodule
