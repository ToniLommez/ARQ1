/*
Marcos Antonio Lommez Candido Ribeiro
771157
20/08/2022
ex02
*/
module ex02;
    // define data
    reg [5:0] a = 8'o33  ; // qua = 123?
    reg [7:0] b = 8'h5e  ; // hex
    reg [5:0] c = 8'o55  ; // qua = 231?
    reg [6:0] d = 9'o517 ; // oct
    reg [7:0] e = 8'hd3  ; // hex
    reg [5:0] a1 = 0 ;
    reg [7:0] b1 = 0 ;
    reg [5:0] c1 = 0 ;
    reg [6:0] d1 = 0 ;
    reg [7:0] e1 = 0 ;

    // actions
    initial
        begin : main
            $display ( "ex02" );
            a1 = ~a+1;
            b1 = ~b+1;
            c1 = ~c+1;
            d1 = ~d+1;
            e1 = ~e+1;
            $display ( "a = %8b -> C1(a) = %8b", a, a1);
            $display ( "b = %8b -> C1(b) = %8b", b, b1);
            $display ( "c = %8b -> C1(c) = %8b", c, c1);
            $display ( "d = %8b -> C1(d) = %8b", d, d1);
            $display ( "e = %8b -> C1(e) = %8b", e, e1);
        end // main
endmodule // ex02