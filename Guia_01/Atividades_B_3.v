/*
* Marcos Antonio Lommez Candido Ribeiro
* 771157
* 03/08/2022
* Arquitetura de Computadores I
*/

module Exercicio03;
    // define data
    integer  x1 = 77;
    integer  x2 = 49;
    integer  x3 = 68;
    integer  x4 = 175;
    integer  x5 = 781;
    reg[15:0] b1 = 0;
    reg[15:0] b2 = 0;
    reg[15:0] b3 = 0;
    reg[15:0] b4 = 0;
    reg[15:0] b5 = 0;

    //actions
    initial
    begin : main
        $display ("\n03b.");
        b1 = x1;
        b2 = x2;
        b3 = x3;
        b4 = x4;
        b5 = x5;
        $display ("x1 = %o%o%o%o (4)",   b1[7:6],   b1[5:4],  b1[3:2], b1[1:0]);
        $display ("x2 = %o%o%o%o (8) ",  b2[11:9],  b2[8:6],  b2[5:3], b2[2:0]);
        $display ("x3 = %x%x%x%x (16) ", b3[15:12], b3[11:8], b3[7:4], b3[3:0]);
        $display ("x4 = %x%x%x%x (16) ", b4[15:12], b4[11:8], b4[7:4], b4[3:0]);
        $display ("x5 = %x%x%x%x (16) ", b5[15:12], b5[11:8], b5[7:4], b5[3:0]);
    end // main
endmodule // Exercicio03
