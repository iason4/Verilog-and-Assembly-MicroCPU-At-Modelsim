module MCPUtb_3();


reg reset, clk;


MCPU cpuinst (clk, reset);


initial begin
  reset=1;
  #10  reset=0;
end

always begin
  #5 clk=0; 
  #5 clk=1; 
end


/********OUR ASSEMBLER*****/

integer file, i;
reg[cpuinst.WORD_SIZE-1:0] memi;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R0  = 0; //4'b0000
parameter  [cpuinst.OPERAND_SIZE-1:0]  R1  = 1; //4'b0001
parameter  [cpuinst.OPERAND_SIZE-1:0]  R2  = 2; //4'b0010
parameter  [cpuinst.OPERAND_SIZE-1:0]  R3  = 3; //4'b0011
parameter  [cpuinst.OPERAND_SIZE-1:0]  R4  = 4; //4'b0100
parameter  [cpuinst.OPERAND_SIZE-1:0]  R5  = 5; //4'b0101
parameter  [cpuinst.OPERAND_SIZE-1:0]  R6  = 6; //4'b0110
parameter  [cpuinst.OPERAND_SIZE-1:0]  R7  = 7; //4'b0111
parameter  [cpuinst.OPERAND_SIZE-1:0]  R8  = 8; //4'b1000
parameter  [cpuinst.OPERAND_SIZE-1:0]  R9  = 9; //4'b1001
parameter  [cpuinst.OPERAND_SIZE-1:0]  R10  = 10; //4'b1010
parameter  [cpuinst.OPERAND_SIZE-1:0]  R11  = 11; //4'b1011
parameter  [cpuinst.OPERAND_SIZE-1:0]  R12  = 12; //4'b1100
parameter  [cpuinst.OPERAND_SIZE-1:0]  R13  = 13; //4'b1101
parameter  [cpuinst.OPERAND_SIZE-1:0]  R14  = 14; //4'b1110
parameter  [cpuinst.OPERAND_SIZE-1:0]  R15  = 15; //4'b1111


initial
begin

    for(i=0;i<256;i=i+1)
    begin
      cpuinst.raminst.mem[i]=0;
    end
    cpuinst.regfileinst.R[0]=0;
    cpuinst.regfileinst.R[1]=0;
    cpuinst.regfileinst.R[2]=0;
    cpuinst.regfileinst.R[3]=0;     
    cpuinst.regfileinst.R[4]=0;
    cpuinst.regfileinst.R[5]=0;
    cpuinst.regfileinst.R[6]=0;
    cpuinst.regfileinst.R[7]=0;
    cpuinst.regfileinst.R[8]=0;
    cpuinst.regfileinst.R[9]=0;
    cpuinst.regfileinst.R[10]=0;
    cpuinst.regfileinst.R[11]=0;
    cpuinst.regfileinst.R[12]=0;
    cpuinst.regfileinst.R[13]=0;
    cpuinst.regfileinst.R[14]=0;
    cpuinst.regfileinst.R[15]=0;    



    //memory address: instruction

    i = 0; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R0, 8'b00000000};  // 0: R0=0;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R1, 8'b00000001};  // 1: R1=1;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R2, 8'b00000010};  // 2: R2=2;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R3, 8'b10010110};  // 3: R3=150;--
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R4, 8'b00000100};  // 4: R4=4;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R5, 8'b00000101};  // 5: R5=5;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R6, 8'b00000110};  // 6: R6=6;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R7, 8'b00000111};  // 7: R7=7;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R8, 8'b00001000};  // 8: R8=8;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R9, 8'b00001001};  // 9: R9=9;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R10, 8'b00001010};  // 10: R10=10;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R11, 8'b00010011};  // 11: R11=19;--
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R12, 8'b00001100};  // 12: R12=12;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R13, 8'b00001101};  // 13: R13=13;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R14, 8'b00001110};  // 14: R14=14;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_SHORT_TO_REG, R15, 8'b00001111};  // 15: R15=15;


    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_LSL, R13, R3, R5};
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_ADD, R14, R13, R11};
    
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_LSL, R9, R14, R2};                   // 31: R9=R4<<R2;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_LSR, R10, R14, R2};                 // 32: R10=R4>>R2;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_STORE_TO_MEM, R9, 8'b00010100};     // 21: mem[20]=R9;
    i = i + 1; cpuinst.raminst.mem[i] = {cpuinst.OP_STORE_TO_MEM, R10, 8'b00010101};     // 21: mem[21]=R10;
   
    
    
    file = $fopen("program.list","w");
    for(i=0;i<cpuinst.raminst.RAM_SIZE;i=i+1)
    begin
      memi=cpuinst.raminst.mem[i];
      
      $fwrite(file, "%b_%b_%b_%b\n", 
        memi[cpuinst.INSTRUCTION_SIZE-1:cpuinst.INSTRUCTION_SIZE-cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*3-1:2*cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*2-1:cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE-1:0]);
    end
    $fclose(file);
end

endmodule

