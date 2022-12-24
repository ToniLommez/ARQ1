/*
* Marcos Antonio Lommez Candido Ribeiro
* 771157
* 03/08/2022
* Arquitetura de Computadores I
*/

module Exercicio04;
    // define data
    reg[7:0] b1 = 8'b00010010;
    reg[7:0] b2 = 8'b00011001;
    reg[7:0] b3 = 8'b00101101;
    reg[7:0] b4 = 8'b00101110;
    reg[7:0] b5 = 8'b00110101;

    // actions
    initial
        begin : main
            $display ("\n04b.");
            $display ( "b = [%2b] [%2b] [%2b] = %o %o %o", b1[5:4], b1[3:2], b1[1:0], b1[5:4], b1[3:2], b1[1:0]);
            $display ( "b = [%3b] [%3b]    = %o %o", b2[5:3], b2[2:0], b2[5:3], b2[2:0]);
            $display ( "b = [%4b] [%4b]  = %x %x", b3[7:4], b3[3:0], b3[7:4], b3[3:0]);
            $display ( "b = [%3b] [%3b]    = %o %o", b4[5:3], b4[2:0], b4[5:3], b4[2:0]);
            $display ( "b = [%2b] [%2b] [%2b] = %o %o %o", b5[5:4], b5[3:2], b5[1:0], b5[5:4], b5[3:2], b5[1:0]);
    end // main
endmodule // Exercicio04