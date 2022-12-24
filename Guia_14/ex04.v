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

module ex04;
    reg clk, clear, preset;
    reg data;

    dff  DFF1  ( q1, qn1, clk, preset, clear, qn6 );
    dff  DFF2  ( q2, qn2, clk, clear, preset, q1  );
    dff  DFF3  ( q3, qn3, clk, clear, preset, q2  );
    dff  DFF4  ( q4, qn4, clk, clear, preset, q3  );
    dff  DFF5  ( q5, qn5, clk, clear, preset, q4  );
    dff  DFF6  ( q6, qn6, clk, clear, preset, q5  );

    initial
        begin
            $display ( " ----------------------- Exercicio 4 ----------------------- " );
            $display ( " Registrador de deslocamento de anel torcido para a esquerda \n" );
            $display ( " clk   output " );

            // initial values
            clk = 1;
            clear = 1;
            preset = 0;
            data = 0;

            // input signal changing
            #5 clear = 0;
            #140
            $display("");
            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d   %d%d%d%d%d%d", $time, q6, q5, q4, q3, q2, q1);
            end // always at positive edge clocking changing
endmodule // ex04