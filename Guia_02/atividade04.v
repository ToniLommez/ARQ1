/*
* Marcos Antonio Lommez Candido Ribeiro
* 771157
* 14/08/2022
* Arquitetura de Computadores I
*/
module Guia_0204;
    // define data
    reg [5:0]  b1  =  6'o66  ; // oct // original em quaternario = 0.312
    reg [11:0] b2  = 12'h3d9 ; // hex
    reg [8:0]  b3  =  9'o754 ; // oct
    reg [8:0]  b4  =  9'o310 ; // oct
    integer    b41 =  3'o7   ; // integer
    reg [11:0] b5  = 12'hb83 ; // hex
    integer    b51 =  4'hA   ; // integer
    // actions
    initial
        begin : main
        $display ( "Exercicio 4" );
        $display ( "b1 =  0.%6b   (2)            ", b1[5:0]);
        $display ( "b2 =  0.%o%o%o%o%o%o   (4)   ", b2[11:10], b2[9:8], b2[7:6], b2[5:4], b2[3:2], b2[1:0]);
        $display ( "b3 =  0.%8b (2)              ", b3[8:1]);
        $display ( "b4 = %o%o.%o%o%o      (4)    ", b41[3:2], b41[1:0], b4[8:7], b4[6:5], b4[4:3]);
        $display ( "b5 = %o%o.%o%o%o%o%o%o   (4) ", b51[3:2], b51[1:0], b5[11:10], b5[9:8], b5[7:6], b5[5:4], b5[3:2], b5[1:0]);
        end // main
endmodule // Guia_0204