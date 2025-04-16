module adder_32bit #(parameter N = 32) (   // 4; 32
    input clk,
    input rst,
    input [N-1:0] a,
    input [N-1:0] b,
    output reg [N-1:0] sum,
    output reg carry_out
);

    reg [N:0] result;

    always @(posedge clk) begin
        if (rst) begin
            sum <= {N{1'b0}};
            carry_out <= 1'b0;
        end else begin
            result = a + b;
            sum <= result[N-1:0];
            carry_out <= result[N];
        end
    end

endmodule

// testbench
`timescale 1ns / 1ps

module tb_adder_32bit;

    parameter N = 32;
    parameter NUM_RANDOM_TESTS = 32;

    reg clk, rst;
    reg [N-1:0] a, b;
    wire [N-1:0] sum;
    wire carry_out;

    integer test_log;
    integer i;
    reg [N:0] expected;

    adder_32bit #(N) dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .sum(sum),
        .carry_out(carry_out)
    );

    always #5 clk = ~clk;

    task reset_dut;
    begin
        rst = 1;
        @(posedge clk);
        rst = 0;
    end
    endtask

    task apply_and_check;
        input [N-1:0] test_a;
        input [N-1:0] test_b;
        input [N-1:0] expected_sum;
        input expected_carry;
          begin
        a = test_a;
        b = test_b;
        @(posedge clk);
        #1;
        if ((sum === expected_sum) && (carry_out === expected_carry)) begin
            $display("PASS: a=%h b=%h => sum=%h carry=%b", a, b, sum, carry_out);
            $fdisplay(test_log, "PASS: a=%h b=%h => sum=%h carry=%b", a, b, sum, carry_out);
        end else begin
            $display("FAIL: a=%h b=%h => sum=%h carry=%b (Expected sum=%h carry=%b)",
                     a, b, sum, carry_out, expected_sum, expected_carry);
            $fdisplay(test_log, "FAIL: a=%h b=%h => sum=%h carry=%b (Expected sum=%h carry=%b)",
                     a, b, sum, carry_out, expected_sum, expected_carry);
        end
    end
    endtask

    initial begin
      $dumpfile("adder_32bit.vcd");
      $dumpvars(0, tb_adder_32bit);

        test_log = $fopen("logs/adder_test_results.log", "w");

        clk = 0;
        rst = 1;
        a = 0;
        b = 0;

        reset_dut();

        // Functional test
        apply_and_check(32'h0000000F, 32'h00000001, 32'h00000010, 1'b0);


        // Clear inputs and reset
        a = 0; b = 0;
        @(posedge clk);
        reset_dut();
        @(posedge clk); @(posedge clk); #1;
        if (sum == 0 && carry_out == 0)
           $display("PASS: Outputs cleared after reset");
        else
            $display("FAIL: Reset did not clear outputs");

        // Corner cases
        apply_and_check({N{1'b0}}, {N{1'b0}}, {N{1'b0}}, 1'b0);
        apply_and_check({N{1'b1}}, 'd1, {N{1'b0}}, 1'b1);
        apply_and_check({32'd0, 32'hFFFFFFFF},
                 {32'd0, 32'h00000001},
                 {32'd0, 32'h00000000}, 1'b1);

        apply_and_check({N{1'b1}}, {N{1'b1}}, {N{1'b1}} - 1, 1'b1);

        // Random tests
        for (i = 0; i < NUM_RANDOM_TESTS; i = i + 1) begin
            a = $random;
            b =$random;
            expected = a + b;
            $display ("inside loop\n");
            apply_and_check(a, b, expected[N-1:0], expected[N]);
        end

        $fclose(test_log);
        $display("Test completed.");
        $finish;
    end

endmodule

                          
                                                                                                                                          
                                                                                                                                          
