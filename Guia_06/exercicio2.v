// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 16/09/2022
// ---------------------

module PoSa (output sa, input X, Y, Z); // π M ( 4, 5, 7 )
    assign sa = (~X|~Z) & (~X|Y);
endmodule // PoS

module PoSb (output sb, input X, Y, Z); // π M ( 1, 6, 7 )
    assign sb = (X|Y|~Z) & (~X|~Y);
endmodule // PoS

module PoSc (output sc, input X, Y, Z); // π M ( 1, 2, 3, 6 )
    assign sc = (X|~Z) & (X|~Y) & (~Y|Z);
endmodule // PoS

module PoSd (output sd, input X, Y, Z); // π M ( 0, 3, 5, 7 )
    assign sd = (X|Y|Z) & (~Y|~Z) & (~X|~Z);
endmodule // PoS

module PoSe (output se, input X, Y, Z); // π M ( 1, 3, 6, 7 )
    assign se = (X|~Z) & (~Y|~Z) & (~X|~Y);
endmodule // PoS


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg X, Y, Z;
    wire sa, sb, sc, sd, se;

    // instancias
    PoSa POSa (sa, X, Y, Z);
    PoSb POSb (sb, X, Y, Z);
    PoSc POSc (sc, X, Y, Z);
    PoSd POSd (sd, X, Y, Z);
    PoSe POSe (se, X, Y, Z);
    
    // valores iniciais
    initial 
        begin: start
            X=1'bx; // indefinidos
            Y=1'bx; // indefinidos
            Z=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
            // identificacao
            $display("Ex02 - Marcos Antonio Lommez - 771157");

            // monitoramento
            $display("\n");
            $display(" XYZ =   a   b   c   d   e");
            $monitor(" %b%b%b =   %b   %b   %b   %b   %b", X, Y, Z, sa, sb, sc, sd, se);
            
            
            // sinalizacao
            #1 X=0; Y=0; Z=0;
            #1 X=0; Y=0; Z=1;
            #1 X=0; Y=1; Z=0;
            #1 X=0; Y=1; Z=1;
            #1 X=1; Y=0; Z=0;
            #1 X=1; Y=0; Z=1;
            #1 X=1; Y=1; Z=0;
            #1 X=1; Y=1; Z=1;
        end
endmodule // test_module