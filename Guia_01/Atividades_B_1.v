/*
* Marcos Antonio Lommez Candido Ribeiro
* 771157
* 03/08/2022
* Arquitetura de Computadores I
*/

module Exercicio01;
    // define data
    integer  x1 = 27;
    integer  x2 = 56;
    integer  x3 = 721; 
    integer  x4 = 231; 
    integer  x5 = 365; 
    reg[15:0] b1 = 0;
    reg[15:0] b2 = 0;
    reg[15:0] b3 = 0;
    reg[15:0] b4 = 0;
    reg[15:0] b5 = 0;

    //actions
    initial
    begin : main
        $display ("\n01b.");
        b1 = x1;
        b2 = x2;
        b3 = x3;
        b4 = x4;
        b5 = x5;
        $display ("x1 = %3d = %16b", x1, b1);
        $display ("x2 = %3d = %16b", x2, b2);
        $display ("x3 = %3d = %16b", x3, b3);
        $display ("x4 = %3d = %16b", x4, b4);
        $display ("x5 = %3d = %16b", x5, b5);
    end // main
endmodule // Exercicio01
