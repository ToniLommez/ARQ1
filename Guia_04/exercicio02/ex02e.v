// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 27/08/2022
// ---------------------
// ---------------------
// -- expression (y'+x')'.(y+x') = x.y
// ---------------------

module fxyz (output s1, output s2, input x, y);
    assign s1 = ~(~y | ~x) & (y | ~x);
    assign s2 = x & y;
endmodule // fxyz


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg x, y;
    wire s1, s2;

    // instancias
    fxyz FXYZ1 (s1, s2, x, y);
    
    // valores iniciais
    initial 
        begin: start
            x=1'bx; // indefinidos
            y=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
            // identificacao
            $display("Ex02e - Marcos Antonio Lommez - 771157");
            $display(" ");

            // monitoramento
            $display(" x | y =  (y'+x')'.(y+x') = x.y");
            $monitor("%2b |%2b =         %2b       = %2b", x, y, s1, s2);
            
            // sinalizacao
            #1 x=0; y=0;
            #1 x=0; y=1;
            #1 x=1; y=0;
            #1 x=1; y=1;
        end
endmodule // test_module