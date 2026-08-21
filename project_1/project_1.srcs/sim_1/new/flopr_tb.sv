`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2026 08:56:22 PM
// Design Name: 
// Module Name: flopr_tb
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


module flopr_tb;

    logic clk;
    logic reset;
    logic [63:0] d;
    logic [63:0] q;

    flopr #(.N(64)) dut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock de 100 MHz -> período 10 ns
    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 1;
        d = 0;

        // acá empiezan los casos de prueba

    end

endmodule
