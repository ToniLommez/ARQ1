/*
* Marcos Antonio Lommez Candido Ribeiro
* 771157
* 03/08/2022
* Arquitetura de Computadores I
*/

module Exercicio02;
    // define data
    integer  x1 = 0;
    integer  x2 = 0;
    integer  x3 = 0;
    integer  x4 = 0;
    integer  x5 = 0;
    reg[7:0] b1 = 8'b00010111;
    reg[7:0] b2 = 8'b00011100;
    reg[7:0] b3 = 8'b00101100;
    reg[7:0] b4 = 8'b00110101;
    reg[7:0] b5 = 8'b00111001;

    //actions
    initial
    begin : main
        $display ("\n02b.");
        x1 = b1;
        x2 = b2;
        x3 = b3;
        x4 = b4;
        x5 = b5;
        $display ("x1 = %3d = %8b", x1, b1);
        $display ("x2 = %3d = %8b", x2, b2);
        $display ("x3 = %3d = %8b", x3, b3);
        $display ("x4 = %3d = %8b", x4, b4);
        $display ("x5 = %3d = %8b", x5, b5);
    end // main
endmodule // Exercicio02
