// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 17/09/2022
// ---------------------

module fwxyz (output s1, input w, input x, input y, input z);
    assign s1 = (w & x & y & z) | (w & ~x & ~y & ~z) | (~w & x & ~y & ~z) | (~w & ~x & y & z);
endmodule // fwxyz


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg w, x, y, z;
    wire s1;

    // instancias
    fwxyz FWXYZ1 (s1, w, x, y, z);
    
    // valores iniciais
    initial 
        begin: start
            w=1'bx; // indefinidos
            x=1'bx; // indefinidos
            y=1'bx; // indefinidos
            z=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
            // identificacao
            $display("Ex08 - Marcos Antonio Lommez - 771157");

            // monitoramento
            $display("\n");
            $display(" wxyz =");
            $monitor(" %b%b%b%b =   %b", w, x, y, z, s1);
            
            
            // sinalizacao
            #1 w=0; x=0; y=0; z=0;
            #1 w=0; x=0; y=0; z=1;
            #1 w=0; x=0; y=1; z=0;
            #1 w=0; x=0; y=1; z=1;
            #1 w=0; x=1; y=0; z=0;
            #1 w=0; x=1; y=0; z=1;
            #1 w=0; x=1; y=1; z=0;
            #1 w=0; x=1; y=1; z=1;
            #1 w=1; x=0; y=0; z=0;
            #1 w=1; x=0; y=0; z=1;
            #1 w=1; x=0; y=1; z=0;
            #1 w=1; x=0; y=1; z=1;
            #1 w=1; x=1; y=0; z=0;
            #1 w=1; x=1; y=0; z=1;
            #1 w=1; x=1; y=1; z=0;
            #1 w=1; x=1; y=1; z=1;
        end
endmodule // test_module