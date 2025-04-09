module parity_checker (
    input  wire [3:0] data,
    input  wire parity_bit,
    output wire even_parity_valid,
    output wire odd_parity_valid
);
    assign even_parity_valid = ~^({data, parity_bit});
    assign odd_parity_valid  = ^({data, parity_bit});

endmodule

// testbench
module tb_parity_checker;
    reg  [3:0] data;
    reg  parity_bit;
    wire even_parity_valid, odd_parity_valid;
    parity_checker uut (
        .data(data),
        .parity_bit(parity_bit),
        .even_parity_valid(even_parity_valid),
        .odd_parity_valid(odd_parity_valid)
    );

    initial begin
        $display("Time\tData\tParity\tEven_Valid\tOdd_Valid");
        $monitor("%0t\t%b\t%b\t%b\t\t%b", $time, data, parity_bit, even_parity_valid, odd_parity_valid);
        #10; data = 4'b0000; parity_bit = 0;
        #10; data = 4'b001; parity_bit = 1;
        #10; data = 4'b0011; parity_bit = 0;
        #10; data = 4'b0111; parity_bit = 1;
        #10; data = 4'b1001; parity_bit = 0;
        #10; data = 4'b1111; parity_bit = 0;
        #10; data = 4'b1010; parity_bit = 1;
        #10; data = 4'b1101; parity_bit = 1;
        #10;

        $finish;
    end

endmodule
