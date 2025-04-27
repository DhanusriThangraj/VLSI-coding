module top_module (
    input clk,
    input x,
    output z
); 
    wire d[2:0];
    reg q[2:0];
    assign d[0]=x^q[0];
    assign d[1]=x&~q[1];
    assign d[2]=x|~q[2];
    always @(posedge clk) 
        if (clk) begin
            q<=d;
        end   
    assign z = ~(q[0]|q[1]|q[2]);
endmodule
