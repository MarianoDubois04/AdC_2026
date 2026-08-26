`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2026 03:29:33 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
    //init vars
    logic clk;
    logic [63:0]a;
    logic [63:0]b;
    logic [3:0]ALUcontrol;
    logic [63:0]result;
    logic zero; 
    //init self
    alu dut (
        .a(a),
        .b(b),
        .ALUcontrol(ALUcontrol),
        .result(result),
        .zero(zero)
    );
    //init clock
    always begin
        #5 clk = ~clk;
    end
    //init testcases
    initial begin
        clk = 0;
        a = 0;
        b = 0;
        ALUcontrol = 0;
        result = 0;
        zero = 0;

        //AND case
        #10 ALUcontrol = 4'b0000;a = {64'h0000_0000_0000_0001};b = {64'h0000_0000_0000_0003}; 
        #10 if(result == 64'h0000_0000_0000_0001) begin
            $display("el AND salio bien");
        end
        else begin
            $display("el AND salio mal");
        end
        $display("%s", zero ? "mal zero" : "bien zero"); // zero check

        //OR case
        #10 ALUcontrol = 4'b0001;a = {64'h0000_0000_0000_1001};b = {64'h0000_0000_0000_1002}; 
        #10 if(result == 64'h0000_0000_0000_1003) begin
            $display("el OR salio bien");
        end
        else begin
            $display("el OR salio mal");
        end
        $display("%s", zero ? "mal zero" : "bien zero"); // zero check

        //+ case
        #10 ALUcontrol = 4'b0010;a = {64'h0000_0000_0000_0001};b = {64'h0000_0000_0000_0001}; 
        #10 if(result == 64'h0000_0000_0000_0002) begin
            $display("el + salio bien");
        end
        else begin
            $display("el + salio mal");
        end
        $display("%s", zero ? "mal zero" : "bien zero"); // zero check

        //- case
        #10 ALUcontrol = 4'b0011;a = {64'h0000_0000_0000_0001};b = {64'h0000_0000_0000_0001}; 
        #10 if(result == 64'h0000_0000_0000_0000) begin
            $display("el - salio bien");
        end
        else begin
            $display("el - salio mal");
        end
        $display("%s", !zero ? "mal zero" : "bien zero"); // zero check

        //pass case
        #10 ALUcontrol = 4'b0111;a = {64'h0000_0000_0000_1111};b = {64'h0000_0000_0000_ffff}; 
        #10 if(result == 64'h0000_0000_0000_ffff) begin
            $display("el pass b salio bien");
        end
        else begin
            $display("el pass b salio mal");
        end
        $display("%s", zero ? "mal zero" : "bien zero"); // zero check

        #10 $stop;

    end
    
endmodule
