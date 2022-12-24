// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 27/08/2022
// ---------------------
// ---------------------
// -- expression x' . ( y'+z' )'
// ---------------------

module fxyz (output s, input x, y, z);
    assign s = ~x & ~(~y | ~z);
endmodule

module fyz (output s, input y, z);
    assign s = (~y | ~z);
endmodule

module fnyz (output s, input y, z);
    assign s = ~(~y | ~z);
endmodule

// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg x, y, z;
    wire s1, s2, s3;
    // instancias
    fyz  FYZ1  (s1, y, z);
    fnyz FNYZ1 (s2, y, z);
    fxyz FXYZ1 (s3, x, y, z);
    
    // valores iniciais
    initial 
        begin: start
            x=1'bx; 
            y=1'bx;
            z=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
            // identificacao
            $display("Ex01a - Marcos Antonio Lommez - 771157");
            $display(" x' . ( y'+z' )'");

            // monitoramento
            $display(" x | y | z =  (y'+z')   (y'+z')'   x'.(y'+z')'");
            $monitor("%2b |%2b |%2b =    %2b        %2b          %2b", x, y, z, s1, s2, s3);
            
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