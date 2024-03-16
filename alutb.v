module MCPU_Alutb();

parameter CMD_SIZE=2;
parameter WORD_SIZE=4;

reg [CMD_SIZE-1:0] opcode;
reg [WORD_SIZE-1:0] r1;
reg [WORD_SIZE-1:0] r2;
reg iscorrect;
wire [WORD_SIZE-1:0] out;
wire OVERFLOW;

MCPU_Alu #(.CMD_SIZE(CMD_SIZE), .WORD_SIZE(WORD_SIZE)) aluinst (opcode, r1, r2, out, OVERFLOW);

// Testbench code goes here
always #2 r1[0] = $random;
always #2 r2[0] = $random;
always #2 r1[1] = $random;
always #2 r2[1] = $random;

always
begin
#3 r1 = 4; #3 r1 = 8; #3 r1 = 1; #3 r1 = 9;
end
always
begin
#3 r2 = 4; #3 r2 = 8; #3 r2 = 1; #3 r2 = 9;
end


always #2 opcode[0] = $random;
always #2 opcode[1] = $random;
always @(opcode,r1,r2) begin
    iscorrect = (out == (r1 & r2)) | (out == (r1 | r2)) | (out == (r1 ^ r2))  | (out == (r1 + r2));
 
end
endmodule



