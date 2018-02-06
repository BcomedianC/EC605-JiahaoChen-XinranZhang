module Single_Cycle_Datapath(clk, rst);

input clk, rst;

wire [63:0] instruction_address;
reg [63:0] PC_address;
reg PC_mux;

reg [31:0] instruction;

reg [4:0] RReg1,RReg2, WReg;
wire [63:0] RF_WriteData, RF_ReadData1, RF_ReadData2;
reg RF_WriteEnable;

reg [63:0] ALU_data1, ALU_data2, ALU_output;
reg [2:0] ALU_Op;
reg ALU_Zero;

reg [63:0] DM_Addr, DM_Writedata, DM_Readata;
reg DM_MemWrite, DM_MemRead;

ProgramCounter program_counter(instruction_address, PC_address, PC_mux, clk, rst);

Instruction_Memory instruction_memory(instruction_address, instruction);

Register_File register_file(RReg1, RReg2, WReg, RF_WriteData, RF_WriteEnable, RF_ReadData1, RF_ReadData2, clk, rst);

ALU alu_unit( ALU_data1, ALU_data2, ALU_output, ALU_Op, ALU_Zero);

Data_Memory data_memory(DM_Addr, DM_Writedata, DM_Readdata, DM_MemWrite, DM_MemRead, clk, rst);

always@(posedge clk or posedge rst)
begin

PC_mux <= 0;

//branch
if (instruction[31:21] == 11'h0A0)
begin
    PC_address <= {45'b0,instruction[23:5]}<<2;
    RReg2 <= instruction[4:0];
    ALU_data2 <= RF_ReadData2;
    ALU_Op <= 3'b101;
    if (ALU_Zero == 0)
        PC_mux <= 1;//maybe need to set to zero after branch is completed
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
