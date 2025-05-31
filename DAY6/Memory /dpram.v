// design code
module dpram #(parameter DATA_WIDTH=16, parameter ADDR_WIDTH=8)
(
  input wire clk,
  input wire [DATA_WIDTH-1:0] write_data_a,
  input wire [ADDR_WIDTH-1:0] addr_a,
  input wire write_en_a,
  input wire read_en_a,
  output reg [DATA_WIDTH-1:0] read_data_a,
  input wire [DATA_WIDTH-1:0] write_data_b,
  input wire [ADDR_WIDTH-1:0] addr_b,
  input wire write_en_b,
  input wire read_en_b,
  output reg [DATA_WIDTH-1:0] read_data_b
  
);

  reg [DATA_WIDTH-1:0] mem [0:(2**ADDR_WIDTH)-1];

  always @(posedge clk) begin
      if (write_en_a)
        mem[addr_a] <= write_data_a;
      if (read_en_a)
        read_data_a <= mem[addr_a];
    end
  
  always @(posedge clk ) begin
   
    if (write_en_b)
      mem[addr_b] <= write_data_b;
    if (read_en_b)
      read_data_b<= mem[addr_b];
    end
  
endmodule

  // testbench
 module dpram_tb;
  parameter DATA_WIDTH = 16;
  parameter ADDR_WIDTH = 8;

  reg clk;
  
   reg [DATA_WIDTH-1:0] write_data_a;
   reg [ADDR_WIDTH-1:0] addr_a;
   reg write_en_a;
   reg read_en_a;
   wire [DATA_WIDTH-1:0] read_data_a;
   reg [DATA_WIDTH-1:0] write_data_b;
   reg [ADDR_WIDTH-1:0] addr_b;
   reg write_en_b;
   reg read_en_b;
   wire [DATA_WIDTH-1:0] read_data_b;

  dpram #(
    (DATA_WIDTH),
    (ADDR_WIDTH)
  ) uut (
    .clk(clk),
    .write_data_a(write_data_a),
    .addr_a(addr_a),
    .write_en_a(write_en_a),
    .read_en_a(read_en_a),
    .read_data_a(read_data_a),
    .write_data_b(write_data_b),
    .addr_b(addr_b),
    .write_en_b(write_en_b),
    .read_en_b(read_en_b),
    .read_data_b(read_data_b)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $display("Time\tclk\twrite_data_a\taddr_a\twrite_en_a\tread_en_a\t\tread_data_a\twrite_data_b\taddr_b\twrite_en_b\tread_en_b\t\tread_data_b");
    $monitor("%0t\t%b\t%d\t\t%d\t\t%b\t\t%b\t\t%d\t\t%d\t\t%d\t\t%d\t\t%b\t\t%d\t\t", $time,clk, write_data_a,addr_a,write_en_a,read_en_a,read_data_a,
             write_data_b,addr_b,write_en_b,read_en_b,read_data_b,
            );

    
    write_en_a = 0;
    read_en_a = 0;
    #10;
    
    
    write_data_a = 16'd13;
    addr_a = 8'd12;
    write_en_a = 1;
    read_en_a = 0;
    #10;

    write_en_a = 0;
    read_en_a = 1;
    #10;

    addr_a= 8'd12;
    read_en_a = 1;
    #10;
    
    write_en_b = 0;
    read_en_b= 0;
    #10;
    
    
    write_data_b = 16'd22;
    addr_b = 8'd182;
    write_en_b = 1;
    read_en_b = 0;
    #10;

    write_en_b = 0;
    read_en_b = 1;
    #10;

    addr_b= 8'd182;
    read_en_b= 1;
    #10;


    $finish;
  end
endmodule

    
