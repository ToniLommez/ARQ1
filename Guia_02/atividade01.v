/*
* Marcos Antonio Lommez Candido Ribeiro
* 771157
* 14/08/2022
* Arquitetura de Computadores I
*/
module Guia_0201;
    // define data
    real x1 = 0 ; // decimal
    real x2 = 0 ; // decimal
    real x3 = 0 ; // decimal
    real x4 = 0 ; // decimal
    real x5 = 0 ; // decimal
    real power2 = 1.0; // power of 2
    integer y = 7 ; // counter
    reg [7:0] b1  = 8'b01001000; // binary (only fraction part, Big Endian)
    reg [7:0] b2  = 8'b01011000; // binary (only fraction part, Big Endian)
    reg [7:0] b3  = 8'b11001000; // binary (only fraction part, Big Endian)
    reg [7:0] b4  = 8'b10011000; // binary (only fraction part, Big Endian)
    reg [7:0] b41 = 8'b00000001; // binary (only integer  part, Big Endian)
    reg [7:0] b5  = 8'b10110000; // binary (only fraction part, Big Endian)
    reg [7:0] b51 = 8'b00000011; // binary (only integer  part, Big Endian)
    // actions
    initial
        begin : main
            $display ( "Exercicio 01" );
            $display ( "b1 = 00.%8b", b1 );
            $display ( "b2 = 00.%8b", b2 );
            $display ( "b3 = 00.%8b", b3 );
            $display ( "b4 = %2b.%8b", b41[1:0], b4 );
            $display ( "b5 = %2b.%8b\n", b51[1:0], b5 );
            while ( y >= 0 )
            begin
                power2 = power2 / 2.0;
                if ( b1[y] == 1 )
                begin
                    x1 = x1 + power2;
                end
                if ( b2[y] == 1 )
                begin
                    x2 = x2 + power2;
                end
                if ( b3[y] == 1 )
                begin
                    x3 = x3 + power2;
                end
                if ( b4[y] == 1 )
                begin
                    x4 = x4 + power2;
                end
                if ( b5[y] == 1 )
                begin
                    x5 = x5 + power2;
                end
                y=y-1;
            end // end while
            x4 = x4 + b41;
            x5 = x5 + b51;
            $display ( "x1 = %f", x1 );
            $display ( "x2 = %f", x2 );
            $display ( "x3 = %f", x3 );
            $display ( "x4 = %f", x4 );
            $display ( "x5 = %f", x5 );
        end // main
endmodule // Guia_0201