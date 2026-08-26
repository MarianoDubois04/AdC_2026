`timescale 1ns / 10ps
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

//esta sintaxis me gusta mas pero porque tengo un monitor que me permite ver narnia
module flopr #(parameter N = 64)(input  logic clk, input  logic reset, input  logic [N-1:0] d, output logic [N-1:0] q);
    //el always lo usamos para loops, en este caso como es uno que depende clock para hacer cosas, es un always_ff a pesar que sea solo always
    always @(posedge clk or posedge reset) //lean las filminas que hablan de esto (filmina 21-23?)
        begin
            if (reset) //si reset esta activo sale solo 0
                q <= '0; //en logica secuencia hay que usar asignaciones no bloqueantes (<=)
            else // sino sale lo que tenga el flipflop adentro o por input
                q <= d;
        end
endmodule
