module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    always @ (posedge clk) begin
        if (clk) begin
            q<=d;
        end
        else 
            q<=~d;
       end
endmodule
