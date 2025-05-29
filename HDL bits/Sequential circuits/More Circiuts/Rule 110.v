module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    always @ (posedge clk) 
        if(load) begin
            q<=data;
        end
    else
//q <= (((q[511:0] ^ {q[510:0], 1'b0}) & q[511:1]) | ((q[511:0] | {q[510:0], 1'b0}) & (~q[511:1])));
    //logic is q <= (((C ^ R) & L) | ((C | R) & ~L));
        q<= ((q[511:0]^{q[510:0],1'b0})|(~q[511:1])&(q[511:0]));
    //logic (C^R)|(~L)R
endmodule
