/*
* Marcos Antonio Lommez Candido Ribeiro
* 771157
* 14/08/2022
* Arquitetura de Computadores I
*/
module Guia_0202;
    // define data
    real x1  = 0.125;  // decimal
    real x2  = 0.625;  // decimal
    real x3  = 0.3125; // decimal
    real x31 = 2.0; // decimal
    real x4  = 0.25;   // decimal
    real x41 = 3.0;   // decimal
    real x5  = 0.875;  // decimal
    real x51 = 11.0;  // decimal
    integer y1 = 7 ; // counter
    integer y2 = 7 ; // counter
    integer y3 = 7 ; // counter
    integer y4 = 7 ; // counter
    integer y5 = 7 ; // counter
    reg [7:0] b1  = 0 ; // binary
    reg [7:0] b2  = 0 ; // binary
    reg [7:0] b3  = 0 ; // binary
    reg [7:0] b31 = 0 ; // binary
    reg [7:0] b4  = 0 ; // binary
    reg [7:0] b41 = 0 ; // binary
    reg [7:0] b5  = 0 ; // binary
    reg [7:0] b51 = 0 ; // binary
    // actions
    initial
        begin : main
            $display ( "Exercicio 02" );
            $display ( "x1 = %f" , x1 );
            $display ( "x2 = %f" , x2 );
            $display ( "x3 = %f" , x3 );
            $display ( "x4 = %f" , x4 );
            $display ( "x5 = %f\n" , x5 );


            while ( x1 > 0 && y1 >= 0 )
            begin
                if ( x1*2 >= 1 )
                begin
                    b1[y1] = 1;
                    x1 = x1*2.0 - 1.0;
                end
                else
                begin
                    b1[y1] = 0;
                    x1 = x1*2.0;
                end // end if
                y1=y1-1;
            end // end while


            while ( x2 > 0 && y2 >= 0 )
            begin
                if ( x2*2 >= 1 )
                begin
                    b2[y2] = 1;
                    x2 = x2*2.0 - 1.0;
                end
                else
                begin
                    b2[y2] = 0;
                    x2 = x2*2.0;
                end // end if
                y2=y2-1;
            end // end while


            while ( x3 > 0 && y3 >= 0 )
            begin
                if ( x3*2 >= 1 )
                begin
                    b3[y3] = 1;
                    x3 = x3*2.0 - 1.0;
                end
                else
                begin
                    b3[y3] = 0;
                    x3 = x3*2.0;
                end // end if
                y3=y3-1;
            end // end while


            while ( x4 > 0 && y4 >= 0 )
            begin
                if ( x4*2 >= 1 )
                begin
                    b4[y4] = 1;
                    x4 = x4*2.0 - 1.0;
                end
                else
                begin
                    b4[y4] = 0;
                    x4 = x4*2.0;
                end // end if
                y4=y4-1;
            end // end while


            while ( x5 > 0 && y5 >= 0 )
            begin
                if ( x5*2 >= 1 )
                begin
                    b5[y5] = 1;
                    x5 = x5*2.0 - 1.0;
                end
                else
                begin
                    b5[y5] = 0;
                    x5 = x5*2.0;
                end // end if
                y5=y5-1;
            end // end while

            $display ( "b1 =    0.%8b", b1 );
            $display ( "b2 =    0.%8b", b2 );
            $display ( "b3 = %4b.%8b", x31, b3 );
            $display ( "b4 = %4b.%8b", x41, b4 );
            $display ( "b5 = %4b.%8b", x51, b5 );
        end // main
endmodule // Guia_0202