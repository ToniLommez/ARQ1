// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 17/09/2022
// ---------------------

module FXYZ (output S1, input X, input Y, input Z);
assign S1 = ( X | ~Y | ~Z ) & (~X | Y | Z) & ( ~X | ~Y | ~Z );
endmodule // FXYZ


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg X, Y, Z;
    wire S1;

    // instancias
    FXYZ FXYZ1 (S1, X, Y, Z);
    
    // valores iniciais
    initial 
        begin: start
            X=1'bx; // indefinidos
            Y=1'bx; // indefinidos
            Z=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
            // identificacao
            $display("Ex07 - Marcos Antonio Lommez - 771157");

            // monitoramento
            $display("\n");
            $display(" XYZ = ");
            $monitor(" %b%b%b =   %b", X, Y, Z, S1);
            
            
            // sinalizacao
            #1 X=0; Y=0; Z=0;
            #1 X=0; Y=0; Z=1;
            #1 X=0; Y=1; Z=0;
            #1 X=0; Y=1; Z=1;
            #1 X=1; Y=0; Z=0;
            #1 X=1; Y=0; Z=1;
            #1 X=1; Y=1; Z=0;
            #1 X=1; Y=1; Z=1;
        end
endmodule // test_module