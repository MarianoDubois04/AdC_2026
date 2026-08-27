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
        //FALTA AGREGAR TESTS DE SUMA Y RESTA DE NEGATIVOS!!!
        //AND case
        #10 ALUcontrol = 4'b0000;a = {64'h0000_0000_0000_0001};b = {64'h0000_0000_0000_0003}; //(0001 & 0011 = 0001)
        #10 if(result == 64'h0000_0000_0000_0001) begin
            $display("el AND salio bien");
        end
        else begin
            $display("el AND salio mal");
        end
        $display("%s", zero ? "mal zero" : "bien zero"); // zero check (por si no se entiende que hice mirar https://chipverify.com/verilog/verilog-conditional-statements)

//-------------------------------------------------------------------------------------------------------------------------------------------------

        //OR case
        #10 ALUcontrol = 4'b0001;a = {64'h0000_0000_0000_1001};b = {64'h0000_0000_0000_1002}; //({3'h100,4'b0001} | {3'h100,4'b0010} = {3'h100,4'b0011})
        #10 if(result == 64'h0000_0000_0000_1003) begin
            $display("el OR salio bien");
        end
        else begin
            $display("el OR salio mal");
        end
        $display("%s", zero ? "mal zero" : "bien zero"); // zero check

//-------------------------------------------------------------------------------------------------------------------------------------------------

        //+ case (dos positivos)
        #10 ALUcontrol = 4'b0010;a = {64'h0000_0000_0000_0001};b = {64'h0000_0000_0000_0001}; //(1+1=2)
        #10 if(result == 64'h0000_0000_0000_0002) begin
            $display("el + salio bien");
        end
        else begin
            $display("el + salio mal");
        end
        $display("%s", zero ? "mal zero" : "bien zero"); // zero check

        //+ case (2 negativos)
        #10 ALUcontrol = 4'b0010;a = {64'hffff_ffff_ffff_ffff};b = {64'hffff_ffff_ffff_ffff}; //((-1)+(-1)=(-2))
        #10 if(result == 64'hffff_ffff_ffff_fffe) begin
            $display("el + salio bien");
        end
        else begin
            $display("el + salio mal");
        end
        $display("%s", zero ? "mal zero" : "bien zero"); // zero check

        //+ case (1 positivo 1 negativo)
        #10 ALUcontrol = 4'b0010;a = {64'h0000_0000_0000_0001};b = {64'hffff_ffff_ffff_ffff}; //(1+(-1)=0)
        #10 if(result == 64'h0000_0000_0000_0000) begin
            $display("el + salio bien");
        end
        else begin
            $display("el + salio mal");
        end
        $display("%s", !zero ? "mal zero" : "bien zero"); // zero check (tiene que dar zero)

        //+ case (overflow) 64'h7fff_ffff_ffff_ffff es el numero mas grande de 64 bits positivo
        #10 ALUcontrol = 4'b0010;a = {64'h7fff_ffff_ffff_ffff};b = {64'h0000_0000_0000_0001}; //((2**63-1)+1=overflow)
        #10 if(result == 64'h8000_0000_0000_0000) begin
            $display("el + salio bien???");
        end
        else begin
            $display("el + salio mal???");
        end
        $display("%s", zero ? "mal zero" : "bien zero"); // zero check
        
//-------------------------------------------------------------------------------------------------------------------------------------------------

        //- case (2 positivos)
        #10 ALUcontrol = 4'b0011;a = {64'h0000_0000_0000_0001};b = {64'h0000_0000_0000_0001}; //(1-1=0)
        #10 if(result == 64'h0000_0000_0000_0000) begin
            $display("el - salio bien");
        end
        else begin
            $display("el - salio mal");
        end
        $display("%s", !zero ? "mal zero" : "bien zero"); // zero check (tiene que dar zero)

        //- case (2 negativos)
        #10 ALUcontrol = 4'b0011;a = {64'hffff_ffff_ffff_ffff};b = {64'hffff_ffff_ffff_ffff}; //((-1)-(-1)=0)
        #10 if(result == 64'h0000_0000_0000_0000) begin
            $display("el - salio bien");
        end
        else begin
            $display("el - salio mal");
        end
        $display("%s", !zero ? "mal zero" : "bien zero"); // zero check (tiene que dar zero)

        //- case (1 positivo y 1 negativo)
        #10 ALUcontrol = 4'b0011;a = {64'h0000_0000_0000_0001};b = {64'hffff_ffff_ffff_ffff}; //(1-(-1)=2)
        #10 if(result == 64'h0000_0000_0000_0002) begin
            $display("el - salio bien");
        end
        else begin
            $display("el - salio mal");
        end
        $display("%s", zero ? "mal zero" : "bien zero"); // zero check

        //- case (overflow)
        #10 ALUcontrol = 4'b0011;a = {64'h8000_0000_0000_0000};b = {64'h0000_0000_0000_0001}; //((-2**63-1)-1=overflow)
        #10 if(result == 64'h7fff_ffff_ffff_ffff) begin
            $display("el - salio bien");
        end
        else begin
            $display("el - salio mal");
        end
        $display("%s", zero ? "mal zero" : "bien zero"); // zero check

//-------------------------------------------------------------------------------------------------------------------------------------------------

        //pass case
        #10 ALUcontrol = 4'b0111;a = {64'h0000_0000_0000_1111};b = {64'h0000_0000_0000_ffff}; //(b = ffff => result = ffff = b) 
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
