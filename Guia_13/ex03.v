// --------------------
// --- Marcos Antonio Lommez Candido Ribeiro
// --- 771157
// --- 30/10/2022
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

module ex03;
    reg clk, clear;
    reg x; // constante positiva
    reg y; // constante negativa

    or   OR_1  ( or_clear, clear, cl1 );
    jkff JKFF1 ( s5, qn5, x, x, clk, y, or_clear );
    jkff JKFF2 ( s4, qn4, x, x, qn5, y, or_clear );
    jkff JKFF3 ( s3, qn3, x, x, qn4, y, or_clear );
    jkff JKFF4 ( s2, qn2, x, x, qn3, y, or_clear );
    jkff JKFF5 ( s1, qn1, x, x, qn2, y, or_clear );
    and  AND_1 ( cl1, ~s1, s2, ~s3, s4, ~s5);


    initial
        begin
            $display ( " ----------- Exercicio 3 -----------" );
            $display ( " clk    output");

            // initial values
            clk = 1;
            x = 1;
            y = 0;
            clear = 1;

            // input signal changing
            #5 clear = 0;
            #120


            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d    %d%d%d%d%d", $time, s1, s2, s3, s4, s5);
            end // always at positive edge clocking changing
endmodule // Exemplo_1101
