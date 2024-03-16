module MCPU_Alu(cmd,in1,in2,out,CF);
parameter CMD_SIZE=3;
parameter WORD_SIZE=16;

parameter  [CMD_SIZE-1:0]  CMD_AND  = 0; 
parameter  [CMD_SIZE-1:0]  CMD_OR   = 1; 
parameter  [CMD_SIZE-1:0]  CMD_XOR   = 2; 
parameter  [CMD_SIZE-1:0]  CMD_ADD   = 3; 
parameter  [CMD_SIZE-1:0]  CMD_LSL   = 4; 
parameter  [CMD_SIZE-1:0]  CMD_LSR   = 5; 
parameter  [CMD_SIZE-1:0]  CMD_SUB   = 6; 

input [CMD_SIZE-1:0] cmd;
input [WORD_SIZE-1:0] in1;
input [WORD_SIZE-1:0] in2;
output[WORD_SIZE-1:0] out;
//carry flag
output CF;

wire [CMD_SIZE-1:0] cmd;
wire [WORD_SIZE-1:0] in1;
wire [WORD_SIZE-1:0] in2;
reg  [WORD_SIZE-1:0] out;
//carry flag
reg  CF;

always @ (cmd, in1, in2)
  #2
case(cmd)
  CMD_AND : begin
               out = in1&in2; 
      end
  CMD_OR : begin
              out = in1|in2;
            end
  CMD_XOR : begin
              out = in1^in2;
            end
  CMD_LSL : begin
              out = in1<<in2;
            end
  CMD_LSR : begin
              out = in1>>in2;
            end
  CMD_SUB : begin
              {CF,out} = in1-in2;
            end
  default : begin
              {CF,out} = in1+in2;
            end
 endcase

endmodule