module single_port_ram_memory #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input wire clk,
    input wire we,
    input wire [ADDR_WIDTH-1:0] addr, 
    input wire [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout

);
  
  reg [DATA_WIDTH-1:0] ram [0:(ADDR_WIDTH-1)];
  always @(posedge clk) begin
    if (we) begin
      ram[addr]<=din;
      dout <= 0;
    end
      else begin 
        dout<=ram[addr];
      end
  end
      endmodule

// testbench
module single_port_ram_memory_tb;
  parameter DATA_WIDTH =8;
  parameter ADDR_WIDTH =4;
  reg clk;
  reg we;
  reg  [ADDR_WIDTH-1:0]addr;
  reg  [DATA_WIDTH-1:0]din;
  wire [DATA_WIDTH-1:0]dout;
  
  single_port_ram_memory #(DATA_WIDTH, ADDR_WIDTH) dut (clk,we,addr,din,dout);
  initial begin
    $dumpfile("single_port_ram_memory.vcd");
    $dumpvars(0,single_port_ram_memory_tb);
  end
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    #10; we=0;
         addr=0;
         din=0;
    #20; we=1;
         addr=4'b0110;
         din=8'hAA;
     #20;
         addr=4'b0010;
         din=8'h33;
     #20;
         addr=4'b1010;
         din=8'h5A;
    #20; we = 0; addr=4'b0110;
    #10;addr=4'b0010;
    #10;we=0;
    #10;addr=4'b1010;
    #10; we=0; addr=4'b1010;
    #10;
    $finish;
  end
  initial begin
    $monitor("TIME = %0t clk = %b we = %b addr = %b din = %d dout= %d",$time, clk,we,addr,din,dout);
  end
endmodule
    
