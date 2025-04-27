module top_module (
    input clk,    
    input d,
    output reg q );
    always @ (posedge clk) begin
        if (clk) begin
            q<=d;
        end
        else 
            q<=~d;
    end

endmodule
