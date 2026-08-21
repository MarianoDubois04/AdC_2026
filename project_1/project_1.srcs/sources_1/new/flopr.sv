`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2026 08:53:46 PM
// Design Name: 
// Module Name: flopr
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


module flopr #(parameter N = 64)(input logic [N-1:0] d, input logic clk, input logic reset, output logic [N-1:0] q);
    always @(posedge reset)
    begin
        if(reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
