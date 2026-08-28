`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2026 08:27:42 PM
// Design Name: 
// Module Name: regfile
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


module regfile (
    input  logic clk,
    input  logic we3, // si clk == 1 y we3 == 1 se escribe wd3 en wa3
    input  logic [4:0] ra1, // selector del registro de output para rd1
    input logic [4:0] ra2, // selector del registro de output para rd2
    input logic [4:0] wa3, // selector del registro donde escribir lo de wd3
    input logic [63:0] wd3, // la info que se escribe en el registro seleccionado por wa3
    output logic [63:0] rd1, // output 1
    output logic [63:0] rd2 //output 2
    );

    logic [63:0] regs [0:31] = '{
        64'h0000_0000_0000_0000,
        64'h0000_0000_0000_0001,
        64'h0000_0000_0000_0002,
        64'h0000_0000_0000_0003,
        64'h0000_0000_0000_0004,
        64'h0000_0000_0000_0005,
        64'h0000_0000_0000_0006,
        64'h0000_0000_0000_0007,
        64'h0000_0000_0000_0008,
        64'h0000_0000_0000_0009,
        64'h0000_0000_0000_000a,
        64'h0000_0000_0000_000b,
        64'h0000_0000_0000_000c,
        64'h0000_0000_0000_000d,
        64'h0000_0000_0000_000e,
        64'h0000_0000_0000_000f,
        64'h0000_0000_0000_0010,
        64'h0000_0000_0000_0011,
        64'h0000_0000_0000_0012,
        64'h0000_0000_0000_0013,
        64'h0000_0000_0000_0014,
        64'h0000_0000_0000_0015,
        64'h0000_0000_0000_0016,
        64'h0000_0000_0000_0017,
        64'h0000_0000_0000_0018,
        64'h0000_0000_0000_0019,
        64'h0000_0000_0000_001a,
        64'h0000_0000_0000_001b,
        64'h0000_0000_0000_001c,
        64'h0000_0000_0000_001d,
        64'h0000_0000_0000_001e,
        64'h0000_0000_0000_0000
    };

    //sync write!
    always_ff @(posedge clk) begin
        if (we3 && wa3 != 5'b11111) begin //calculo que esto basta para que no joda con que sea otra cosa que no sea 0
            regs[wa3] <= wd3;
        end
    end
    //async write!
    assign rd1 = (ra1 == 5'b11111) ? 64'h0000_0000_0000_0000 : regs[ra1];
    assign rd2 = (ra2 == 5'b11111) ? 64'h0000_0000_0000_0000 : regs[ra2];
    
endmodule
