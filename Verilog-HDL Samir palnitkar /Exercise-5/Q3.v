// The 1-bit full adder described in the chapter can be expressed in a sum of products form. 
// sum = a.b.c_in + a'.b.c_in' + a'.b'.c_in + a.b'.c_in' c_out = a.b + b.c_in + a.c_in 
// Assuming a, b, c_in are the inputs and sum and c_out are the outputs, design a logic circuit to implement the 1-bit full adder, using only and, not, and or gates. 
// Write the Verilog description for the circuit. You may use up to 4-input Verilog primitive and and or gates. Write the stimulus for the full adder and check the functionality 
// for all input combinations.

// design code
module full_adder(
input a,b,cin,
output sum,cout);
  
wire anot,bnot,cinnot;
wire A1,A2,A3,A4,A5,A6,A7;

//   not
  not a1 (anot,a);
  not b1 (bnot,b);
  not c1 (cinnot,cin);
  
//  and sum
  and and1 (A1,a,b,cin);
  and and2 (A2,anot,b,cinnot);
  and and3 (A3,anot,bnot,cin);
  and and4 (A4,a,bnot,cinnot);
// and cout
  and and5 (A5,a,b);
  and and6 (A6,b,cin);
  and and7 (A7,a,cin);
//   or
  or or1 (sum,A1,A2,A3,A4);
  or or2 (cout,A5,A6,A7);
endmodule
// testbench code
module full_adder_tb;
  reg a,b,cin;
  wire sum,cout;
  
  full_adder uut (a,b,cin,sum,cout);
  initial begin
    $display("Time\ta\tb\tcin\tsum\tcout");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,cin,sum,cout);
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $finish;
  end
endmodule
  
  
