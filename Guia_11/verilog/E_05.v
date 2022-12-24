// --------------------
// --- Mealy-Moore FSM
// --------------------
//

module d_flipflop ( output reg saida, input entrada, input clk, input reset  );
    always @( posedge clk )
        if (reset)
            saida <= 0;
        else
            saida <= entrada;
endmodule 

module counter ( input reset, output reg[1:0] out, input condicao, input clk );
    always @( condicao )
        if (reset)
            out <= 0;
        else 
            out <= out+1;

endmodule

module final ( input in, output reg out, input clk , input reset);
    always @( clk )
        if (reset)
            out <= 0;
        else 
            if (in > 0)
            out <= 1;
endmodule

module demux ( output reg s1, output reg s2, input a, input chave, input clk );
    always @( clk )
        if (chave && a)
            s2 <= 1;
        else 
            s1 <= 1;
endmodule

module Exemplo1101;
    reg clk, reset;
    reg v;
    wire x, y, w, z;
    reg const = 1;

    d_flipflop d_fl1 ( x, v, clk, reset );
    d_flipflop d_fl2 ( y, x, clk, reset );
    d_flipflop d_fl3 ( w, y, clk, reset );
    d_flipflop d_fl4 ( z, w, clk, reset );
    /* and        AND_1 ( resultAnd, x, y, ~w, z );
    d_flipflop d_fl5 ( k1, const, resultAnd, reset ); */
    and        AND_1 ( resultAnd, x, y, ~w, z );
    and        AND_2 ( resetFinal, ~reset, k1 );
    or         OR_1  ( k1, resetFinal, resultAnd );

    demux     DEMUX  ( s1, s2, resultAnd, k1, clk );

    initial
        begin
            $display ( " ----------- Exercicio 5 -----------" );
            $display ( " clk    input    a  b  c  d  final");

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
            #10 v = 1; 
            #10 v = 1; 
            #10 v = 0; 
            #10 v = 0; 
            #10 v = 0; 
            #10 v = 0; 
            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d      %b      %b  %b  %b  %b    %b    %b %b", $time, v, x, y, w, z, k1, s1, s2);
            end // always at positive edge clocking changing
endmodule // Exemplo_1101
