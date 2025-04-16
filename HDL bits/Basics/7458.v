module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire and_wire_a,and_wire_b,and_wire_c,and_wire_d;
    assign and_wire_a = p1a && p1b && p1c;
    assign and_wire_b = p1d && p1e && p1f;
    assign and_wire_c = p2a && p2b;
    assign and_wire_d = p2c && p2d;
    assign p1y= and_wire_a || and_wire_b;
    assign p2y= and_wire_c || and_wire_d;

endmodule
