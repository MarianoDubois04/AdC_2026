`timescale 1ns / 1ps
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


module flopr_tb();
    logic d, clk, reset, q;

    flopr dut(d, clk, reset, q);
    
    // apply inputs one at a time
    initial begin
    d = 0; clk = 0; reset = 0; #10;
    d = 1; #10;
    d = 1; reset = 0; #10;
    end
endmodule
