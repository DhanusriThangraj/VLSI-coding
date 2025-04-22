module top_module( 
    input a, b, sel,
    output out ); 
    always @ (*) begin
       if (sel) begin
            out=b;
        end
            else
                out=a;
    end            
endmodule
