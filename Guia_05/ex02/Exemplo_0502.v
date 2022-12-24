// -------------------------
// Guia_05 - GATES
// Nome: Marcos Antonio Lommez Candido Ribeiro
// Matricula: 771157
// 31/08/2022
// -------------------------

module notA_or_B(output s1, input a, input b);
    wire w_1, w_2;
    nor NOR1(w_1, a, a);
    nor NOR2(w_2, w_1, b);
    nor NOR3(s1, w_2, w_2);
endmodule

module ex;
    reg a, b;    // independente
    wire s1;

    // nor NOR1(s1, a, b);
    notA_or_B EX05_2(s1, a, b);

    initial
        begin: initial_values
            a = 1'b0; b = 1'b0;
        end

    initial
        begin: main
            $display ( "Marcos Antonio Lommez Candido Ribeiro - 771157" );
            $display ( "Guia05 (~a | b) (with NOR)" );
            $display ( "a b =  s");
            $monitor ( "%b %b =  %b", a, b, s1);

            #1 a = 0; b = 0; 
            #1 a = 0; b = 1;
            #1 a = 1; b = 0;
            #1 a = 1; b = 1;
        end

endmodule