module Single_Cycle_Datapath(clk, rst);
input clk, rst;
wire [63:0] PC, PC_address, RFWD, RFRD1, RFRD2, ALU1, ALU2, ALUoutput, Addr, Writedata, Readdata;
wire [31:0] instruction;
wire [4:0] RReg1, RReg2, WReg;
wire [2:0] ALUOp;
wire Reg2Loc, Uncondbranch, Branch, Zero, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, RFWE;

ProgramCounter program_counter(PC, PC_address, clk, rst, Uncondbranch, Branch, Zero);
Instruction_Memory instruction_memory(PC, instruction);
ControlUnit control_unit(instruction, Reg2Loc, Uncondbranch, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, clk, rst);

Register_File register_file(RReg1, RReg2, WReg, RFWD, RFWE, RFRD1, RFRD2, clk, rst);

ALU alu_unit( ALU1, ALU2, ALUoutput, ALUOp, Zero);
Data_Memory data_memory(Addr, Writedata, Readdata, MemWrite, MemRead, clk, rst);

always@ (posedge clk, posedge rst, instruction)
begin
//branch
if (instruction == 11'h0A0)
PC_address<=($signed(instruction[23:5]))<<2;

//cbz
if (instruction == 11'h5A0)
PC_address<=($signed(instruction[25:0]))<<2;

if (Reg2Loc==0)
begin
RReg1<=instruction[9:5];
RReg2<=instruction[20:16];
WReg<=instruction[4:0];
end
else if (Reg2Loc==1)
begin
RReg1<=instruction[9:5];
RReg2<=instruction[4:0];
WReg<=instruction[4:0];
end

if (MemtoReg==0)
WReg<=ALUoutput;
else if (MemtoReg==1)
WReg<=Readdata;

if (ALUSrc==0)
ALU2<=RFRD2;
else if (ALUSrc==1)
ALU2<=($signed(instruction[21:10]))<<2;

//branch
if (instruction[31:21] == 11'h0A0)
begin
    ALU_data2 <= RF_ReadData2;
    
end

//and
else if (instruction[31:21] == 11'h450)
begin
    RReg1 <= instruction[20:16];
    RReg2 <= instruction[9:5];
    WReg <= instruction[4:0];
    ALU_data1 <= RF_ReadData1;
    ALU_data2 <= RF_ReadData2;
    ALU_Op <= 3'b001;
    WReg <= ALU_output;
end 

//add
else if (instruction[31:21] == 11'h458)
begin
    RReg1 <= instruction[20:16];
    RReg2 <= instruction[9:5];
    WReg <= instruction[4:0];
    ALU_data1 <= RF_ReadData1;
    ALU_data2 <= RF_ReadData2;
    ALU_Op <= 3'b110;
    WReg <= ALU_output;
end

//orr
else if (instruction[31:21] == 11'h550)
begin
    RReg1 <= instruction[20:16];
    RReg2 <= instruction[9:5];
    WReg <= instruction[4:0];
    ALU_data1 <= RF_ReadData1;
    ALU_data2 <= RF_ReadData2;
    ALU_Op <= 3'b010;
    WReg <= ALU_output;
end

//cbz
else if (instruction[31:21] == 11'h5A0)
begin
    PC_address <= {45'b0,instruction[23:5]}<<2;
    PC_mux <= 1;
end

//sub
else if (instruction[31:21] == 11'h658)
begin
    RReg1 <= instruction[20:16];
    RReg2 <= instruction[9:5];
    WReg <= instruction[4:0];
    ALU_data1 <= RF_ReadData1;
    ALU_data2 <= RF_ReadData2;
    ALU_Op <= 3'b111;
    WReg <= ALU_output;
end
/*
//movk
else if (instruction[31:21] == 11'h794)
begin
    Reg2Loc<=0;
    Uncondbranch<=0;
    Branch<=0;
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=0;
    MemWrite<=0;
    ALUSrc<=0;
    RegWrite<=0;
end
*/
//stur
else if (instruction[31:21] == 11'h7C0)
begin
    RReg1 <= instruction[9:5];
    RReg2 <= instruction[4:0];
    ALU_data1 <= RF_ReadData1;
    ALU_data2 <= {55'b0,instruction[20:12]}<<2;
    ALU_Op <= 3'b110;
    DM_Addr <= ALU_output;
    DM_Writedata <= RF_ReadData2;
end

//ldur
else if (instruction[31:21] == 11'h7C2)
begin
    RReg1 <= instruction[9:5];
    WReg <= instruction[4:0];
    ALU_data1 <= RF_ReadData1;
    ALU_data2 <= {55'b0,instruction[20:12]}<<2;
    ALU_Op <= 3'b110;
    DM_Addr <= ALU_output;
    RF_WriteData <= DM_Readdata;
end

end

endmodule
