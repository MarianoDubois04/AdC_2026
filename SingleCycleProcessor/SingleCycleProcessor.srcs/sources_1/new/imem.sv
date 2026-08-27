`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2026 07:26:48 PM
// Design Name: 
// Module Name: imem
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


module imem #(parameter N = 32)(
    input logic [5:0] addr,
    output logic [N-1:0] q
    );

    logic [N-1:0] ROM [0:63] ='{
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
    32'h0000_0000,//instruccion 48 (implementacion alternativa escribir default: '0}; )
    32'h0000_0000,//49
    32'h0000_0000,//50
    32'h0000_0000,//51
    32'h0000_0000,//52
    32'h0000_0000,//53
    32'h0000_0000,//54
    32'h0000_0000,//55
    32'h0000_0000,//56
    32'h0000_0000,//57
    32'h0000_0000,//58
    32'h0000_0000,//59
    32'h0000_0000,//60
    32'h0000_0000,//61
    32'h0000_0000,//62
    32'h0000_0000,//63
    32'h0000_0000//64
    };

    assign q = ROM[addr];

endmodule
