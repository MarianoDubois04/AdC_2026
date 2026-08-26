`timescale 1ns / 10ps
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
    //init vars
    logic clk;
    logic reset;
    logic [63:0] d;
    logic [63:0] q;
    //init self
    flopr #(.N(64)) dut ( //el #(.N(64)) es para definirle la cantidad de bits o cables, como les sea mas facil de entender
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock de 100 MHz -> período 10 ns (pd: checkeen arriba que `timescale 1ns / 10ps siempre)
    always begin
        #5 clk = ~clk;
    end
    //iniciamos los casos de prueba!
    initial begin
        //def vars
        clk = 0;
        reset = 1;
        d = 0;

        // aca empiezan los casos de prueba 
        #10 d = 64'h1111_1111_1111_1111;
        #10 d = 64'h2222_2222_2222_2222;
        #10 d = 64'h3333_3333_3333_3333;
        #10 d = 64'h4444_4444_4444_4444;
        #10 d = 64'h5555_5555_5555_5555;
        reset = 0;
        #10 d = 64'h6666_6666_6666_6666;
        #10 d = 64'haaaa_aaaa_aaaa_aaaa;
        #10 d = 64'hbbbb_bbbb_bbbb_bbbb;
        #10 d = 64'habcd_ef12_3456_7890;
        #10 d = 64'h1010_1010_1010_1010;

        #10 $stop; //tmb podria ser un finish envez de stop

    end

endmodule
