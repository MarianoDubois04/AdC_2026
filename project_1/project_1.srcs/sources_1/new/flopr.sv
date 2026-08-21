`timescale 10ns / 1ps
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


module flopr #(parameter N = 64)(input  logic clk, input  logic reset, input  logic [N-1:0] d, output logic [N-1:0] q);
    always @(posedge clk or posedge reset)
        begin
            if (reset)
                q <= '0;
            else
                q <= d;
        end
endmodule
