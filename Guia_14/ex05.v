// --------------------
// --- Marcos Antonio Lommez Candido Ribeiro
// --- 771157
// --- 06/11/2022
// --------------------
//

module dff ( output q, output qnot, input clk, input clear, input preset, input d );
    reg q, qnot;
    always @( posedge clk )
        begin
            if (clear)
                begin q <= 0; qnot <= 1; end
            else if(preset)
                begin q <= 1; qnot <= 0; end
            else 
                begin q <= d; qnot <= ~d; end
        end
endmodule // dff

module ex05;
    reg clk, clear, preset;
    reg i1, i2, i3, i4, i5, i6;
    reg id;
    reg x; // constante 0

    and  AND1  ( a1, id, i1 );
    and  AND2  ( a2, id, i2 );
    and  AND3  ( a3, id, i3 );
    and  AND4  ( a4, id, i4 );
    and  AND5  ( a5, id, i5 );
    and  AND6  ( a6, id, i6 );

    dff  DFF1  ( q1, qn1, clk, clear, a1, x  );
    dff  DFF2  ( q2, qn2, clk, clear, a2, q1  );
    dff  DFF3  ( q3, qn3, clk, clear, a3, q2  );
    dff  DFF4  ( q4, qn4, clk, clear, a4, q3  );
    dff  DFF5  ( q5, qn5, clk, clear, a5, q4  );
    dff  DFF6  ( q6, qn6, clk, clear, a6, q5  );

    initial
        begin
            $display ( " ----------- Exercicio 5 ----------- " );
            $display ( " Conversor Paralelo-Serie com 6 bits \n" );
            $display ( " clk    id    input    output " );

            // initial values
            x = 0; // constante
            clk = 1;
            clear = 1;
            preset = 0;
            id = 0;
            i1 = 0;
            i2 = 0;
            i3 = 0;
            i4 = 0;
            i5 = 0;
            i6 = 0;

            // input signal changing
            #5 clear = 0;
            #10 i1 = 1; i2 = 1; i3 = 1; i4 = 0; i5 = 1; i6 = 0; id = 1;
            #10 id = 0;
            #10 id = 0;
            #10 i1 = 1; i2 = 0; i3 = 1; i4 = 1; i5 = 0; i6 = 1;
            #30
            #10 id = 1;
            #10 i1 = 0; i2 = 1; i3 = 1; i4 = 1; i5 = 0; i6 = 0; id = 0;
            #70
            $display("");
            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d     %d    %d%d%d%d%d%d   %d%d%d%d%d%d", $time, id, i1, i2, i3, i4, i5, i6, q1, q2, q3, q4, q5, q6);
            end // always at positive edge clocking changing
endmodule // ex05