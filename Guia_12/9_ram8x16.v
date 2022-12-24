// --------------------
// --- Marcos Antonio Lommez Candido Ribeiro
// --- 771157
// --- 29/10/2022
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

module ram1x16 ( output s11, output s12, output s13, output s14, output s15, output s16, output s17, output s18,
                 output s21, output s22, output s23, output s24, output s25, output s26, output s27, output s28,
                 input in11, input in12, input in13, input in14, input in15, input in16, input in17, input in18,
                 input in21, input in22, input in23, input in24, input in25, input in26, input in27, input in28,
                 input clk, input write, input address, input clear );

    reg x = 0;

    and    AND_0   ( clk_write, clk, write, address );
    jkff   JKFF_11 ( t11, trash, in11, ~in11, clk_write, x, clear );
    jkff   JKFF_12 ( t12, trash, in12, ~in12, clk_write, x, clear );
    jkff   JKFF_13 ( t13, trash, in13, ~in13, clk_write, x, clear );
    jkff   JKFF_14 ( t14, trash, in14, ~in14, clk_write, x, clear );
    jkff   JKFF_15 ( t15, trash, in15, ~in15, clk_write, x, clear );
    jkff   JKFF_16 ( t16, trash, in16, ~in16, clk_write, x, clear );
    jkff   JKFF_17 ( t17, trash, in17, ~in17, clk_write, x, clear );
    jkff   JKFF_18 ( t18, trash, in18, ~in18, clk_write, x, clear );
    jkff   JKFF_21 ( t21, trash, in21, ~in21, clk_write, x, clear );
    jkff   JKFF_22 ( t22, trash, in22, ~in22, clk_write, x, clear );
    jkff   JKFF_23 ( t23, trash, in23, ~in23, clk_write, x, clear );
    jkff   JKFF_24 ( t24, trash, in24, ~in24, clk_write, x, clear );
    jkff   JKFF_25 ( t25, trash, in25, ~in25, clk_write, x, clear );
    jkff   JKFF_26 ( t26, trash, in26, ~in26, clk_write, x, clear );
    jkff   JKFF_27 ( t27, trash, in27, ~in27, clk_write, x, clear );
    jkff   JKFF_28 ( t28, trash, in28, ~in28, clk_write, x, clear );
    and    AND_11  ( s11, t11, address );
    and    AND_12  ( s12, t12, address );
    and    AND_13  ( s13, t13, address );
    and    AND_14  ( s14, t14, address );
    and    AND_15  ( s15, t15, address );
    and    AND_16  ( s16, t16, address );
    and    AND_17  ( s17, t17, address );
    and    AND_18  ( s18, t18, address );
    and    AND_21  ( s21, t21, address );
    and    AND_22  ( s22, t22, address );
    and    AND_23  ( s23, t23, address );
    and    AND_24  ( s24, t24, address );
    and    AND_25  ( s25, t25, address );
    and    AND_26  ( s26, t26, address );
    and    AND_27  ( s27, t27, address );
    and    AND_28  ( s28, t28, address );

endmodule // ram1x2

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

module mux1x3 ( output s1, input a1, input a2, input a3, input a4, input a5, input a6, input a7, input a8, input ad1, input ad2, input ad3 );
    and     MUX1X3_1 ( t1, ~ad1, ~ad2, ~ad3, a1 );
    and     MUX1X3_2 ( t2, ~ad1, ~ad2,  ad3, a2 );
    and     MUX1X3_3 ( t3, ~ad1,  ad2, ~ad3, a3 );
    and     MUX1X3_4 ( t4, ~ad1,  ad2,  ad3, a4 );
    and     MUX1X3_5 ( t5,  ad1, ~ad2, ~ad3, a5 );
    and     MUX1X3_6 ( t6,  ad1, ~ad2,  ad3, a6 );
    and     MUX1X3_7 ( t7,  ad1,  ad2, ~ad3, a7 );
    and     MUX1X3_8 ( t8,  ad1,  ad2,  ad3, a8 );
    
    or      MUX1X3_9 ( s1, t1, t2, t3, t4, t5, t6, t7, t8);
endmodule // mux1x3

module mux16x3 ( output s11, output s12, output s13, output s14, output s15, output s16, output s17, output s18, 
                 output s21, output s22, output s23, output s24, output s25, output s26, output s27, output s28,
                 input a111, input a112, input a113, input a114, input a115, input a116, input a117, input a118, 
                 input a121, input a122, input a123, input a124, input a125, input a126, input a127, input a128,
                 input a211, input a212, input a213, input a214, input a215, input a216, input a217, input a218, 
                 input a221, input a222, input a223, input a224, input a225, input a226, input a227, input a228,
                 input a311, input a312, input a313, input a314, input a315, input a316, input a317, input a318, 
                 input a321, input a322, input a323, input a324, input a325, input a326, input a327, input a328,
                 input a411, input a412, input a413, input a414, input a415, input a416, input a417, input a418, 
                 input a421, input a422, input a423, input a424, input a425, input a426, input a427, input a428,
                 input a511, input a512, input a513, input a514, input a515, input a516, input a517, input a518, 
                 input a521, input a522, input a523, input a524, input a525, input a526, input a527, input a528,
                 input a611, input a612, input a613, input a614, input a615, input a616, input a617, input a618, 
                 input a621, input a622, input a623, input a624, input a625, input a626, input a627, input a628,
                 input a711, input a712, input a713, input a714, input a715, input a716, input a717, input a718, 
                 input a721, input a722, input a723, input a724, input a725, input a726, input a727, input a728,
                 input a811, input a812, input a813, input a814, input a815, input a816, input a817, input a818, 
                 input a821, input a822, input a823, input a824, input a825, input a826, input a827, input a828,
                 input address1, input address2, input address3 );

    mux1x3 MUX1X3_11 ( s11, a111, a211, a311, a411, a511, a611, a711, a811, address1, address2, address3 );
    mux1x3 MUX1X3_12 ( s12, a112, a212, a312, a412, a512, a612, a712, a812, address1, address2, address3 );
    mux1x3 MUX1X3_13 ( s13, a113, a213, a313, a413, a513, a613, a713, a813, address1, address2, address3 );
    mux1x3 MUX1X3_14 ( s14, a114, a214, a314, a414, a514, a614, a714, a814, address1, address2, address3 );
    mux1x3 MUX1X3_15 ( s15, a115, a215, a315, a415, a515, a615, a715, a815, address1, address2, address3 );
    mux1x3 MUX1X3_16 ( s16, a116, a216, a316, a416, a516, a616, a716, a816, address1, address2, address3 );
    mux1x3 MUX1X3_17 ( s17, a117, a217, a317, a417, a517, a617, a717, a817, address1, address2, address3 );
    mux1x3 MUX1X3_18 ( s18, a118, a218, a318, a418, a518, a618, a718, a818, address1, address2, address3 );
    mux1x3 MUX1X3_21 ( s21, a121, a221, a321, a421, a521, a621, a721, a821, address1, address2, address3 );
    mux1x3 MUX1X3_22 ( s22, a122, a222, a322, a422, a522, a622, a722, a822, address1, address2, address3 );
    mux1x3 MUX1X3_23 ( s23, a123, a223, a323, a423, a523, a623, a723, a823, address1, address2, address3 );
    mux1x3 MUX1X3_24 ( s24, a124, a224, a324, a424, a524, a624, a724, a824, address1, address2, address3 );
    mux1x3 MUX1X3_25 ( s25, a125, a225, a325, a425, a525, a625, a725, a825, address1, address2, address3 );
    mux1x3 MUX1X3_26 ( s26, a126, a226, a326, a426, a526, a626, a726, a826, address1, address2, address3 );
    mux1x3 MUX1X3_27 ( s27, a127, a227, a327, a427, a527, a627, a727, a827, address1, address2, address3 );
    mux1x3 MUX1X3_28 ( s28, a128, a228, a328, a428, a528, a628, a728, a828, address1, address2, address3 );
endmodule // mux16x3

module ram8x16;
    reg clk, clear, write;
    reg address1, address2, address3;
    reg i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28; // input

    dec3x8  DEC_3X8_1 ( ad1, ad2, ad3, ad4, ad5, ad6, ad7, ad8, address1, address2, address3 );

    ram1x16 RAM1X16_1 ( s11_1, s12_1, s13_1, s14_1, s15_1, s16_1, s17_1, s18_1, s21_1, s22_1, s23_1, s24_1, s25_1, s26_1, s27_1, s28_1,
                        i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                        clk, write, ad1, clear );
    ram1x16 RAM1X16_2 ( s11_2, s12_2, s13_2, s14_2, s15_2, s16_2, s17_2, s18_2, s21_2, s22_2, s23_2, s24_2, s25_2, s26_2, s27_2, s28_2,
                        i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                        clk, write, ad2, clear );
    ram1x16 RAM1X16_3 ( s11_3, s12_3, s13_3, s14_3, s15_3, s16_3, s17_3, s18_3, s21_3, s22_3, s23_3, s24_3, s25_3, s26_3, s27_3, s28_3,
                        i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                        clk, write, ad3, clear );
    ram1x16 RAM1X16_4 ( s11_4, s12_4, s13_4, s14_4, s15_4, s16_4, s17_4, s18_4, s21_4, s22_4, s23_4, s24_4, s25_4, s26_4, s27_4, s28_4,
                        i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                        clk, write, ad4, clear );
    ram1x16 RAM1X16_5 ( s11_5, s12_5, s13_5, s14_5, s15_5, s16_5, s17_5, s18_5, s21_5, s22_5, s23_5, s24_5, s25_5, s26_5, s27_5, s28_5,
                        i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                        clk, write, ad5, clear );
    ram1x16 RAM1X16_6 ( s11_6, s12_6, s13_6, s14_6, s15_6, s16_6, s17_6, s18_6, s21_6, s22_6, s23_6, s24_6, s25_6, s26_6, s27_6, s28_6,
                        i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                        clk, write, ad6, clear );
    ram1x16 RAM1X16_7 ( s11_7, s12_7, s13_7, s14_7, s15_7, s16_7, s17_7, s18_7, s21_7, s22_7, s23_7, s24_7, s25_7, s26_7, s27_7, s28_7,
                        i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                        clk, write, ad7, clear );
    ram1x16 RAM1X16_8 ( s11_8, s12_8, s13_8, s14_8, s15_8, s16_8, s17_8, s18_8, s21_8, s22_8, s23_8, s24_8, s25_8, s26_8, s27_8, s28_8,
                        i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                        clk, write, ad8, clear );

    mux16x3 MUX16X3_1 ( s11, s12, s13, s14, s15, s16, s17, s18, s21, s22, s23, s24, s25, s26, s27, s28,
                        s11_1, s12_1, s13_1, s14_1, s15_1, s16_1, s17_1, s18_1, s21_1, s22_1, s23_1, s24_1, s25_1, s26_1, s27_1, s28_1,
                        s11_2, s12_2, s13_2, s14_2, s15_2, s16_2, s17_2, s18_2, s21_2, s22_2, s23_2, s24_2, s25_2, s26_2, s27_2, s28_2,
                        s11_3, s12_3, s13_3, s14_3, s15_3, s16_3, s17_3, s18_3, s21_3, s22_3, s23_3, s24_3, s25_3, s26_3, s27_3, s28_3,
                        s11_4, s12_4, s13_4, s14_4, s15_4, s16_4, s17_4, s18_4, s21_4, s22_4, s23_4, s24_4, s25_4, s26_4, s27_4, s28_4,
                        s11_5, s12_5, s13_5, s14_5, s15_5, s16_5, s17_5, s18_5, s21_5, s22_5, s23_5, s24_5, s25_5, s26_5, s27_5, s28_5,
                        s11_6, s12_6, s13_6, s14_6, s15_6, s16_6, s17_6, s18_6, s21_6, s22_6, s23_6, s24_6, s25_6, s26_6, s27_6, s28_6,
                        s11_7, s12_7, s13_7, s14_7, s15_7, s16_7, s17_7, s18_7, s21_7, s22_7, s23_7, s24_7, s25_7, s26_7, s27_7, s28_7,
                        s11_8, s12_8, s13_8, s14_8, s15_8, s16_8, s17_8, s18_8, s21_8, s22_8, s23_8, s24_8, s25_8, s26_8, s27_8, s28_8,
                        address1, address2, address3 );

    initial
        begin
            $display ( " ------------------------- Exercicio 9 -------------------------" );
            $display ( " clk  write   address          input                output");

            // initial values
            clk = 1;
            write = 0;
            address1 = 0;
            address2 = 0;
            address3 = 0;
            clear = 1;
            i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
            i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;

            // input signal changing
            #5 clear = 0;
            #10 write = 1; address1 = 0; address2 = 0; address3 = 0;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 1; i28 = 1;
            #10 write = 1; address1 = 0; address2 = 0; address3 = 1;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 1; i26 = 1; i27 = 0; i28 = 0;
            #10 write = 1; address1 = 0; address2 = 1; address3 = 0;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 0; i22 = 0; i23 = 1; i24 = 1; i25 = 0; i26 = 0; i27 = 0; i28 = 0;
            #10 write = 1; address1 = 0; address2 = 1; address3 = 1;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 1; i22 = 1; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;
            #10 write = 1; address1 = 1; address2 = 0; address3 = 0;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 1; i18 = 1;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;
            #10 write = 1; address1 = 1; address2 = 0; address3 = 1;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 1; i16 = 1; i17 = 0; i18 = 0;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;
            #10 write = 1; address1 = 1; address2 = 1; address3 = 0;
                i11 = 0; i12 = 0; i13 = 1; i14 = 1; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;
            #10 write = 1; address1 = 1; address2 = 1; address3 = 1;
                i11 = 1; i12 = 1; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;

            #10 write = 0; address1 = 0; address2 = 0; address3 = 0;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;
            #10 write = 0; address1 = 0; address2 = 0; address3 = 1;
            #10 write = 0; address1 = 0; address2 = 1; address3 = 0;
            #10 write = 0; address1 = 0; address2 = 1; address3 = 1;
            #10 write = 0; address1 = 1; address2 = 0; address3 = 0;
            #10 write = 0; address1 = 1; address2 = 0; address3 = 1;
            #10 write = 0; address1 = 1; address2 = 1; address3 = 0;
            #10 write = 0; address1 = 1; address2 = 1; address3 = 1;
            #10 
            $finish;

            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d    %d       %d%d%d       %d%d%d%d%d%d%d%d.%d%d%d%d%d%d%d%d    %d%d%d%d%d%d%d%d.%d%d%d%d%d%d%d%d", 
                            $time, write, address1, address2, address3,
                            i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                            s11, s12, s13, s14, s15, s16, s17, s18, s21, s22, s23, s24, s25, s26, s27, s28 );
            end // always at positive edge clocking changing
endmodule // Exemplo_1101