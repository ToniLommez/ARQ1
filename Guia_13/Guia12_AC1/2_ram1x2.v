// --------------------
// --- Marcos Antonio Lommez Candido Ribeiro
// --- 771157
// --- 28/10/2022
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

module ram1x2;
    reg clk, clear, address, write;
    reg i1, i2;
    wire s1, s2;
    wire p1, p2;
    wire t; // trash
    wire clk_write;

    reg x = 0;

    and  AND_1 ( clk_write, clk, write, address);
    jkff JKFF1 ( s1, t, i1, ~i1, clk_write, x, clear );
    jkff JKFF2 ( s2, t, i2, ~i2, clk_write, x, clear );
    and  AND_2 ( p1, s1, address );
    and  AND_3 ( p2, s2, address );


    initial
        begin
            $display ( " ----------- Exercicio 2 -----------" );
            $display ( " clk  write  address  input  output");

            // initial values
            clk = 1;
            write = 0;
            address = 0;
            clear = 1;
            i1 = 0; i2 = 0;

            // input signal changing
            #5 clear = 0;
            #10 i1 = 0; i2 = 0;
            #10 i1 = 1; i2 = 1;
            #10 i1 = 0; i2 = 0;
            #10 i1 = 1; i2 = 1;
            #10 write = 1; address = 1;
            #10 write = 0; address = 1;
            #10 i1 = 0; i2 = 0;
            #10 address = 0;
            #10 write = 1; address = 0;
            #10 write = 0; address = 1;
            #10 write = 0; address = 1;
            #10 address = 0;

            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d    %d       %d      %d%d      %d%d", $time, write, address, i1, i2, p1, p2);
            end // always at positive edge clocking changing
endmodule // Exemplo_1101
