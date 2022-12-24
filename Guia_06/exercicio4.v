// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 16/09/2022
// ---------------------

module PoSa (output sa, input X, Y, W, Z); // π M ( 2, 6, 7, 13 )
    assign sa = (X |~W|Z ) & (X |~Y|~W) & (~X|~Y|W |~Z);
endmodule // PoS

module PoSb (output sb, input X, Y, W, Z); // π M ( 4, 8, 9, 11, 15 )
    assign sb = (X |~Y|W |Z ) & (~X|Y |W ) & (~X|~W|~Z);
endmodule // PoS

module PoSc (output sc, input X, Y, W, Z); // π M ( 4, 8, 10, 13, 14 )
    assign sc = (X |~Y|W |Z ) & (~X|Y |W |Z ) & (~X|~Y|W |~Z) & (~X|~W|Z );
endmodule // PoS

module PoSd (output sd, input X, Y, W, Z); // π M ( 1, 2, 5, 13, 14, 15 )
    assign sd = (X |Y |~W|Z ) & (X |W |~Z) & (~Y|W |~Z) & (~X|~Y|~W);
endmodule // PoS

module PoSe (output se, input X, Y, W, Z); // π M ( 3, 5, 6, 7, 11, 15 )
    assign se = (X |~W|~Z) & (X |~Y|~Z) & (X |~Y|~W) & (~X|~W|~Z);
endmodule // PoS


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg X, Y, W, Z;
    wire sa, sb, sc, sd, se;

    // instancias
    PoSa POSa (sa, X, Y, W, Z);
    PoSb POSb (sb, X, Y, W, Z);
    PoSc POSc (sc, X, Y, W, Z);
    PoSd POSd (sd, X, Y, W, Z);
    PoSe POSe (se, X, Y, W, Z);
    
    // valores iniciais
    initial 
        begin: start
            X=1'bx; // indefinidos
            Y=1'bx; // indefinidos
            W=1'bx; // indefinidos
            Z=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
            // identificacao
            $display("Ex04 - Marcos Antonio Lommez - 771157");

            // monitoramento
            $display("\n");
            $display(" XYWZ =   a   b   c   d   e");
            $monitor(" %b%b%b%b =   %b   %b   %b   %b   %b", X, Y, W, Z, sa, sb, sc, sd, se);
            
            
            // sinalizacao
            #1 X=0; Y=0; W=0; Z=0;
            #1 X=0; Y=0; W=0; Z=1;
            #1 X=0; Y=0; W=1; Z=0;
            #1 X=0; Y=0; W=1; Z=1;
            #1 X=0; Y=1; W=0; Z=0;
            #1 X=0; Y=1; W=0; Z=1;
            #1 X=0; Y=1; W=1; Z=0;
            #1 X=0; Y=1; W=1; Z=1;
            #1 X=1; Y=0; W=0; Z=0;
            #1 X=1; Y=0; W=0; Z=1;
            #1 X=1; Y=0; W=1; Z=0;
            #1 X=1; Y=0; W=1; Z=1;
            #1 X=1; Y=1; W=0; Z=0;
            #1 X=1; Y=1; W=0; Z=1;
            #1 X=1; Y=1; W=1; Z=0;
            #1 X=1; Y=1; W=1; Z=1;
        end
endmodule // test_module