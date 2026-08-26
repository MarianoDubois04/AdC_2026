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
    input  logic [31:0] a,
    output logic [63:0] y
);

always_comb begin
    if((a[31:21] == 11'b111_1100_0010)||(a[31:21] == 11'b111_1100_0000)) begin
        y = {{56{a[20]}},a[19:12]};
    end
    else if(a[31:24] == 11'b101_1010_0) begin
        y = {{46{a[23]}},a[22:5]};
    end
    else begin
        y = 0;
    end
end
endmodule