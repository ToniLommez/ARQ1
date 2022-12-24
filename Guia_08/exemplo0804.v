// ---------------------
// COMPARADOR DE DESIGUALDADE
// Nome: Marcos Antonio lommez Candido Ribeiro
// Matricula: 771157
// 25/09/2022
// ---------------------


// -------------------------
// comparador de igualdade
// -------------------------
module inequalityComparator ( output s1, input a, input b);
    xor XOR2 ( s1, a, b );
endmodule // inequalityComparator


module test_InequalityComparator;
    // ------------------------- definir dados
    reg [4:0] x;
    reg [4:0] y;
    wire result;
    wire w0;
    wire w1;
    wire w2;
    wire w3;
    wire w4;

    inequalityComparator EC0 ( w0, x[0], y[0] );
    inequalityComparator EC1 ( w1, x[1], y[1] );
    inequalityComparator EC2 ( w2, x[2], y[2] );
    inequalityComparator EC3 ( w3, x[3], y[3] );
    inequalityComparator EC4 ( w4, x[4], y[4] );
    or OR1 (result, w0, w1, w2, w3, w4);

    // ------------------------- parte principal
    initial 
        begin
            $display("Ex0804 - Marcos Antonio Lommez - 771157");
            $display("---- 5 bits inequality ----");

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