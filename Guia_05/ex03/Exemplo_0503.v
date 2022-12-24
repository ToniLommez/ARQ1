// -------------------------
// Guia_05 - GATES
// Nome: Marcos Antonio Lommez Candido Ribeiro
// Matricula: 771157
// 31/08/2022
// -------------------------

module A_or_notB(output s1, input a, input b);
    wire w_1;
    nand NAND1(w_1, a, a);
    nand NAND2(s1, w_1, b);
endmodule

module ex;
    reg a, b;    // independente
    wire s1;

    // nand NAND1(s1, a, b);
    A_or_notB EX05_3(s1, a, b);

    initial
        begin: initial_values
            a = 1'b0; b = 1'b0;
        end

    initial
        begin: main
            $display ( "Marcos Antonio Lommez Candido Ribeiro - 771157" );
            $display ( "Guia05 - (a | ~b) (with NAND)" );
            $display ( "a b =  s");
            $monitor ( "%b %b =  %b", a, b, s1);

            #1 a = 0; b = 0; 
            #1 a = 0; b = 1;
            #1 a = 1; b = 0;
            #1 a = 1; b = 1;
        end

endmodule