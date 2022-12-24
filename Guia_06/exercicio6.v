// ---------------------
// TRUTH TABLE
// Nome: marcos antonio lommez Candido Ribeiro
// Matricula: 771157
// 17/09/2022
// ---------------------

module PoS (output s1, input X, Y, W, Z); // π M (0, 1, 2, 3, 4, 5, 6, 7, 15)
    assign s1 = (X |Y |W ) & (X |Y |~W) & (X |~Y|W ) & (X |~Y|~W) & (~Y|~W|~Z);
endmodule // PoS


// ---------------------
// -- test_module
// ---------------------
module test_module;
    reg X, Y, W, Z;
    wire s1, sb, sc, sd, se;

    // instancias
    PoS POS1 (s1, X, Y, W, Z);
    
    // valores iniciais
    initial 
        begin: start
            X=1'bx; // indefinidos
            Y=1'bx; // indefinidos
            W=1'bx; // indefinidos
            Z=1'bx; // indefinidos
        end

    // parte principal
    initial 
        begin: main
            // identificacao
            $display("Ex06 - Marcos Antonio Lommez - 771157");

            // monitoramento
            $display("\n");
            $display(" XYWZ =");
            $monitor(" %b%b%b%b =   %b", X, Y, W, Z, s1);
            
            
            // sinalizacao
            #1 X=0; Y=0; W=0; Z=0;
            #1 X=0; Y=0; W=0; Z=1;
            #1 X=0; Y=0; W=1; Z=0;
            #1 X=0; Y=0; W=1; Z=1;
            #1 X=0; Y=1; W=0; Z=0;
            #1 X=0; Y=1; W=0; Z=1;
            #1 X=0; Y=1; W=1; Z=0;
            #1 X=0; Y=1; W=1; Z=1;
            #1 X=1; Y=0; W=0; Z=0;
            #1 X=1; Y=0; W=0; Z=1;
            #1 X=1; Y=0; W=1; Z=0;
            #1 X=1; Y=0; W=1; Z=1;
            #1 X=1; Y=1; W=0; Z=0;
            #1 X=1; Y=1; W=0; Z=1;
            #1 X=1; Y=1; W=1; Z=0;
            #1 X=1; Y=1; W=1; Z=1;
        end
endmodule // test_module