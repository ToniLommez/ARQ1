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

module ex07;
    reg clk, clear;
    reg start;
    reg y; // constante negativa

    jkff  JKFF1  ( s11, s21, s26, s16, clk, y, clear );
    jkff  JKFF2  ( s12, s22, s11, s21, clk, y, clear );
    jkff  JKFF3  ( s13, s23, s12, s22, clk, y, clear );
    jkff  JKFF4  ( s14, s24, s13, s23, clk, y, clear );
    jkff  JKFF5  ( s15, s25, s14, s24, clk, y, clear );
    jkff  JKFF6  ( s16, s26, s15, s25, clk, y, clear );

    initial
        begin
            $display ( " ----------- Exercicio 7 -----------" );
            $display ( " clk   output");

            // initial values
            clk = 1;
            start = 1;
            clear = 1;
            y = 0;

            // input signal changing
            #5 clear = 0;
            #160


            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d   %d%d%d%d%d%d", $time, s11, s12, s13, s14, s15, s16);
            end // always at positive edge clocking changing
endmodule // Exemplo_1101