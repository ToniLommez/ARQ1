// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 27/08/2022
// ---------------------
// ---------------------
// -- expression m ( 2, 3, 6, 7 )
// ---------------------

module SoP (output s, input x, y, z); // mintermos
    assign s = (~x & y & ~z) | // m2
               (~x & y & z ) | // m3
               (x  & y & ~z) | // m6
               (x  & y & z ) ; // m7
endmodule // SoP


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg x, y, z;
    wire s1;

    // instancias
    SoP SOP1 (s1, x, y, z);
    
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
            $display("Ex03a - Marcos Antonio Lommez - 771157");
            $display(" m ( 2, 3, 6, 7 ) ");

            // monitoramento
            $display(" x | y | z =  ");
            $monitor("%2b |%2b |%2b =    %2b", x, y, z, s1);
            
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