// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez
// Matricula: 771157
// ---------------------
// ---------------------
// -- expression
// ---------------------

module fxy (output s, input x, y);
    assign s = ~x & y | x & ~y;
endmodule // fxy

// mintermos
module SoP (output s, input x, y);
assign s = ( ~x & y ) // 1
         | ( x & ~y ); // 2
endmodule // SoP

// MAXTERMOS
module PoS (output S, input X, Y);
assign S = ( X | Y ) // 0
         & ( ~X | ~Y ); // 3
endmodule // PoS

// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg x, y;
    wire s1, s2, s3;
    // instancias
    fxy FXY1 (s1, x, y);
    SoP SOP1 (s2, x, y);
    PoS POS1 (s3, x, y);
    
    // valores iniciais
    initial 
        begin: start
            x=1'bx; // indefinidos
            y=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
        // identificacao
        $display("Exemplo- xxx yyy zzz - 999999");
        $display("Test boolean expression");
        $display("\nx'&y+x&y' = s\n");
        // monitoramento
        $display("x y = s1 s2 s3");
        $monitor("%2b %2b = %2b %2b %2b", x, y, s1, s2, s3);
        // sinalizacao
        #1 x=0; y=0;
        #1 x=0; y=1;
        #1 x=1; y=0;
        #1 x=1; y=1;
        end
endmodule // test_module