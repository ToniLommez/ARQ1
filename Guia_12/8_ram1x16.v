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

module ram1x16main;
    reg clk, clear, address, write;
    reg i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28; // input

    ram1x16 RAM1X16_1 ( s11, s12, s13, s14, s15, s16, s17, s18, s21, s22, s23, s24, s25, s26, s27, s28,
                        i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                        clk, write, address, clear );


    initial
        begin
            $display ( " ------------------------- Exercicio 8 -------------------------" );
            $display ( " clk  write   address          input                output");

            // initial values
            clk = 1;
            write = 0;
            address = 0;
            clear = 1;
            i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
            i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;

            // input signal changing
            #5 clear = 0;
            #10 write = 1; address = 1;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 1; i22 = 1; i23 = 1; i24 = 1; i25 = 1; i26 = 1; i27 = 1; i28 = 1;
            #10 write = 0; address = 1;
            #10 write = 0; address = 0;
            #10 write = 1; address = 0;
                i11 = 1; i12 = 1; i13 = 1; i14 = 1; i15 = 1; i16 = 1; i17 = 1; i18 = 1;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;
            #10 write = 0; address = 0;
            #10 write = 0; address = 1;
            #10 write = 1; address = 1;
                i11 = 1; i12 = 1; i13 = 1; i14 = 1; i15 = 1; i16 = 1; i17 = 1; i18 = 1;
                i21 = 1; i22 = 1; i23 = 1; i24 = 1; i25 = 1; i26 = 1; i27 = 1; i28 = 1;
            #10 write = 0; address = 1;
                i11 = 0; i12 = 0; i13 = 0; i14 = 0; i15 = 0; i16 = 0; i17 = 0; i18 = 0;
                i21 = 0; i22 = 0; i23 = 0; i24 = 0; i25 = 0; i26 = 0; i27 = 0; i28 = 0;
            #10 write = 0; address = 0;
            #10 write = 0; address = 1;
            #10 write = 0; address = 1;
            #10 
            $finish;

            $finish;
        end // initial
        
        always
            #5 clk = ~clk;

        always @( posedge clk )
            begin
                $display ( " %3d    %d       %d         %d%d%d%d%d%d%d%d.%d%d%d%d%d%d%d%d    %d%d%d%d%d%d%d%d.%d%d%d%d%d%d%d%d", 
                            $time, write, address,
                            i11, i12, i13, i14, i15, i16, i17, i18, i21, i22, i23, i24, i25, i26, i27, i28,
                            s11, s12, s13, s14, s15, s16, s17, s18, s21, s22, s23, s24, s25, s26, s27, s28 );
            end // always at positive edge clocking changing
endmodule // Exemplo_1101
