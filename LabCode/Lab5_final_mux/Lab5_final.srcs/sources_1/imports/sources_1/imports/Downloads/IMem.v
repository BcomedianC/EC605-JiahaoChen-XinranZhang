`timescale 1ns / 1ns
module Instruction_Memory(Address, ReadData1);
parameter BITSIZE = 32;
parameter REGSIZE = 32;
input [REGSIZE-1:0] Address;
output reg [BITSIZE-1:0] ReadData1;

reg [BITSIZE-1:0] memory_file [0:REGSIZE-1];	// Entire list of memory

// Asyncronous read of memory. Was not specified.
always @(Address, memory_file[Address])
begin
	ReadData1 = memory_file[Address];
end

//filling the instruction memory 
initial
	begin
		memory_file[1] = 32'b11110010100_0000000000000001_00010; //movk x2, 1
		memory_file[2] = 32'b11110010100_0000000000000111_00001; //moxk x1, 7
		memory_file[3] = 32'b10001011000_00001_000000_00010_00010; //add x2, x2, x1
        memory_file[4] = 32'b10001010000_00010_000000_00001_00011; //and x3, x1, x2
        memory_file[5] = 32'b10001011000_00010_000000_00001_00100; //add x4, x1, x2
        memory_file[6] = 32'b10101010000_00010_000000_00001_00101; //orr x5, x1, x2
		memory_file[7] = 32'b11001011000_00010_000000_00001_00110; //sub x6, x1, x2
        memory_file[8] = 32'b11111000000_00000000011_00010_00001; //stur x1, [x2, 3]
        memory_file[9] = 32'b11111000010_00000000011_00010_00111; //ldur x7, [x2, 3]
        memory_file[10] = 32'b00010100000_0000000000000000001010; //b 10
        memory_file[20] = 32'b10001011000_00010_000000_00001_01000; //add x8, x1, x2
        memory_file[21] = 32'b10110100000_000000000000111_00001; //cbz x1, 5
        memory_file[22] = 32'b10110100000_000000000000111_11111; //cbz x31, 5
        memory_file[27] = 32'b10001011000_00010_000000_00001_01001; //add x9, x1, x2        
	end

endmodule
