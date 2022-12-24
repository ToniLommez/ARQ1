// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 27/08/2022
// ---------------------
// ---------------------
// -- expression f(x,y) = 1 1 0 1
// ---------------------

module SoP (output s, input x, y); // mintermos
    assign s = (~x & ~y) | // m0
               (~x & y ) | // m1
               ( x & y ) ; // m3
endmodule // SoP

module PoS (output S, input X, Y); // maxtermos
    assign S = (~X | Y) ; // M2
endmodule // PoS

// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg x, y;
    wire s1, s2;

    // instancias
    SoP SOP1 (s1, x, y);
    PoS POS1 (s2, x, y);
    
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
            $display("Ex05a - Marcos Antonio Lommez - 771157");
            $display(" f(x,y) = 1 1 0 1 ");

            // monitoramento
            $display(" x | y ->   SoP  PoS");
            $monitor("%2b |%2b =    %2b   %2b", x, y, s1, s2);
            
            // sinalizacao
            #1 x=0; y=0;
            #1 x=0; y=1;
            #1 x=1; y=0;
            #1 x=1; y=1;
        end
endmodule // test_module