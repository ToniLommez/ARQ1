// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 27/08/2022
// ---------------------
// ---------------------
// -- expression f(x,y,z,w) = 1 0 0 1 0 1 0 1 1 0 1 0 0 0 1 1
// ---------------------

module SoP (output s, input x, y, w, z); // mintermos
    assign s = (~x & ~y & ~w & ~z) | // m0 
               (~x & ~y & w  & z ) | // m3 
               (~x & y  & ~w & z ) | // m5 
               (~x & y  & w  & z ) | // m7 
               (x  & ~y & ~w & ~z) | // m8 
               (x  & ~y & w  & ~z) | // m10
               (x  & y  & w  & ~z) | // m14
               (x  & y  & w  & z ) ; // m15
endmodule // SoP

module PoS (output S, input X, Y, W, Z); // maxtermos
    assign S = (X  | Y  | W  | ~Z) & // M1 
               (X  | Y  | ~W | Z ) & // M2 
               (X  | ~Y | W  | Z ) & // M4 
               (X  | ~Y | ~W | Z ) & // M6 
               (~X | Y  | W  | ~Z) & // M9 
               (~X | Y  | ~W | ~Z) & // M11
               (~X | ~Y | W  | Z ) & // M12
               (~X | ~Y | W  | ~Z) ; // M13
endmodule // PoS

// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg x, y, w, z;
    wire s1, s2;

    // instancias
    SoP SOP1 (s1, x, y, w, z);
    PoS POS1 (s2, x, y, w, z);
    
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
            $display("Ex05e - Marcos Antonio Lommez - 771157");
            $display(" f(x,y,w,z) = 1 0 0 1 0 1 0 1 1 0 1 0 0 0 1 1 ");

            // monitoramento
            $display(" x | y | w | z->   SoP  PoS");
            $monitor("%2b |%2b |%2b |%2b =    %2b   %2b", x, y, w, z, s1, s2);
            
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