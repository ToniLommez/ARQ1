// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 16/09/2022
// ---------------------

module SoPa (output sa, input x, y, w, z); // Σ m ( 1, 2, 5, 9, 10, 11 )
    assign sa = (~x&~w&z ) | (x &~y&z ) | (~y&w &~z);
endmodule // SoP

module SoPb (output sb, input x, y, w, z); // Σ m ( 0, 1, 3, 5, 8, 9, 13 )
    assign sb = (~y&~w&~z) | (~x&~w&z ) | (~x&~y&z ) | (x &~w&z );
endmodule // SoP

module SoPc (output sc, input x, y, w, z); // Σ m ( 0, 1, 2, 5, 7, 8, 13, 15 )
    assign sc = (~x&~y&~w) | (~x&~y&~z) | (~y&~w&~z) | (~x&y &z ) | (x &y &z );
endmodule // SoP

module SoPd (output sd, input x, y, w, z); // Σ m ( 2, 4, 5, 6, 10, 12, 14 )
    assign sd = (~x&w &~z) | (~x&y &~w) | (y &~w&~z) | (x &w &~z);
endmodule // SoP

module SoPe (output se, input x, y, w, z); // Σ m ( 0, 1, 2, 7, 8, 9, 12, 15 )
    assign se = (~x&~y&~w) | (~x&~y&~z) | (x &~y&~w) | (x &~w&~z) | (y &w &z );
endmodule // SoP


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg x, y, w, z;
    wire sa, sb, sc, sd, se;

    // instancias
    SoPa SOPa (sa, x, y, w, z);
    SoPb SOPb (sb, x, y, w, z);
    SoPc SOPc (sc, x, y, w, z);
    SoPd SOPd (sd, x, y, w, z);
    SoPe SOPe (se, x, y, w, z);
    
    // valores iniciais
    initial 
        begin: start
            x=1'bx; // indefinidos
            y=1'bx; // indefinidos
            w=1'bx; // indefinidos
            z=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
            // identificacao
            $display("Ex03 - Marcos Antonio Lommez - 771157");

            // monitoramento
            $display("\n");
            $display(" xywz =   a   b   c   d   e");
            $monitor(" %b%b%b%b =   %b   %b   %b   %b   %b", x, y, w, z, sa, sb, sc, sd, se);
            
            
            // sinalizacao
            #1 x=0; y=0; w=0; z=0;
            #1 x=0; y=0; w=0; z=1;
            #1 x=0; y=0; w=1; z=0;
            #1 x=0; y=0; w=1; z=1;
            #1 x=0; y=1; w=0; z=0;
            #1 x=0; y=1; w=0; z=1;
            #1 x=0; y=1; w=1; z=0;
            #1 x=0; y=1; w=1; z=1;
            #1 x=1; y=0; w=0; z=0;
            #1 x=1; y=0; w=0; z=1;
            #1 x=1; y=0; w=1; z=0;
            #1 x=1; y=0; w=1; z=1;
            #1 x=1; y=1; w=0; z=0;
            #1 x=1; y=1; w=0; z=1;
            #1 x=1; y=1; w=1; z=0;
            #1 x=1; y=1; w=1; z=1;
        end
endmodule // test_module