// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 27/08/2022
// ---------------------
// ---------------------
// -- expression m ( 0, 2, 5, 7, 9, 10, 12 )
// ---------------------

module SoP (output s, input x, y, z, w); // mintermos
    assign s = (~x & ~y & ~z & ~w) | // m0 
               (~x & ~y & z  & ~w) | // m2 
               (~x & y  & ~z & w ) | // m5 
               (~x & y  & z  & w ) | // m7 
               (x  & ~y & ~z & w ) | // m9 
               (x  & ~y & z  & ~w) | // m10
               (x  & y  & ~z & ~w) ; // m12
endmodule // SoP


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg x, y, z, w;
    wire s1;

    // instancias
    SoP SOP1 (s1, x, y, z, w);
    
    // valores iniciais
    initial 
        begin: start
            x=1'bx; // indefinidos
            y=1'bx; // indefinidos
            z=1'bx; // indefinidos
            w=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
            // identificacao
            $display("Ex03d - Marcos Antonio Lommez - 771157");
            $display(" ( 0, 2, 5, 7, 9, 10, 12 ) ");

            // monitoramento
            $display(" x | y | z | w =  ");
            $monitor("%2b |%2b |%2b |%2b =    %2b", x, y, z, w, s1);
            
            // sinalizacao
            #1 x=0; y=0; z=0; w=0;
            #1 x=0; y=0; z=0; w=1;
            #1 x=0; y=0; z=1; w=0;
            #1 x=0; y=0; z=1; w=1;
            #1 x=0; y=1; z=0; w=0;
            #1 x=0; y=1; z=0; w=1;
            #1 x=0; y=1; z=1; w=0;
            #1 x=0; y=1; z=1; w=1;
            #1 x=1; y=0; z=0; w=0;
            #1 x=1; y=0; z=0; w=1;
            #1 x=1; y=0; z=1; w=0;
            #1 x=1; y=0; z=1; w=1;
            #1 x=1; y=1; z=0; w=0;
            #1 x=1; y=1; z=0; w=1;
            #1 x=1; y=1; z=1; w=0;
            #1 x=1; y=1; z=1; w=1;
        end
endmodule // test_module