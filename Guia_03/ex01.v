/*
Marcos Antonio Lommez Candido Ribeiro
771157
20/08/2022
ex01
*/
module ex01;
    // define data
    reg [5:0] a = 6'b1001 ; // binary
    reg [7:0] b = 8'b1100 ; // binary
    reg [5:0] c = 6'b100111 ; // binary
    reg [6:0] d = 7'b101001 ; // binary
    reg [7:0] e = 8'b110001 ; // binary

    // actions
    initial
        begin : main
            $display ( "ex01" );
            $display ( "a = %8b -> C1(a) = %8b", a, ~a);
            $display ( "b = %8b -> C1(b) = %8b", b, ~b);
            $display ( "c = %8b -> C1(c) = %8b", c, ~c);
            $display ( "d = %8b -> C1(d) = %8b", d, ~d);
            $display ( "e = %8b -> C1(e) = %8b", e, ~e);
        end // main
endmodule // ex01