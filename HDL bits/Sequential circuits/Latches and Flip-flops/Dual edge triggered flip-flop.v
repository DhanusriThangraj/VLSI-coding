module top_module (
    input clk,
    input d,
    output q
);reg temp1,temp2;
    always @ (posedge clk) begin
        temp1<=d; end
    always @ (negedge clk) begin
        temp2<=d; end
    always @ (clk) begin
        if (clk) begin
            q<=temp1;end
        else
            q<=temp2;
    end
            endmodule
