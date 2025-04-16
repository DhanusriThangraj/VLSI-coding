module top_module ( input clk, input d, output q );
    wire con1,con2;
    my_dff d_flipflop1(.clk(clk),.d(d),.q(con1));
    my_dff d_flipflop2(.clk(clk),.d(con1),.q(con2));
    my_dff d_flipflop3(.clk(clk),.d(con2),.q(q));
    
endmodule
