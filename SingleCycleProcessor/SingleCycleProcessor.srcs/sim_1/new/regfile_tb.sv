`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2026 10:22:40 PM
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb;
    //init vars
    logic clk;
    logic we3; // si clk == 1 y we3 == 1 se escribe wd3 en wa3
    logic [4:0] ra1; // selector del registro de output para rd1
    logic [4:0] ra2; // selector del registro de output para rd2
    logic [4:0] wa3; // selector del registro donde escribir lo de wd3
    logic [63:0] wd3; // la info que se escribe en el registro seleccionado por wa3
    logic [63:0] rd1; // output 1
    logic [63:0] rd2; //output 2
    logic [63:0] regs_tb [0:31] = '{
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
    //init self
    regfile #(.N(64)) dut ( //el #(.N(64)) es para definirle la cantidad de bits o cables, como les sea mas facil de entender
        .clk(clk),
        .we3(we3),
        .ra1(ra1),
        .ra2(ra2),
        .wa3(wa3),
        .wd3(wd3),
        .rd1(rd1),
        .rd2(rd2)
    );

    // Clock de 100 MHz -> período 10 ns (pd: checkeen arriba que `timescale 1ns / 10ps siempre)
    always begin
        #5 clk = ~clk;
    end
    //iniciamos los casos de prueba!
    initial begin
        //def vars
        clk = 0;
        we3 = 0;
        ra1 = 0;
        ra2 = 0;
        wa3 = 0;
        wd3 = 0;
        rd1 = 0;
        rd2 = 0;

        #1 for(int i = 0; i < 30; i++)begin
            #1 if((regs_tb[ra1] == rd1) & (regs_tb[ra2] == rd2))begin
                $display("registro %d bien", rd1);
                ra1 <= ra1 + 1;
                ra2 <= ra2 + 1;
            end
            else begin
                $display("registro %d mal", rd2);
                ra1 <= ra1 + 1;
                ra2 <= ra2 + 1;
            end
        end



        #10 $stop; //tmb podria ser un finish envez de stop

    end

endmodule