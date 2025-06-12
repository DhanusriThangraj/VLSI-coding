// Write a Verilog program with the following specifications. 
// 1. It should have a memory of size 8x14. 
// 2. Write a task/function to fill all elements in the memory. 
// 3. Write a method to "clear" to erase the memory 
// 4. Write a method to add the values stored inside the memory. 
// 5. Write a method to find the largest number in the memory


// design code
module memory;
  reg [13:0] mem[7:0];
  integer i;
  
  task fill_memory;
    begin    
      for (i=0; i<8; i=i+1)
        mem[i] = (i+1)*8;  
    end 
  endtask
  
   initial begin
    fill_memory(); 
     for (i=0; i<8;i=i+1)
   $display("mem[%0d] = %0d",i,mem[i]);
     end
  
  
 task clear_memory;
    begin 
      for(i=0; i<8; i=i+1)
        mem[i]=14'd0; 
    end 
  endtask
  
  initial begin 
    clear_memory();
    for (i=0; i<8; i=i+1)
      $display("mem[%0d] = %0d", i, mem[i]);
  end   
    
  function [15:0] sum_memory;
  integer j;
  begin 
    sum_memory=mem[0];
    for(j=0; j<8; j=j+1)
      sum_memory= sum_memory+mem[j]; end
  endfunction 
  
  initial begin
    $display("Sum :%0d",sum_memory()); 
  end
  
  function [13:0] max_memory;
    integer k;
    begin
      max_memory=mem[0];
      for (k=0; k<8; k=k+1)
        if(mem[k]>max_memory)
          max_memory=mem[k]; end
  endfunction
  initial begin
    $display("max:%0d",max_memory());end
endmodule

//output
mem[0] = 8
mem[1] = 16
mem[2] = 24
mem[3] = 32
mem[4] = 40
mem[5] = 48
mem[6] = 56
mem[7] = 64
mem[0] = 0
mem[1] = 0
mem[2] = 0
mem[3] = 0
mem[4] = 0
mem[5] = 0
mem[6] = 0
mem[7] = 0
Sum :0
max:0


// output
// without clear_memory
mem[0] = 8
mem[1] = 16
mem[2] = 24
mem[3] = 32
mem[4] = 40
mem[5] = 48
mem[6] = 56
mem[7] = 64
Sum :296
max:64
