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

module ex06;
    reg clk, clear, preset;
    reg data;

    dff  DFF1  ( qn1, q1, clk, preset, clear, qn6 );
    dff  DFF2  ( qn2, q2, clk, clear, preset, qn1 );
    dff  DFF3  ( qn3, q3, clk, clear, preset, qn2 );
    dff  DFF4  ( qn4, q4, clk, clear, preset, qn3 );
    dff  DFF5  ( qn5, q5, clk, clear, preset, qn4 );
    dff  DFF6  ( qn6, q6, clk, clear, preset, qn5 );

    initial
        begin
            $display ( " ----------------------- Exercicio 6 ----------------------- " );
            $display ( " Registrador de deslocamento circular (ring) para a esquerda \n" );
            $display ( " clk   output " );

            // initial values
            clk = 1;
            clear = 1;
            preset = 0;
            data = 0;

            // input signal changing
            #5 clear = 0;
            #70
            $display("");
            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d   %d%d%d%d%d%d", $time, q6, q5, q4, q3, q2, q1);
            end // always at positive edge clocking changing
endmodule // ex06