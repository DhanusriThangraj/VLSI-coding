module top_module (
    input clk,
    input reset,      
    output [3:0] q);   
    always @(posedge clk)
        if (reset) begin
            q<=3'b0; end          
            else
                q<= q+4'b1;        
endmodule
