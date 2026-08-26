`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2026 11:11:13 PM
// Design Name: 
// Module Name: signext_tb
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


module signext_tb;
    //init vars
    logic clk;
    logic [31:0]a;
    logic [63:0]y;
    //init self
    signext dut (
        .a(a),
        .y(y)
    );
    //init clock
    always begin
        #5 clk = ~clk;
    end
    //init testcases
    initial begin
        clk = 0;
        a = 0;
        y = 1;

        #10 a = {11'b111_1100_0010,9'b000_000_011,2'b00,10'b0001100111}; //ldur
        #10 a = {11'b111_1100_0010,9'b100_000_011,2'b00,10'b0001100111}; //ldur neg
        #10 a = {11'b111_1100_0010,9'b111_111_110,2'b00,10'b0001100111}; //ldur neg
        #10 a = {11'b111_1100_0000,9'b000_000_011,2'b00,10'b0001100111}; //stur
        #10 a = {11'b111_1100_0000,9'b100_000_011,2'b00,10'b0001100111}; //stur neg
        #10 a = {8'b1011_0100,19'b0000_0000_0000_0000_010,5'b00011}; //cbz
        #10 a = {8'b1011_0100,19'b1000_0000_0000_0000_010,5'b00011}; //cbz neg

        #10 $stop;

    end
    
endmodule
