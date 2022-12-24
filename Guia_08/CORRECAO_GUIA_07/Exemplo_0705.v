// ---------------------
// multiplexador - desmultiplexador
// Nome: Marcos Antonio lommez Candido Ribeiro
// Matricula: 771157
// 18/09/2022
// ---------------------


// -------------------------
// multiplexer
// -------------------------
module mux(output s, input a, b, select1, select2, select3);
    wire not_select1;
    wire not_select2;
    wire not_select3;
    wire sa;
    wire sb;
    wire sc;
    wire sd;
    wire se;
    wire sf;
    wire sg;
    wire sh;
    wire not_a;
    wire a_and_b;
    wire a_nand_b;
    wire a_xor_b;
    wire a_xnor_b;
    wire a_or_b;
    wire a_nor_b;
    wire not_b;

    not NOT1(not_select1, select1);
    not NOT2(not_select2, select2);
    not NOT3(not_select3, select3);

    not  NOT4  (not_a,    a);
    and  AND1  (a_and_b,  a, b);
    nand NAND1 (a_nand_b, a, b);
    xor  XOR1  (a_xor_b,  a, b);
    xnor XNOR1 (a_xnor_b, a, b);
    or   OR1   (a_or_b,   a, b);
    nor  NOR1  (a_nor_b,  a, b);
    nor  NOT5  (not_b,       b);

    and AND2( sa, not_select1, not_select2, not_select3, not_a);
    and AND3( sb, not_select1, not_select2, select3,     a_and_b);
    and AND4( sc, not_select1, select2,     not_select3, a_nand_b);
    and AND5( sd, not_select1, select2,     select3,     a_xor_b);
    and AND6( se, select1,     not_select2, not_select3, a_xnor_b);
    and AND7( sf, select1,     not_select2, select3,     a_or_b);
    and AND8( sg, select1,     select2,     not_select3, a_nor_b);
    and AND9( sh, select1,     select2,     select3,     not_b);

    or OR2(s, sa, sb, sc, sd, se, sf, sg, sh);
endmodule

module test_f7;
    // ------------------------- definir dados
    reg x;
    reg y;
    reg s1;
    reg s2;
    reg s3;
    wire z;
    mux MUX1 ( z, x, y, s1, s2, s3);
    // ------------------------- parte principal
    initial
        begin : main
            $display("Exemplo_0705 - Marcos Antonio Lommez - 771157\n");
            $display("x  y   s1  s2  s3   saidas");

            // projetar testes do modulo
            #1 $monitor("%b  %b    %b   %b   %b      %b", x, y, s1, s2, s3, z);
            #1 $display("----- selector = 000 ----- ");
            #1 x=0; y=0; s1=0; s2=0; s3=0;
            #1 x=0; y=1;
            #1 x=1; y=0;
            #1 x=1; y=1;
            #1 $display("----- selector = 001 ----- ");
            #1 x=0; y=0; s1=0; s2=0; s3=1;
            #1 x=0; y=1;
            #1 x=1; y=0;
            #1 x=1; y=1;
            #1 $display("----- selector = 010 ----- ");
            #1 x=0; y=0; s1=0; s2=1; s3=0;
            #1 x=0; y=1;
            #1 x=1; y=0;
            #1 x=1; y=1;
            #1 $display("----- selector = 011 ----- ");
            #1 x=0; y=0; s1=0; s2=1; s3=1;
            #1 x=0; y=1;
            #1 x=1; y=0;
            #1 x=1; y=1;
            #1 $display("----- selector = 100 ----- ");
            #1 x=0; y=0; s1=1; s2=0; s3=0;
            #1 x=0; y=1;
            #1 x=1; y=0;
            #1 x=1; y=1;
            #1 $display("----- selector = 101 ----- ");
            #1 x=0; y=0; s1=1; s2=0; s3=1;
            #1 x=0; y=1;
            #1 x=1; y=0;
            #1 x=1; y=1;
            #1 $display("----- selector = 110 ----- ");
            #1 x=0; y=0; s1=1; s2=1; s3=0;
            #1 x=0; y=1;
            #1 x=1; y=0;
            #1 x=1; y=1;
            #1 $display("----- selector = 111 ----- ");
            #1 x=0; y=0; s1=1; s2=1; s3=1;
            #1 x=0; y=1;
            #1 x=1; y=0;
            #1 x=1; y=1;
        end
endmodule // test_f7