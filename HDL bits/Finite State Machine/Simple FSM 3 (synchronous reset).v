module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    reg[1:0] state,next_state;
parameter A=0,B=1,C=2,D=3;
    always @ (posedge clk ) 
        if (reset) begin
            state<=A; end
            else 
                state<=next_state; 
    always @(*) begin
    case(state) 
        A:begin next_state<=in?B:A; out=0;end
        B:begin next_state<=in?B:C; out=0;end
        C:begin next_state<=in?D:A; out=0;end
        D:begin next_state<=in?B:C; out=1;end
    endcase
    end

endmodule
