// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 28/08/2022
// ---------------------
// ---------------------
// -- expression ( ~x & ~y & z ) | (~x & y & z);
// ---------------------

module fxyz (output s1, input x, input y, input z);
    assign s1 = ( ~x & ~y & z ) | (~x & y & z);
endmodule // fxyz

module PoS (output S, input X, Y, Z); // maxtermos
    assign S = (X  | Y  | Z ) & // M0
               (X  | ~Y | Z ) & // M2
               (~X | Y  | Z ) & // M4
               (~X | Y  | ~Z) & // M5
               (~X | ~Y | Z ) & // M6
               (~X | ~Y | ~Z) ; // M7
endmodule // PoS

// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg x, y, z;
    wire s1, s2;

    // instancias
    fxyz FXYZ1 (s1, x, y, z);
    PoS POS1   (s2, x, y, z);
    
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
            $display("Ex07 - Marcos Antonio Lommez - 771157");
            $display(" s1 = ( ~x & ~y & z ) | (~x & y & z) ");

            // monitoramento
            $display(" x | y | z ->   FXYZ  PoS");
            $monitor("%2b |%2b |%2b =    %2b    %2b", x, y, z, s1, s2);
            
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