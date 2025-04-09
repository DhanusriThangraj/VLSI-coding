module parity_generator (input  [3:0]data, 
                         output wire even_parity, 
                         output wire odd_parity );
  
  assign even_parity = ~^data;
  assign odd_parity = ^data;
  
endmodule

// testbench

module parity_generator_tb;
    reg  [3:0] data;
    wire even_parity, odd_parity;
    parity_generator uut (
        .data(data),
        .even_parity(even_parity),
        .odd_parity(odd_parity)
    );

    initial begin
        $display("Time\tData\tEven\tOdd");
        $monitor("%0t\t%b\t%b\t%b", $time, data, even_parity, odd_parity);
        data = 4'b0000; #10;
        data = 4'b0001; #10;
        data = 4'b0010; #10;
        data = 4'b0011; #10;
        data = 4'b0100; #10;
        data = 4'b0101; #10;
        data = 4'b0110; #10;
        data = 4'b0111; #10;
        data = 4'b1000; #10;
        data = 4'b1001; #10;
        data = 4'b1010; #10;
        data = 4'b1011; #10;
        data = 4'b1100; #10;
        data = 4'b1101; #10;
        data = 4'b1110; #10;
        data = 4'b1111; #10;

        $finish;
    end

endmodule


