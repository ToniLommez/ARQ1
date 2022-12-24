/*
Marcos Antonio Lommez Candido Ribeiro
771157
20/08/2022
ex04
*/
module ex04;
    // define data
    reg [5:0]  a1 = 6'b01_1110; // binario
    reg [5:0]  a2 = 6'b00_1101; // binario
    reg [7:0]  b1 = 8'b0101_1011 ; // binario real
    reg [7:0]  b2 = 8'b0010_0100 ; // binario real
    reg [6:0]  c1 = 7'o55 ; // quaternario???
    reg [6:0]  c2 = 7'o33 ; // quaternario???
    reg [9:0]  d1 = 10'o321 ; // octal
    reg [9:0]  d2 = 10'o123 ; // octal
    reg [12:0] e1 = 13'h8c1 ; // hexadecimal
    reg [12:0] e2 = 13'ha1f ; // hexadecimal

    reg [5:0]  a3 = 0 ;
    reg [7:0]  b3 = 0 ;
    reg [6:0]  c3 = 0 ;
    reg [9:0]  d3 = 0 ;
    reg [12:0] e3 = 0 ;

    // actions
    initial
        begin : main
            $display ( "ex04" );
            a3 = a1 + (~a2+1);
            b3 = b1 + (~b2+1);
            c3 = c1 + (~c2+1);
            d3 = d1 + (~d2+1);
            e3 = e1 + (~e2+1);
            
            $display ( "a3 = a1-a2 = %13b-%13b = %13b = %9b (2)", a1, a2, a3, a3 );
            $display ( "b3 = b1-b2 = %8b,%4b-%8b,%4b = %8b,%4b = %4b,%4b (2)", b1[7:4], b1[3:0], b2[7:4], b2[3:0], b3[7:4], b3[3:0], b3[7:4], b3[3:0] );
            $display ( "c3 = c1-c2 = %13b-%13b = %13b = %7o%1o%1o (4)", c1, c2, c3, c3[5:4], c3[3:2], c3[1:0] );
            $display ( "d3 = d1-d2 = %13b-%13b = %13b = %7o%1o%1o (8)", d1, d2, d3, d3[8:6], d3[5:3], d3[2:0] );
            $display ( "e3 = e1-e2 = %13b-%13b = %13b = %9h (16)", e1, e2, e3, ~((e1+(~e2+1))-1) );
        end // main
endmodule // ex04