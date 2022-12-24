// -------------------------
// Recuperação 01
// Nome: Marcos Antonio Lommez Candido Ribeiro
// Matricula: 771157
// 31/10/2022
// -------------------------

module sopCanon( output s, input a, input b, input c, input d );
    and  AND1 ( s1, ~a, ~b, ~c, ~d );
    and  AND2 ( s2, ~a, ~b, ~c,  d );
    and  AND3 ( s3, ~a,  b, ~c,  d );
    and  AND4 ( s4, ~a,  b,  c, ~d );
    and  AND5 ( s5,  a, ~b, ~c, ~d );
    and  AND6 ( s6,  a, ~b, ~c,  d );
    and  AND7 ( s7,  a,  b, ~c, ~d );
    and  AND8 ( s8,  a,  b,  c, ~d );
    or   OR_1 ( s, s1, s2, s3, s4, s5, s6, s7, s8 );
endmodule // sopCanon

module sopSimpl( output s, input a, input b, input c, input d );
    and  AND1 ( s1, ~b, ~c );
    and  AND2 ( s2, ~a, ~c,  d );
    and  AND3 ( s3,  a, ~c, ~d );
    and  AND4 ( s4,  b,  c, ~d );
    or   OR_1 ( s, s1, s2, s3, s4);
endmodule // sopSimpl

module posCanon( output s, input A, input B, input C, input D );
    or   OR_1 ( s1,  A,  B, ~C,  D);
    or   OR_2 ( s2,  A,  B, ~C, ~D);
    or   OR_3 ( s3,  A, ~B,  C,  D);
    or   OR_4 ( s4,  A, ~B, ~C, ~D);
    or   OR_5 ( s5, ~A,  B, ~C,  D);
    or   OR_6 ( s6, ~A,  B, ~C, ~D);
    or   OR_7 ( s7, ~A, ~B,  C, ~D);
    or   OR_8 ( s8, ~A, ~B, ~C, ~D);
    and  AND1  ( s, s1, s2, s3, s4, s5, s6, s7, s8 );
endmodule // posCanon

module posSimpl( output s, input A, input B, input C, input D );
    or   OR_1 ( s1, ~C, ~D );
    or   OR_2 ( s2,  B, ~C );
    or   OR_3 ( s3, ~A, ~B, ~D );
    or   OR_4 ( s4,  A, ~B,  C,  D );
    and  AND1 ( s, s1, s2, s3, s4);
endmodule // sopCanon

module questao01;
    reg a, b, c, d;      // Variaveis
    wire s1, s2, s3, s4; // Respostas

    sopCanon SOPCANON ( s1, a, b, c, d ); // SoP Canonica
    sopSimpl SOPSIMPL ( s2, a, b, c, d ); // SoP Simplificada
    posCanon POSCANON ( s3, a, b, c, d ); // PoS Canonica
    posSimpl POSSIMPL ( s4, a, b, c, d ); // PoS Simplificada

    initial
        begin: initial_values
            a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0;
        end

    initial
        begin: main
            $display ( "----------------------------------------------" );
            $display ( "Marcos Antonio Lommez Candido Ribeiro - 771157" );
            $display ( "----------------------------------------------" );
            $display ( " variaveis           SoP             PoS" );
            $display ( "  a b c d       Canon. Simpl.   Canon. Simpl.");
            $monitor ( "  %b %b %b %b    =    %b      %b        %b      %b", a, b, c, d, s1, s2, s3, s4);

            #1 a = 0; b = 0; c = 0; d = 0;
            #1 a = 0; b = 0; c = 0; d = 1;
            #1 a = 0; b = 0; c = 1; d = 0;
            #1 a = 0; b = 0; c = 1; d = 1;
            #1 a = 0; b = 1; c = 0; d = 0;
            #1 a = 0; b = 1; c = 0; d = 1;
            #1 a = 0; b = 1; c = 1; d = 0;
            #1 a = 0; b = 1; c = 1; d = 1;
            #1 a = 1; b = 0; c = 0; d = 0;
            #1 a = 1; b = 0; c = 0; d = 1;
            #1 a = 1; b = 0; c = 1; d = 0;
            #1 a = 1; b = 0; c = 1; d = 1;
            #1 a = 1; b = 1; c = 0; d = 0;
            #1 a = 1; b = 1; c = 0; d = 1;
            #1 a = 1; b = 1; c = 1; d = 0;
            #1 a = 1; b = 1; c = 1; d = 1;
        end
endmodule

/* 
----------------------------------------------
Marcos Antonio Lommez Candido Ribeiro - 771157
----------------------------------------------
 variaveis           SoP             PoS
  a b c d       Canon. Simpl.   Canon. Simpl.
  0 0 0 0    =    1      1        1      1
  0 0 0 1    =    1      1        1      1
  0 0 1 0    =    0      0        0      0
  0 0 1 1    =    0      0        0      0
  0 1 0 0    =    0      0        0      0
  0 1 0 1    =    1      1        1      1
  0 1 1 0    =    1      1        1      1
  0 1 1 1    =    0      0        0      0
  1 0 0 0    =    1      1        1      1
  1 0 0 1    =    1      1        1      1
  1 0 1 0    =    0      0        0      0
  1 0 1 1    =    0      0        0      0
  1 1 0 0    =    1      1        1      1
  1 1 0 1    =    0      0        0      0
  1 1 1 0    =    1      1        1      1
  1 1 1 1    =    0      0        0      0
 */