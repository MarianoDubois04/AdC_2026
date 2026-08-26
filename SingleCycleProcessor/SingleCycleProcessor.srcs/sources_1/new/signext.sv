`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2026 01:02:17 AM
// Design Name: 
// Module Name: signext
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


module signext(
    //inputs outputs
    input  logic [31:0] a,
    output logic [63:0] y
);

//el always se usa para poder usar un if o cosas de loops en general
always_comb begin
    if((a[31:21] == 11'b111_1100_0010)||(a[31:21] == 11'b111_1100_0000)) begin //si es igual el op code a un ldur o un stur
        y = {{56{a[20]}},a[19:12]};//que le haga signextend al bit mas significativo (el que carre el signo)
    end
    else if(a[31:24] == 11'b101_1010_0) begin //si opcode es cbz
        y = {{46{a[23]}},a[22:5]}; //lo mismo de antes
    end
    else begin //si es cualquier otro comando
        y = 0;
    end
end
endmodule