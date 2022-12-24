/*
Marcos Antonio Lommez Candido Ribeiro
771157
20/08/2022
ex03
*/
module ex03;
    // define data
    reg [4:0] a = 5'b1_0110   ; // binary
    reg [5:0] b = 6'b11_0101  ; // binary
    reg [5:0] c = 6'b11_0011  ; // binary
    reg [6:0] d = 7'b101_1001 ; // binary
    reg [6:0] e = 7'b101_1101 ; // binary

    reg [4:0] a1 = 0 ; // binary
    reg [5:0] b1 = 0 ; // binary
    reg [5:0] c1 = 0 ; // binary
    reg [6:0] d1 = 0 ; // binary
    reg [6:0] e1 = 0 ; // binary

    // actions
    initial
        begin : main
            $display ( "ex03" );
            a1 = ~(a-1);
            b1 = ~(b-1);
            c1 = ~(c-1);
            d1 = ~(d-1);
            e1 = ~(e-1);
            $display ( "a = %8b -> C1(a) = %8d", a, a1);
            $display ( "b = %8b -> C1(b) = %8d", b, b1);
            $display ( "c = %8b -> C1(c) = %8b", c, c1);
            $display ( "d = %8b -> C1(d) = %8b", d, d1);
            $display ( "e = %8b -> C1(e) = %8h", e, e1);
        end // main
endmodule // ex03