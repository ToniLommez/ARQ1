// --------------------
// --- Marcos Antonio Lommez Candido Ribeiro
// --- 771157
// --- 29/10/2022
// --------------------
//

module jkff ( output q, output qnot, input j, input k, input clk, input preset, input clear );
    reg q, qnot;

    always @( posedge clk or posedge preset or posedge clear )
        begin
            if ( clear ) 
                begin q <= 0; qnot <= 1;  end
            else if ( preset ) 
                begin q <= 1; qnot <= 0;  end
            else if ( j & ~k ) 
                begin q <= 1; qnot <= 0;  end
            else if ( ~j & k ) 
                begin q <= 0; qnot <= 1;  end
            else if ( j & k ) 
                begin q <= ~q; qnot <= ~qnot;  end
        end
endmodule // jkff

module ex01;
    reg clk, clear;
    reg x; // constante positiva
    reg y; // constante negativa

    jkff JKFF1 ( t1, s6, x, x, clk, y, clear );
    jkff JKFF2 ( t2, s5, x, x, s6,  y, clear );
    jkff JKFF3 ( t3, s4, x, x, s5,  y, clear );
    jkff JKFF4 ( t4, s3, x, x, s4,  y, clear );
    jkff JKFF5 ( t5, s2, x, x, s3,  y, clear );
    jkff JKFF6 ( t6, s1, x, x, s2,  y, clear );


    initial
        begin
            $display ( " ----------- Exercicio 1 -----------" );
            $display ( " clk    output");

            // initial values
            clk = 1;
            x = 1;
            y = 0;
            clear = 1;

            // input signal changing
            #5 clear = 0;
            #650


            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d    %d%d%d%d%d%d", $time, s1, s2, s3, s4, s5, s6, );
            end // always at positive edge clocking changing
endmodule // Exemplo_1101
