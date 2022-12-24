// -------------------------
// Guia_05 - GATES
// Nome: Marcos Antonio Lommez Candido Ribeiro
// Matricula: 771157
// 31/08/2022
// -------------------------

module A_xnor_B(output s1, input a, input b);
    wire w_1, w_2, w_3, w_4;
    nand NAND1(w_1, a, b);
    nand NAND2(w_2, a, a);
    nand NAND3(w_3, b, b);
    nand NAND4(w_4, w_2, w_3);
    nand NAND5(s1, w_1, w_4);
endmodule

module ex;
    reg a, b;    // independente
    wire s1;

    // nand NAND1(s1, a, b);
    A_xnor_B EX05_7(s1, a, b);

    initial
        begin: initial_values
            a = 1'b0; b = 1'b0;
        end

    initial
        begin: main
            $display ( "Marcos Antonio Lommez Candido Ribeiro - 771157" );
            $display ( "Guia05 - ~( ~a ^ ~b ) (with NAND)" );
            $display ( "A equacao acima pode ser simplificada em apenas um XNOR" );
            $display ( "~(~a nor ~b)" );
            $display ( "             <= Complementar" );
            $display ( "~(a nor b)" );
            $display ( "             <= E' o mesmo que" );
            $display ( "(a xnor b)\n" );
            $display ( "a b =  s");
            $monitor ( "%b %b =  %b", a, b, s1);

            #1 a = 0; b = 0; 
            #1 a = 0; b = 1;
            #1 a = 1; b = 0;
            #1 a = 1; b = 1;
        end

endmodule