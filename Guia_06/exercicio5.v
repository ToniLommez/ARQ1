// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 17/09/2022
// ---------------------

module SoP (output s1, input x, y, z); // Σ m ( 4, 5, 6 )
    assign s1 = (x &~y) | (x &~z);
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
            $display("Ex05 - Marcos Antonio Lommez - 771157");

            // monitoramento
            $display("\n");
            $display(" xyz = ");
            $monitor(" %b%b%b =   %b", x, y, z, s1);
            
            
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