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

module dec1x2 ( output s1, output s2, input in);
    not DEC_1X2_1 ( s1,  in);
    not DEC_1X2_2 ( s2, ~in);
endmodule // decoder

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

module ram2x4 (output p1, output p2, output p3, output p4,
               input i1, input i2, input i3, input i4, 
               input clk, input write, input address, input clear );

    wire p1_1, p1_2, p1_3, p1_4;
    wire p2_1, p2_2, p2_3, p2_4;
    wire dm1, dm2;
    reg y = 1; // constante 1

    dec1x2 DEC_1x2_1 ( dm1, dm2, address);
    ram1x4 RAM_1x4_1 ( p1_1, p1_2, p1_3, p1_4, i1, i2, i3, i4, clk, write, dm1, clear );
    ram1x4 RAM_1x4_2 ( p2_1, p2_2, p2_3, p2_4, i1, i2, i3, i4, clk, write, dm2, clear );
    mux4x2 MUX_4X2_1 ( p1, p2, p3, p4, p1_1, p1_2, p1_3, p1_4, p2_1, p2_2, p2_3, p2_4, address);


endmodule // ram2x4

module dec2x4 ( output s1, output s2, output s3, output s4, 
                input in1, input in2);
    and AND_DMX_1 ( s1, ~in1, ~in2 );
    and AND_DMX_2 ( s2, ~in1,  in2 );
    and AND_DMX_3 ( s3,  in1, ~in2 );
    and AND_DMX_4 ( s4,  in1,  in2 );
endmodule // dmx

module ram4x8;
    reg clk, clear, address1, address2, write;
    reg i1, i2, i3, i4, i5, i6, i7, i8;
    wire p1_1, p1_2, p1_3, p1_4, p1_5, p1_6, p1_7, p1_8;
    wire p2_1, p2_2, p2_3, p2_4, p2_5, p2_6, p2_7, p2_8;
    wire dc1, dc2, dc3, dc4;
    wire mu1, mu2, mu3, mu4, mu5, mu6, mu7, mu8;
    reg y; // constante 1

    dec2x4 DEC2X4_1 ( dc1, dc2, dc3, dc4, address1, address2 );

    or     OR__4X8_1 ( or1, dc1, dc2 );
    and    AND_4X8_1 ( and1, or1, write );
    ram2x4 RAM_2X4_1 ( p1_1, p1_2, p1_3, p1_4, i1, i2, i3, i4, clk, and1, dc2, clear );
    ram2x4 RAM_2X4_2 ( p1_5, p1_6, p1_7, p1_8, i5, i6, i7, i8, clk, and1, dc2, clear );

    or     OR__4X8_2 ( or2, dc3, dc4 );
    and    AND_4X8_2 ( and2, or2, write );
    ram2x4 RAM_2X4_3 ( p2_1, p2_2, p2_3, p2_4, i1, i2, i3, i4, clk, and2, dc4, clear );
    ram2x4 RAM_2X4_4 ( p2_5, p2_6, p2_7, p2_8, i5, i6, i7, i8, clk, and2, dc4, clear );

    mux4x2 MUX_4X2_1 ( mu1, mu2, mu3, mu4, p1_1, p1_2, p1_3, p1_4, p2_1, p2_2, p2_3, p2_4, address1);
    mux4x2 MUX_4X2_2 ( mu5, mu6, mu7, mu8, p1_5, p1_6, p1_7, p1_8, p2_5, p2_6, p2_7, p2_8, address1);

    initial
        begin
            $display ( " --------------- Exercicio 5 ---------------" );
            $display ( " clk  write   address    input       output");

            // initial values
            y = 1; // constante
            clk = 1;
            write = 0;
            address1 = 0;
            address2 = 0;
            clear = 1;
            i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0; i8 = 0;

            // input signal changing
            #5 clear = 0;

            #10 write = 1; address1 = 0; address2 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 1; i8 = 1;

            #10 write = 1; address1 = 0; address2 = 1; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 1; i6 = 1; i7 = 0; i8 = 0;

            #10 write = 1; address1 = 1; address2 = 0; i1 = 0; i2 = 0; i3 = 1; i4 = 1; i5 = 0; i6 = 0; i7 = 0; i8 = 0;

            #10 write = 1; address1 = 1; address2 = 1; i1 = 1; i2 = 1; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0; i8 = 0;

            #10 write = 0; address1 = 0; address2 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0; i8 = 0;
            #10 write = 0; address1 = 0; address2 = 1; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0; i8 = 0;
            #10 write = 0; address1 = 1; address2 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0; i8 = 0;
            #10 write = 0; address1 = 1; address2 = 1; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0; i8 = 0;
            #10 
            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d    %d       %d%d     %d%d%d%d.%d%d%d%d    %d%d%d%d.%d%d%d%d", $time, write, address1, address2, i1, i2, i3, i4, i5, i6, i7, i8, mu1, mu2, mu3, mu4, mu5, mu6, mu7, mu8);
            end // always at positive edge clocking changing
endmodule
