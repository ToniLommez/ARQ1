/*
Marcos Antonio Lommez Candido Ribeiro
771157
20/08/2022
ex05
*/
module ex05;
    // define data
    reg [5:0] a1 = 7'b010_1101;   // binario
    reg [5:0] a2 = 7'b000_1100;   // binario
    reg [7:0] b1 = 8'b0101_1101 ; // binario real
    reg [7:0] b2 = 8'b0010_1010 ; // nao soube escrever este octal
    reg [6:0] c1 = 6'o66 ;        // quaternario???
    reg [6:0] c2 = 4'he ;         // hex
    reg [8:0] d1 = 8'hcb ;        // hex
    reg [8:0] d2 = 7'b100_1001 ;  // binario
    reg [8:0] e1 = 39 ;           // decimal
    reg [8:0] e2 = 8'h2a ;        // hexadecimal

    reg [5:0] a3 = 0 ;
    reg [7:0] b3 = 0 ;
    reg [6:0] c3 = 0 ;
    reg [8:0] d3 = 0 ;
    reg [8:0] e3 = 0 ;

    // actions
    initial
        begin : main
            $display ( "ex05" );
            a3 = a1 + (~a2+1);
            b3 = b1 + (~b2+1);
            c3 = c1 + (~c2+1);
            d3 = d1 + (~d2+1);
            e3 = e1 + (~e2+1);
            
            $display ( "a3 = a1-a2 = %13b-%13b = %13b", a1, a2, a3);
            $display ( "b3 = b1-b2 = %8b,%4b-%8b,%4b = %8b,%4b ", b1[7:4], b1[3:0], b2[7:4], b2[3:0], b3[7:4], b3[3:0]);
            $display ( "c3 = c1-c2 = %13b-%13b = %13b", c1, c2, c3);
            $display ( "d3 = d1-d2 = %13b-%13b = %13b", d1, d2, d3);
            $display ( "e3 = e1-e2 = %13b-%13b = %13b", e1, e2, e3);
        end // main
endmodule // ex05