`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2026 02:55:45 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input logic [63:0] a,
    input logic [63:0] b,
    input logic [3:0] ALUcontrol,
    output logic [63:0] result,
    output logic zero //no hace falta que tenga [] porque ocupa 1 solo bit
    );

    always_comb begin
        case(ALUcontrol)
            4'b0000 : result = a & b;
            4'b0001 : result = a | b;
            4'b0010 : result = a + b;
            4'b0011 : result = a - b;
            4'b0111 : result = b;
            default : result = '0; //forma facil de asignar a N bits que ocupe algo un solo numero
        endcase
        zero = (result == '0); //puede resolver expresiones de esta forma
    end
endmodule

