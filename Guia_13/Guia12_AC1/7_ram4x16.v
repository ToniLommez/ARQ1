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

module ram2x4 ( output p1, output p2, output p3, output p4,
               input i1, input i2, input i3, input i4, 
               input clk, input write, input address, input clear );

    wire p1_1, p1_2, p1_3, p1_4;
    wire p2_1, p2_2, p2_3, p2_4;
    wire dm1, dm2;

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

module ram4x8 ( output s1, output s2, output s3, output s4, output s5, output s6, output s7, output s8,
                input in1, input in2, input in3, input in4, input in5, input in6, input in7, input in8,
                input clk, input write, input address1, input address2, input clear );
                
    dec2x4 DEC2X4_1 ( dc1, dc2, dc3, dc4, address1, address2 );

    or     OR__4X8_1 ( or1, dc1, dc2 );
    and    AND_4X8_1 ( and1, or1, write );
    ram2x4 RAM_2X4_1 ( p1_1, p1_2, p1_3, p1_4, in1, in2, in3, in4, clk, and1, dc2, clear );
    ram2x4 RAM_2X4_2 ( p1_5, p1_6, p1_7, p1_8, in5, in6, in7, in8, clk, and1, dc2, clear );

    or     OR__4X8_2 ( or2, dc3, dc4 );
    and    AND_4X8_2 ( and2, or2, write );
    ram2x4 RAM_2X4_3 ( p2_1, p2_2, p2_3, p2_4, in1, in2, in3, in4, clk, and2, dc4, clear );
    ram2x4 RAM_2X4_4 ( p2_5, p2_6, p2_7, p2_8, in5, in6, in7, in8, clk, and2, dc4, clear );

    mux4x2 MUX_4X2_1 ( s1, s2, s3, s4, p1_1, p1_2, p1_3, p1_4, p2_1, p2_2, p2_3, p2_4, address1);
    mux4x2 MUX_4X2_2 ( s5, s6, s7, s8, p1_5, p1_6, p1_7, p1_8, p2_5, p2_6, p2_7, p2_8, address1);
endmodule // ram4x8

module priEnc4x2 ( output s1, output s2, output or1, 
                   input a1, input a2, input a3, input a4);
    or     ENC4X2_1 ( s1, a3, a4 );
    or     ENC4X2_2 ( s2, a2, a4 );
    or     ENC4X2_3 ( or1, a1, a2, a3, a4 );
endmodule // priEnc4x2

module dec3x8 ( output s1, output s2, output s3, output s4, output s5, output s6, output s7, output s8, 
                input a1, input a2, input a3 );
    and    DEC_3X8_1 ( s1, ~a1, ~a2, ~a3 );
    and    DEC_3X8_2 ( s2, ~a1, ~a2,  a3 );
    and    DEC_3X8_3 ( s3, ~a1,  a2, ~a3 );
    and    DEC_3X8_4 ( s4, ~a1,  a2,  a3 );
    and    DEC_3X8_5 ( s5,  a1, ~a2, ~a3 );
    and    DEC_3X8_6 ( s6,  a1, ~a2,  a3 );
    and    DEC_3X8_7 ( s7,  a1,  a2, ~a3 );
    and    DEC_3X8_8 ( s8,  a1,  a2,  a3 );
endmodule // dec3x8

module mux8x1 ( output s1, output s2, output s3, output s4, output s5, output s6, output s7, output s8, 
                input a11, input a12, input a13, input a14, input a15, input a16, input a17, input a18, 
                input a21, input a22, input a23, input a24, input a25, input a26, input a27, input a28, chave );
    and   AND_MUX8x1_11 ( t1_1, a11, ~chave );
    and   AND_MUX8x1_12 ( t1_2, a12, ~chave );
    and   AND_MUX8x1_13 ( t1_3, a13, ~chave );
    and   AND_MUX8x1_14 ( t1_4, a14, ~chave );
    and   AND_MUX8x1_15 ( t1_5, a15, ~chave );
    and   AND_MUX8x1_16 ( t1_6, a16, ~chave );
    and   AND_MUX8x1_17 ( t1_7, a17, ~chave );
    and   AND_MUX8x1_18 ( t1_8, a18, ~chave );

    and   AND_MUX8x1_21 ( t2_1, a21,  chave );
    and   AND_MUX8x1_22 ( t2_2, a22,  chave );
    and   AND_MUX8x1_23 ( t2_3, a23,  chave );
    and   AND_MUX8x1_24 ( t2_4, a24,  chave );
    and   AND_MUX8x1_25 ( t2_5, a25,  chave );
    and   AND_MUX8x1_26 ( t2_6, a26,  chave );
    and   AND_MUX8x1_27 ( t2_7, a27,  chave );
    and   AND_MUX8x1_28 ( t2_8, a28,  chave );

    or     OR_MUX8x1_31  ( s1, t1_1, t2_1 );
    or     OR_MUX8x1_32  ( s2, t1_2, t2_2 );
    or     OR_MUX8x1_33  ( s3, t1_3, t2_3 );
    or     OR_MUX8x1_34  ( s4, t1_4, t2_4 );
    or     OR_MUX8x1_35  ( s5, t1_5, t2_5 );
    or     OR_MUX8x1_36  ( s6, t1_6, t2_6 );
    or     OR_MUX8x1_37  ( s7, t1_7, t2_7 );
    or     OR_MUX8x1_38  ( s8, t1_8, t2_8 );

endmodule // mux8x1

module ram8x8 ( output s1, output s2, output s3, output s4, output s5, output s6, output s7, output s8,
                input in1, input in2, input in3, input in4, input in5, input in6, input in7, input in8,
                input clk, input write, input address1, input address2, input clear );

    dec3x8    DEC_3X8_A ( dc1, dc2, dc3, dc4, dc5, dc6, dc7, dc8, address1, address2, address3 );

    priEnc4x2 PRI_ENC_A ( pr1, pr2, tp1, dc1, dc2, dc3, dc4 );
    and       AND_A     ( a1, tp1, write );
    ram4x8    RAM_4X8_A ( s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, in1, in2, in3, in4, in5, in6, in7, in8, clk, a1, pr1, pr2, clear );

    priEnc4x2 PRI_ENC_B ( pr3, pr4, tp2, dc5, dc6, dc7, dc8 );
    and       AND_B     ( a2, tp2, write );
    ram4x8    RAM_4X8_B ( s2_1, s2_2, s2_3, s2_4, s2_5, s2_6, s2_7, s2_8, in1, in2, in3, in4, in5, in6, in7, in8, clk, a2, pr3, pr4, clear );
    
    mux8x1    MUX_8X1_A ( s1, s2, s3, s4, s5, s6, s7, s8, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s2_1, s2_2, s2_3, s2_4, s2_5, s2_6, s2_7, s2_8, address1 );

endmodule // ram8x8

module ram4x16;
    reg clk, clear, write, address1, address2;
    reg i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28; // input
    
    ram4x8 RAM_4X8_4X16_1 ( s11, s12, s13, s14, s15, s16, s17, s18,
                            i11, i12, i13, i14, i15, i16, i17, i18,
                            clk, write, address1, address2, clear );
    ram4x8 RAM_4X8_4X16_2 ( s21, s22, s23, s24, s25, s26, s27, s28,
                            i21, i22, i23, i24, i25, i26, i27, i28,
                            clk, write, address1, address2, clear );


    initial
        begin
            $display ( " ------------------------ Exercicio 7 ------------------------" );
            $display ( " clk  write   address         input               output");

            // initial values
            clk = 1;
            write = 0;
            address1 = 0;
            address2 = 0;
            clear = 1;
            i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
            i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;

            // input signal changing
            #5 clear = 0;

            #10 write = 1; address1 = 0; address2 = 0;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 1; i26 = 1; i27 = 1; i28 = 1;
            #10 write = 1; address1 = 0; address2 = 1;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 1; i22 = 1; i23 = 1; i24 = 1; i25 = 0; i26 = 0; i27 = 0; i28 = 0;
            #10 write = 1; address1 = 1; address2 = 0;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 1; i16 = 1; i17 = 1; i18 = 1;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;
            #10 write = 1; address1 = 1; address2 = 1;
                i11 = 1; i12 = 1; i13 = 1; i14 = 1; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;

            #10 write = 0; address1 = 0; address2 = 0;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;
            #10 write = 0; address1 = 0; address2 = 1;
            #10 write = 0; address1 = 1; address2 = 0;
            #10 write = 0; address1 = 1; address2 = 1;
            #10 
            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d    %d       %d%d      %d%d%d%d%d%d%d%d.%d%d%d%d%d%d%d%d    %d%d%d%d%d%d%d%d.%d%d%d%d%d%d%d%d", 
                            $time, write, address1, address2,
                            i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                            s11, s12, s13, s14, s15, s16, s17, s18, s21, s22, s23, s24, s25, s26, s27, s28 );
            end // always at positive edge clocking changing
endmodule
