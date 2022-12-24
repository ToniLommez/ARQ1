// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 16/09/2022
// ---------------------

module SoPa (output sa, input x, y, z); // Σ m ( 1, 3, 7 )
    assign sa = (~x&z) | (y&z);
endmodule // SoP

module SoPb (output sb, input x, y, z); // Σ m ( 2, 4, 6 )
    assign sb = (y&~z) | (x&~z);
endmodule // SoP

module SoPc (output sc, input x, y, z); // Σ m ( 2, 4, 5, 7 )
    assign sc = (~x&y&~z) | (x&z) | (x&~y);
endmodule // SoP

module SoPd (output sd, input x, y, z); // Σ m ( 1, 2, 3, 7 )
    assign sd = (~x&z) | (~x&y) | (y&z);
endmodule // SoP

module SoPe (output se, input x, y, z); // Σ m ( 0, 2, 6, 7 )
    assign se = (~x&~z) | (y&~z) | (x&y);
endmodule // SoP


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg x, y, z;
    wire sa, sb, sc, sd, se;

    // instancias
    SoPa SOPa (sa, x, y, z);
    SoPb SOPb (sb, x, y, z);
    SoPc SOPc (sc, x, y, z);
    SoPd SOPd (sd, x, y, z);
    SoPe SOPe (se, x, y, z);
    
    // valores iniciais
    initial 
        begin: start
            x=1'bx; // indefinidos
            y=1'bx; // indefinidos
            z=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
            // identificacao
            $display("Ex01 - Marcos Antonio Lommez - 771157");

            // monitoramento
            $display("\n");
            $display(" xyz =   a   b   c   d   e");
            $monitor(" %b%b%b =   %b   %b   %b   %b   %b", x, y, z, sa, sb, sc, sd, se);
            
            
            // sinalizacao
            #1 x=0; y=0; z=0;
            #1 x=0; y=0; z=1;
            #1 x=0; y=1; z=0;
            #1 x=0; y=1; z=1;
            #1 x=1; y=0; z=0;
            #1 x=1; y=0; z=1;
            #1 x=1; y=1; z=0;
            #1 x=1; y=1; z=1;
        end
endmodule // test_module