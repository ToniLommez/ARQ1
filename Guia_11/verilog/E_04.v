// --------------------
// --- Mealy-Moore FSM
// --------------------
//

module d_flipflop ( output reg saida, input entrada, input clk, input reset  );
    always @( posedge clk)
        if (reset)
            saida <= 0;
        else
            saida <= entrada;
endmodule 

module Exemplo1101;
    reg clk, reset;
    reg v;
    wire x, y, w, z;

    d_flipflop d_fl1 ( x, v, clk, reset );
    d_flipflop d_fl2 ( y, x, clk, reset );
    d_flipflop d_fl3 ( w, y, clk, reset );
    d_flipflop d_fl4 ( z, w, clk, reset );
    and        AND_1 ( resultAnd, x, y, ~w, z );
    and        AND_2 ( resetFinal, ~reset, resultFinal );
    or         OR_1  ( resultFinal, resetFinal, resultAnd );
    

    initial
        begin
            $display ( " ----------- Exercicio 4 -----------" );
            $display ( " clk    input    a  b  c  d   result");

            // initial values
            clk = 1;
            reset = 1;
            v = 0;
            
            // input signal changing
            #5 reset = 0;
            #10 v = 1; 
            #10 v = 0; 
            #10 v = 1; 
            #10 v = 1; 
            #10 v = 0; 
            #10 v = 0; 
            #10 v = 1; 
            #10 v = 0; 
            #10 v = 1; 
            #10 v = 1; 
            #10 v = 0; 
            #10 v = 0; 
            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d      %b      %b  %b  %b  %b     %b", $time, v, x, y, w, z, resultFinal);
            end // always at positive edge clocking changing
endmodule // Exemplo_1101
