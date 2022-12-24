// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 27/08/2022
// ---------------------
// ---------------------
// -- expression m (0, 2, 4, 6, 8, 10, 12)
// ---------------------

module PoS (output S, input X, Y, Z, W); // maxtermos
    assign S = (X  | Y  | Z  | W ) & // M0 
               (X  | Y  | ~Z | W ) & // M2 
               (X  | ~Y | Z  | W ) & // M4 
               (X  | ~Y | ~Z | W ) & // M6 
               (~X | Y  | Z  | W ) & // M8 
               (~X | Y  | ~Z | W ) & // M10
               (~X | ~Y | Z  | W ) ; // M12
endmodule // PoS


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg X, Y, Z, W;
    wire S1;

    // instancias
    PoS PoS1 (S1, X, Y, Z, W);
    
    // valores iniciais
    initial 
        begin: start
            X=1'bx; // indefinidos
            Y=1'bx; // indefinidos
            Z=1'bx; // indefinidos
            W=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
            // identificacao
            $display("Ex04d - Marcos Antonio Lommez - 771157");
            $display(" M (0, 2, 4, 6, 8, 10, 12) ");

            // monitoramento
            $display(" X | Y | Z | W =  ");
            $monitor("%2b |%2b |%2b |%2b =    %2b", X, Y, Z, W, S1);
            
            // sinalizacao
            #1 X=0; Y=0; Z=0; W=0;
            #1 X=0; Y=0; Z=0; W=1;
            #1 X=0; Y=0; Z=1; W=0;
            #1 X=0; Y=0; Z=1; W=1;
            #1 X=0; Y=1; Z=0; W=0;
            #1 X=0; Y=1; Z=0; W=1;
            #1 X=0; Y=1; Z=1; W=0;
            #1 X=0; Y=1; Z=1; W=1;
            #1 X=1; Y=0; Z=0; W=0;
            #1 X=1; Y=0; Z=0; W=1;
            #1 X=1; Y=0; Z=1; W=0;
            #1 X=1; Y=0; Z=1; W=1;
            #1 X=1; Y=1; Z=0; W=0;
            #1 X=1; Y=1; Z=0; W=1;
            #1 X=1; Y=1; Z=1; W=0;
            #1 X=1; Y=1; Z=1; W=1;
        end
endmodule // test_module