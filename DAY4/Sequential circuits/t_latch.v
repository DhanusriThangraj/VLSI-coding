
module t_latch (
    input T,
    input enable,  
    input reset,   
    output reg Q
);

  always @ (*)
begin
    if (reset)
        Q <= 0;
    else if (enable) begin
        if (T)
            Q <= ~Q;  
        
    end
end
endmodule

// testbench

`timescale 1ns / 1ps

module t_latch_tb;
reg T;
reg enable;
reg reset;
wire Q;
t_latch uut (.T(T),.enable(enable),.reset(reset), .Q(Q));
  
initial begin
    enable=0;
    #5 T = 1; 
    #5 T = 1; 
    #5 T = 1;  
    
    #5enable = 1;
    #5 reset=1;
    #5 T = 1; 
    #5 T = 1; 
    #5 T = 0; 

    #5 enable = 1; 
    #5 reset=1;
    #5 T = 1;              
    #5 T = 0;              
    #5 T = 1;             
    #5 $finish;
end

initial begin
  $display("Time\tT\tenable\treset\tQ");
  $monitor("%0t\t%b\t%b\t%b\t%b", $time, T, enable, reset, Q);
end

endmodule
