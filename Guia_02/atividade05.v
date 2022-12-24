/*
* Marcos Antonio Lommez Candido Ribeiro
* 771157
* 14/08/2022
* Arquitetura de Computadores I
*/
module Guia_0205;
    // define data
    reg [7:0] a1 = 8'b0101_0100 ; // binary
    reg [7:0] b1 = 8'b0011_1010 ; // binary

    reg [7:0] a2 = 8'b1001_0110 ; // binary
    reg [7:0] b2 = 8'b0010_0100 ; // binary

    reg [7:0] a3 = 8'b0100_0010 ; // binary
    reg [7:0] b3 = 8'b0011_0100 ; // binary

    reg [7:0] a4 = 8'b10110_110 ; // binary
    reg [7:0] b4 = 8'b00010_101 ; // binary

    reg [7:0] a5 = 8'b1101001_1 ; // binary
    reg [7:0] b5 = 8'b0001011_0 ; // binary

    reg [7:0] c1;
    reg [7:0] c2;
    reg [7:0] c3;
    reg [7:0] c4;
    reg [7:0] c5;
    
    // actions
    initial
        begin : main
            $display ( "Exercicio 5" );
            c1 = a1 + b1;
            c2 = a2 - b2;
            c3 = a3 * b3;
            c4 = a4 / b4;
            c5 = a5 % b5;
            $display ( "c1 = a1+b1 = %4b.%4b ", c1[7:4], c1[3:0]);
            $display ( "c2 = a2-b2 = %4b.%4b ", c2[7:4], c2[3:0]);
            $display ( "c3 = a3*b3 = %b       nao sei colocar a parte fracionaria", c3[7:3]);
            $display ( "c4 = a4/b4 = %b.   nao sei colocar a parte fracionaria", c4[7:0]);
            $display ( "c5 = a5%%b5 = %7b.%1b", c5[7:1], c5[0:0]);
        end // main
endmodule // Guia_0205