`timescale 10ns / 1ps
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

    if ((a[31:21] == 11'b111_1100_0010) ||
        (a[31:21] == 11'b111_1100_0000)) begin

        // LDUR / STUR
        y = {{55{a[20]}}, a[20:12]};

    end
    else if (a[31:24] == 8'b101_1010_0) begin

        // CBZ
        y = {{45{a[23]}}, a[23:5]};

    end
    else begin
        y = 64'b0;
    end

end
endmodule