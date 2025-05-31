// design code
module SPRAM #(parameter DATA_WIDTH=16, parameter ADDR_WIDTH=8)
(
  input wire clk,
  input wire reset,
  input wire [DATA_WIDTH-1:0] write_data,
  input wire [ADDR_WIDTH-1:0] addr,
  input wire write_en,
  input wire read_en,
  output reg [DATA_WIDTH-1:0] read_data
);

  reg [DATA_WIDTH-1:0] mem [0:(2**ADDR_WIDTH)-1];

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      read_data <= 0;
    end else begin
      if (write_en)
        mem[addr] <= write_data;
      if (read_en)
        read_data <= mem[addr];
    end
  end

endmodule
// testbench
    module SPRAM_tb;
  parameter DATA_WIDTH = 16;
  parameter ADDR_WIDTH = 8;

  reg clk;
  reg reset;
  reg [DATA_WIDTH-1:0] write_data;
  reg [ADDR_WIDTH-1:0] addr;
  reg write_en;
  reg read_en;
  wire [DATA_WIDTH-1:0] read_data;

  SPRAM #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH)
  ) uut (
    .clk(clk),
    .reset(reset),
    .write_data(write_data),
    .addr(addr),
    .write_en(write_en),
    .read_en(read_en),
    .read_data(read_data)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $display("Time\tclk\treset\twrite_data\taddr\twrite_en\tread_en\t\tread_data");
    $monitor("%0t\t%b\t%b\t%d\t\t%d\t%b\t\t%b\t\t%d", $time,clk,reset, write_data,addr,write_en,read_en,read_data);

    reset = 1;
    write_en = 0;
    read_en = 0;
    #10;
    
    reset = 0;
    write_data = 16'd13;
    addr = 8'd12;
    write_en = 1;
    read_en = 0;
    #10;

    write_en = 0;
    read_en = 1;
    #10;

    addr = 8'd12;
    read_en = 1;
    #10;

    $finish;
  end
endmodule
