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
    regfile dut ( //el #(.N(64)) es para definirle la cantidad de bits o cables, como les sea mas facil de entender
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
        // test de input output correcta
        for(int i = 0; i < 32; i++)begin
            ra1 <= i; // esta operacion deberia ser ilegal lol
            ra2 <= i;
            @(negedge clk); //esto asegura que checkeemos siempre despues del flanco descendente de clk
            if((regs_tb[ra1] == rd1) & (regs_tb[ra2] == rd2))begin
                $display("registro %d bien", i);
            end
            else begin
                $display("registro %d mal", i);
            end
        end
        // funciona el mecanismo de escritura de registros
        we3 <= 1; wa3 <= 5'b00001; wd3 <= 64'h0000_0000_0000_0002; ra1 <= 5'b00001;
        @(posedge clk);
        #1; //me aseguro de que checkee despues del flanco positivo
        if(rd1 == 64'h0000_0000_0000_0002)begin
            $display("el write salio bien");
        end
        else begin
            $display("el write salio mal");
        end
        // el we3 en 0 hace que no se escriban nuevos valores
        we3 <= 0; wa3 <= 5'b00001; wd3 <= 64'h0000_0000_0000_0001; ra1 <= 5'b00001;
        @(posedge clk);
        #1;
        if(rd1 == 64'h0000_0000_0000_0002)begin
            $display("el we3 funciona bien");
        end
        else begin
            $display("el we3 funciona mal");
        end
        // xzr no se puede sobrescribir
        we3 <= 1; wa3 <= 5'b11111; wd3 <= 64'h0000_0000_0000_0002; ra1 <= 5'b11111;
        @(posedge clk);
        #1;
        if(rd1 == 64'h0000_0000_0000_0000)begin
            $display("el xzr funciona bien y no se sobre escribe");
        end
        else begin
            $display("el xzr se sobrescribio :(");
        end

        #10 $stop; //tmb podria ser un finish envez de stop

    end

endmodule