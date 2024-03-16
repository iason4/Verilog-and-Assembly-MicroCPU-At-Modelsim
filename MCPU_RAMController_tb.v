module MCPU_RAMController_tb;
parameter WORD_SIZE=8;
parameter ADDR_WIDTH=8;
parameter RAM_SIZE=1<<ADDR_WIDTH;

reg we, re;
reg [WORD_SIZE-1:0] datawr;
reg [ADDR_WIDTH-1:0] addr;
reg [ADDR_WIDTH-1:0] instraddr;
reg iscorrect;
integer i;

wire [WORD_SIZE-1:0] datard;
wire [WORD_SIZE-1:0] instrrd;



reg [WORD_SIZE-1:0] mem_copy[RAM_SIZE-1:0];


MCPU_RAMController aluinst (we,datawr,re,addr,datard,instraddr,instrrd);

initial begin
  we = 0;
  re = 0;
  datawr = 0;
  addr = 0;
  instraddr = 0;

  iscorrect = 0;

  i = 0;
  while(i<RAM_SIZE) begin
    mem_copy[i] = $random;
    we = 1;
    datawr = mem_copy[i];
    addr = i;
    instraddr = i;
    #10;

    re = 1;  
    
    
    i = i + 1;

  end
end

always #2 iscorrect = (datard == instrrd) ;

endmodule

