// -------------------------
// Recuperação 01
// Nome: Marcos Antonio Lommez Candido Ribeiro
// Matricula: 771157
// 31/10/2022
// -------------------------

module f ( output s, input a, input b, input c );
    wire w1, w2;
    or OR__1 (s,a,w1);
    not NOT_1 (w2,c);
    and AND_1 (w1,w2,b);
endmodule // s = f (a,b,c)


module questao02;
    reg a, b, c; // Variaveis
    reg contador;
    wire s1;     // Respostas

    f F1 ( s1, a, b, c );

    initial
        begin: initial_values
            a = 1'b0; b = 1'b0; c = 1'b0; contador = 0;
        end

    initial
        begin: main
            $display ( "\n" );
            $display ( "||==================================||" );
            $display ( "||  Marcos Antonio Lommez - 771157  ||" );
            $display ( "||==================================||" );
            $display ( "|| m  0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 ||" );
            $display ( "||    0 | 0 | 1 | 0 | 1 | 1 | 1 | 1 ||" );
            $display ( "||==================================||" );
            $display ( "|| mintermo || variaveis ||  saida  ||" );
            $display ( "||----------||-----------||---------||" );
            $monitor ( "||    m%1d    ||   %b %b %b   ||    %b    ||", $time, a, b, c, s1);

            #1 a = 0; b = 0; c = 0; contador = 0;
            #1 a = 0; b = 0; c = 1; contador = 1;
            #1 a = 0; b = 1; c = 0; contador = 2;
            #1 a = 0; b = 1; c = 1; contador = 3;
            #1 a = 1; b = 0; c = 0; contador = 4;
            #1 a = 1; b = 0; c = 1; contador = 5;
            #1 a = 1; b = 1; c = 0; contador = 6;
            #1 a = 1; b = 1; c = 1; contador = 7;
            #1 $display ( "||==================================||" );
            #1 $display ( "\n" );
        end

endmodule

/* 
||==================================||
||  Marcos Antonio Lommez - 771157  ||
||==================================||
|| m  0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 ||
||    0 | 0 | 1 | 0 | 1 | 1 | 1 | 1 ||
||==================================||
|| mintermo || variaveis ||  saida  ||
||----------||-----------||---------||
||    m0    ||   0 0 0   ||    0    ||
||    m2    ||   0 0 1   ||    0    ||
||    m3    ||   0 1 0   ||    1    ||
||    m4    ||   0 1 1   ||    0    ||
||    m5    ||   1 0 0   ||    1    ||
||    m6    ||   1 0 1   ||    1    ||
||    m7    ||   1 1 0   ||    1    ||
||    m8    ||   1 1 1   ||    1    ||
||==================================|| 
*/