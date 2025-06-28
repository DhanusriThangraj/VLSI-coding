// Design a 2-bit comparator using basic gates (AND, OR, NOT) to compare two 2-bit numbers A and B. The output should indicate if A == B, A > B, or A < B.

// design code
module comparator_2bit (
    input wire A1, A0,   
    input wire B1, B0,   
    output wire eq,      
    output wire gt,      
    output wire lt       
);
    wire notA1, notA0, notB1, notB0;
    wire A1_eq_B1, A0_eq_B0;
    wire A_gt_B, A_lt_B;
    wire A1_gt_B1, A0_gt_B0;
    wire A1_lt_B1, A0_lt_B0;
    wire A1_eq_B1_and_A0_gt_B0;
    wire A1_eq_B1_and_A0_lt_B0;

    // NOT gates
    not (notA1, A1);
    not (notA0, A0);
    not (notB1, B1);
    not (notB0, B0);

   // Equality comparisons
  //   the equality equation = [(A1&B1)|~(A1&B1)]|[(A0&B0)|~(A0&B0)]
  //   [(A1==B1)+(A0==B0)]
    wire A1B1_and, nA1nB1_and, A0B0_and, nA0nB0_and;
    and (A1B1_and, A1, B1);
    and (nA1nB1_and, notA1, notB1);
    or  (A1_eq_B1, A1B1_and, nA1nB1_and);

    and (A0B0_and, A0, B0);
    and (nA0nB0_and, notA0, notB0);
    or  (A0_eq_B0, A0B0_and, nA0nB0_and);

    and (eq, A1_eq_B1, A0_eq_B0); // Final equality

    // Greater than
  //   the greater equation =(A1&~B1)|[(A1==B1)&(A0&~B0)]
    and (A1_gt_B1, A1, notB1);
    and (A0_gt_B0, A0, notB0);
    and (A1_eq_B1_and_A0_gt_B0, A1_eq_B1, A0_gt_B0);
    or  (gt, A1_gt_B1, A1_eq_B1_and_A0_gt_B0);

    // Less than
  //   the greater equation =(~A1&B1)|(A1==B1)&(~A0&B0)]
    and (A1_lt_B1, notA1, B1);
    and (A0_lt_B0, notA0, B0);
    and (A1_eq_B1_and_A0_lt_B0, A1_eq_B1, A0_lt_B0);
    or  (lt, A1_lt_B1, A1_eq_B1_and_A0_lt_B0);

endmodule

// testbench
module comparator_2bit_tb;

    reg A1, A0, B1, B0;
    wire eq, gt, lt;

    comparator_2bit uut (
        .A1(A1), .A0(A0),
        .B1(B1), .B0(B0),
        .eq(eq), .gt(gt), .lt(lt)
    );

    initial begin
      $display("Time\tA1\tA0\tB1\tB0\teq\tgt\tlt");
      $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",$time,A1, A0, B1, B0,eq, gt, lt);
      
       
        for (integer i = 0; i < 4; i = i + 1) begin
            {A1, A0} = i[1:0];
            for (integer j = 0; j < 4; j = j + 1) begin
                {B1, B0} = j[1:0];
                #1;
                
            end
        end
    end

endmodule

