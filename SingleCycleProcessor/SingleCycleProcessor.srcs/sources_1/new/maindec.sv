`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2026 10:59:36 AM
// Design Name: 
// Module Name: maindec
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module maindec(
    input logic [10:0] Op,
    output logic Reg2Loc,
    output logic ALUsrc,
    output logic MemtoReg,
    output logic RegWrite,
    output logic Memread,
    output logic Branch,
    output logic [1:0] ALUop
    );

    always_comb begin
        casez(Op)
            11'111_1100_0010 : Reg2Loc = 0; ALUsrc = 1; MemtoReg = 1; RegWrite = 1; MemRead = 1; Branch = 0; ALUop = ; //LDUR
            11'111_1100_0000 : Reg2Loc = ; ALUsrc = ; MemtoReg = ; RegWrite = ; MemRead = ; Branch = ; ALUop = ; //STUR
            11'101_1010_0??? : Reg2Loc = ; ALUsrc = ; MemtoReg = ; RegWrite = ; MemRead = ; Branch = ; ALUop = ; //CBZ
            11'100_0101_1000 : Reg2Loc = ; ALUsrc = ; MemtoReg = ; RegWrite = ; MemRead = ; Branch = ; ALUop = ; //ADD
            11'110_0101_1000 : Reg2Loc = ; ALUsrc = ; MemtoReg = ; RegWrite = ; MemRead = ; Branch = ; ALUop = ; //SUB
            11'100_0101_0000 : Reg2Loc = ; ALUsrc = ; MemtoReg = ; RegWrite = ; MemRead = ; Branch = ; ALUop = ; //AND
            11'101_0101_0000 : Reg2Loc = ; ALUsrc = ; MemtoReg = ; RegWrite = ; MemRead = ; Branch = ; ALUop = ; //ORR
            default : begin Reg2Loc = 0; ALUsrc = 0; MemtoReg = 0; RegWrite = 0; MemRead = 0; Branch = 0; ALUop = 2'b00; end
        endcase
        zero = (result == '0); //puede resolver expresiones de esta forma
    end
endmodule
