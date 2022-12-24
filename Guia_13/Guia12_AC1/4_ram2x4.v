// --------------------
// --- Marcos Antonio Lommez Candido Ribeiro
// --- 771157
// --- 29/10/2022
// --------------------
//

module jkff ( output q, output qnot, 
              input j, input k, 
              input clk, input preset, input clear );
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

module ram1x2 ( output p1, output p2, 
                input i1, input i2, 
                input clk, input write, 
                input address, input clear );
    wire s1, s2;
    wire t; // trash
    reg x = 0;

    and  AND_1 ( clk_write, clk, write, address );
    jkff JKFF1 ( s1, t, i1, ~i1, clk_write, x, clear );
    jkff JKFF2 ( s2, t, i2, ~i2, clk_write, x, clear );
    and  AND_2 ( p1, s1, address );
    and  AND_3 ( p2, s2, address );

endmodule // ram1x2

module ram1x4 ( output p1, output p2, output p3, output p4, 
                input i1, input i2, input i3, input i4, 
                input clk, input write, input address, input clear );
    wire s1, s2, s3, s4;
    reg x = 0; // constante 0

    ram1x2 RAM_1x2_1 (p1, p2, i1, i2, clk, write, address, clear);
    ram1x2 RAM_1x2_2 (p3, p4, i3, i4, clk, write, address, clear);

endmodule // ram1x4

module dmx1x2 ( output s1, output s2, input in, input chave );
    and AND_DMX_1 ( s1, in, ~chave );
    and AND_DMX_2 ( s2, in, chave  );
endmodule // dmx

module mux4x2 ( output s1, output s2, output s3, output s4, 
                input in1_1, input in1_2, input in1_3, input in1_4, 
                input in2_1, input in2_2, input in2_3, input in2_4, 
                input chave );
    and AND_MUX_1 ( t1_1, in1_1, ~chave );
    and AND_MUX_2 ( t1_2, in1_2, ~chave );
    and AND_MUX_3 ( t1_3, in1_3, ~chave );
    and AND_MUX_4 ( t1_4, in1_4, ~chave );
    and AND_MUX_5 ( t2_1, in2_1,  chave );
    and AND_MUX_6 ( t2_2, in2_2,  chave );
    and AND_MUX_7 ( t2_3, in2_3,  chave );
    and AND_MUX_8 ( t2_4, in2_4,  chave );
    or  OR_MUX_1  ( s1, t1_1, t2_1 );
    or  OR_MUX_2  ( s2, t1_2, t2_2 );
    or  OR_MUX_3  ( s3, t1_3, t2_3 );
    or  OR_MUX_4  ( s4, t1_4, t2_4 );
endmodule // mux

module ram2x4;
    reg clk, clear, address, write;
    reg i1, i2, i3, i4;
    wire p1_1, p1_2, p1_3, p1_4;
    wire p2_1, p2_2, p2_3, p2_4;
    wire clk_write;
    wire dm1, dm2;
    reg y; // constante 1

    dmx1x2 DMX_1x2_1 ( dm1, dm2, y, address );
    ram1x4 RAM_1x4_1 ( p1_1, p1_2, p1_3, p1_4, i1, i2, i3, i4, clk, write, dm1, clear );
    ram1x4 RAM_1x4_2 ( p2_1, p2_2, p2_3, p2_4, i1, i2, i3, i4, clk, write, dm2, clear );
    mux4x2 MUX_4X2_1 ( p1, p2, p3, p4, p1_1, p1_2, p1_3, p1_4, p2_1, p2_2, p2_3, p2_4, address);

    initial
        begin
            $display ( " ----------- Exercicio 4 -----------" );
            $display ( " clk  write  address  input  output");

            // initial values
            y = 1; // constante
            clk = 1;
            write = 0;
            address = 0;
            clear = 1;
            i1 = 0; i2 = 0; i3 = 0; i4 = 0;

            // input signal changing
            #5 clear = 0;
            #10 i1 = 0; i2 = 0; i3 = 1; i4 = 1;
            #10 write = 1; address = 0;
            #10 write = 0; address = 0;
            #10 i1 = 1; i2 = 1; i3 = 0; i4 = 0;
            #10 write = 1; address = 1;
            #10 write = 0; address = 1;
            #10 i1 = 1; i2 = 1; i3 = 1; i4 = 1;
            #10 write = 0; address = 0;
            #10 write = 0; address = 1;
            #10 write = 1; address = 0;
            #10 i1 = 1; i2 = 0; i3 = 0; i4 = 0;
            #10 write = 0; address = 0;
            #10 write = 0; address = 1;
            #10 write = 0; address = 0;

            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d    %d       %d     %d%d%d%d    %d%d%d%d", $time, write, address, i1, i2, i3, i4, p1, p2, p3, p4);
            end // always at positive edge clocking changing
endmodule
