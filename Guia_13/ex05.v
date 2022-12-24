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

module tff ( input clk, input clear, input t, output reg q);  
  
  always @ (posedge clk) begin  
    if (clear)  
      q <= 0;  
    else  
        if (t)  
            q <= ~q;  
        else  
            q <= q;  
  end  
endmodule 

module ex05;
    reg clk, clear;
    reg start;
    reg y; // constante negativa

    or   OR_1  ( or_clear, clear, cl1 );
    tff  TFF1  ( clk, or_clear, start, q3 );
    and  AND1  ( a1, q3, start );
    tff  TFF2  ( clk, or_clear, a1,    q2 );
    and  AND2  ( a2, q2, a1, start );
    tff  TFF3  ( clk, or_clear, a2,    q1 );
    and  AND3  ( cl1, q1, q2, ~q3 );


    initial
        begin
            $display ( " ----------- Exercicio 5 -----------" );
            $display ( " clk   output");

            // initial values
            clk = 1;
            start = 1;
            clear = 1;
            y = 0;

            // input signal changing
            #5 clear = 0;
            #90


            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d    %d%d%d", $time, q3, q2, q1);
            end // always at positive edge clocking changing
endmodule // Exemplo_1101
