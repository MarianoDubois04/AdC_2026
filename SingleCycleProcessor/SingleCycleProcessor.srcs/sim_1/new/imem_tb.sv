`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2026 07:51:35 PM
// Design Name: 
// Module Name: imem_tb
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


module imem_tb;
    //init vars
    logic clk;
    logic [5:0] addr;
    logic [31:0] q;
    logic [31:0] ROM_tb [0:49] ='{
    32'hf800_0001, //date cuenta
    32'hf8008002,
    32'hf8000203,
    32'h8b050083,
    32'hf8018003,
    32'hcb050083,
    32'hf8020003,
    32'hcb0a03e4,
    32'hf8028004,
    32'h8b040064,
    32'hf8030004,
    32'hcb030025,
    32'hf8038005,
    32'h8a1f0145,
    32'hf8040005,
    32'h8a030145,
    32'hf8048005,
    32'h8a140294,
    32'hf8050014,
    32'haa1f0166,
    32'hf8058006,
    32'haa030166,
    32'hf8060006,
    32'hf840000c,
    32'h8b1f0187,
    32'hf8068007,
    32'hf807000c,
    32'h8b0e01bf,
    32'hf807801f,
    32'hb4000040,
    32'hf8080015,
    32'hf8088015,
    32'h8b0103e2,
    32'hcb010042,
    32'h8b0103f8,
    32'hf8090018,
    32'h8b080000,
    32'hb4ffff82,
    32'hf809001e,
    32'h8b1e03de,
    32'hcb1503f5,
    32'h8b1403de,
    32'hf85f83d9,
    32'h8b1e03de,
    32'h8b1003de,
    32'hf81f83d9,
    32'hb400001f, //instruccion 47
    32'h0000_0000,//instruccion 48
    32'h0000_0000,//49
    32'h0000_0000//50
    };
    //init self
    imem #(.N(32)) dut (
        .addr(addr),
        .q(q)
    );
    //init clock
    always begin
        #5 clk = ~clk;
    end
    //init testcases
    initial begin
        clk = 0;
        addr = 0;
        q = 0;
        //comparo el output en q con lo que deberia ir teniendo ROM_tb[addr], una mierda, pero bueno
        #10 for(addr = 0; addr < 50; addr++) begin 
            #2 if(q == ROM_tb[addr]) begin
                $display("salio bien %d", addr+1);
            end
            else begin
                $display("salio mal %d", addr+1);
            end
        end  

        #10 $stop;

    end
endmodule
