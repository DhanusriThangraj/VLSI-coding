// design code
module magnitude_comparator(
  input [3:0]A,B,
  output A_gt_B,A_lt_B,A_eq_B);
  wire[3:0]X;
  
  assign X[0]=(A[0]&B[0])||((~A[0])&(~B[0])),
    X[1]=(A[1]&B[1])||((~A[1])&(~B[1])),
    X[2]=(A[2]&B[2])||((~A[2])&(~B[2])),
    X[3]=(A[3]&B[3])||((~A[3])&(~B[3]));
  
  assign A_gt_B = (A[3]&(~B[3]))|(X[3]&A[2]&(~B[2]))|(X[3]&X[2]&A[1]&(~B[1]))|(X[3]&X[2]&X[1]&A[0]&(~B[0]));
  assign A_lt_B =(~A[3]&B[3])|(X[3]&(~A[2])&B[2])|(X[3]&X[2]&~A[1]&B[1])|(X[3]&X[2]&X[1]&~A[0]&B[0]);
  assign A_eq_B = X[0]&X[1]&X[2]&X[3];
  
endmodule

// testbench
module magnitude_comparator_tb;
  reg [3:0]A,B;
  wire A_gt_B,A_lt_B,A_eq_B;
  magnitude_comparator uut (A,B,A_gt_B,A_lt_B,A_eq_B);
  initial begin
    $display("Time\tA\tB\tA_gt_B\tA_lt_B\tA_eq_B");
    $monitor("%0t\t%d\t%d\t%b\t%b\t%b",$time,A,B,A_gt_B,A_lt_B,A_eq_B);
         A=4'b0000; B=4'b0010;
    #10; A=4'b1000; B=4'b0010;
     #10;A=4'b1100; B=4'b1010;
     #10;A=4'b0010; B=4'b0011;
    #10; A=4'b1100; B=4'b0010;
    #10; A=4'b1100; B=4'b1100;
    #10; $finish;
  end
endmodule
