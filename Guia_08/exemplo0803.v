// ---------------------
// COMPARADOR DE IGUALDADE
// Nome: Marcos Antonio lommez Candido Ribeiro
// Matricula: 771157
// 25/09/2022
// ---------------------


// -------------------------
// comparador de igualdade
// -------------------------
module equalityComparator ( output s1, input a, input b);
    xnor XNOR2 ( s1, a, b );
endmodule // equalityComparator


module test_equalityComparator;
    // ------------------------- definir dados
    reg [4:0] x;
    reg [4:0] y;
    wire result;
    wire w0;
    wire w1;
    wire w2;
    wire w3;
    wire w4;

    equalityComparator EC0 ( w0, x[0], y[0] );
    equalityComparator EC1 ( w1, x[1], y[1] );
    equalityComparator EC2 ( w2, x[2], y[2] );
    equalityComparator EC3 ( w3, x[3], y[3] );
    equalityComparator EC4 ( w4, x[4], y[4] );
    and AND1 (result, w0, w1, w2, w3, w4);

    // ------------------------- parte principal
    initial 
        begin
            $display("Ex0803 - Marcos Antonio Lommez - 771157");
            $display("---- 5 bits equality ----");

            // projetar testes do somador completo
            $display("  x     y        s  ");
            $monitor("%b %b      %b ", x, y, result);
               x = 5'b00000; y = 5'b00000;
            #1 x = 5'b00000; y = 5'b00001;
            #1 x = 5'b00111; y = 5'b00111;
            #1 x = 5'b00111; y = 5'b11001;
            #1 x = 5'b11111; y = 5'b11111;
        end
endmodule // test_fullAdder