module top_module (
    input clk,
    input in, 
    output out);
    always @(posedge clk) begin
        if (clk) begin
            out= in^out;
        end
        else
            out= ~(in^out);
    end        
endmodule
