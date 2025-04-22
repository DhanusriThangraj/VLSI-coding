module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    always @ (*) begin
        if (sel==4'b0000) begin
            out =a; end
        else if (sel==4'b0001)begin
            out=b;end
        else if (sel==4'b0010) begin
            out=c;end
        else if (sel==4'b0011) begin
            out=d;end
        else if (sel==4'b0100)begin
            out=e;end
        else if (sel==4'b0101) begin
            out=f;end
        else if (sel==4'b0110) begin
            out=g;end
        else if (sel==4'b0111) begin
            out=h;end
        else if (sel==4'b1000) begin
            out=i;end
        else
            out={16{1'b1}};
    end
endmodule
