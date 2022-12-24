// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 27/08/2022
// ---------------------
// ---------------------
// -- expression m (0, 2, 3, 6, 7)
// ---------------------

module PoS (output S, input X, Y, Z); // maxtermos
    assign S = (X  | Y  | Z ) & // M0
               (X  | ~Y | Z ) & // M2
               (X  | ~Y | ~Z) & // M3
               (~X | ~Y | Z ) & // M6
               (~X | ~Y | ~Z) ; // M7
endmodule // PoS


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg X, Y, Z;
    wire S1;

    // instancias
    PoS PoS1 (S1, X, Y, Z);
    
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
            $display("Ex04b - Marcos Antonio Lommez - 771157");
            $display(" M (0, 2, 3, 6, 7) ");

            // monitoramento
            $display(" X | Y | Z = ");
            $monitor("%2b |%2b |%2b =    %2b", X, Y, Z, S1);
            
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