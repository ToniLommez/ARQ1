// ---------------------
// multiplexador - desmultiplexador
// Nome: Marcos Antonio lommez Candido Ribeiro
// Matricula: 771157
// 18/09/2022
// ---------------------


// -------------------------
// multiplexer
// -------------------------
module mux ( output s, input a, input b, input select );
    // definir dados locais
    wire not_select;
    wire sa;
    wire sb;

    // descrever por portas
    nand ND1 ( not_select, select );
    nand ND2 ( sa, a , not_select );
    nand ND3 ( sb, b , select );
    nand ND4 ( s , sa, sb );
endmodule // mux

// -------------------------
// multiplexer utilizando apenas and/nand
// -------------------------
module and_mux ( output s, input a, input b, input select );
    // definir dados locais
    wire not_select;
    wire sa;
    wire sb;
    // descrever por portas
    not NOT1 ( not_select, select );
    and AND1 ( sa, a, not_select );
    and AND2 ( sb, b, select );
    or OR1 ( s , sa, sb );
endmodule // mux


module test_f7;
    // ------------------------- definir dados
    reg x;
    reg y;
    reg s;
    wire w;
    wire z1;
    wire z2;
    mux     MUX1 ( z1, x, y, s );
    and_mux MUX2 ( z2, x, y, s );
    // ------------------------- parte principal
    initial
        begin : main
            $display("Exemplo_0701 - Marcos Antonio Lommez - 771157\n");
            $display("x  y     s    previsao   teste");

            // projetar testes do modulo
            #1 $monitor("%b  %b     %b        %b        %b", x, y, s, z1, z2);
            #1 $display("---- seletor = 0 ---- ");
            #1 x=0; y=0; s=0;
            #1 x=0; y=1; s=0;
            #1 x=1; y=0; s=0;
            #1 x=1; y=1; s=0;
            #1 $display("---- seletor = 1 ---- ");
            #1 x=0; y=0; s=1;
            #1 x=0; y=1; s=1;
            #1 x=1; y=0; s=1;
            #1 x=1; y=1; s=1;
        end
endmodule // test_f7