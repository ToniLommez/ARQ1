/*
* Marcos Antonio Lommez Candido Ribeiro
* 771157
* 03/08/2022
* Arquitetura de Computadores I
*/

module Exercicio05;
// define data
    reg [0:8][7:0] s1 = "PUC-Minas";
    reg [0:6][7:0] s2 = "02-2022";
    reg [0:13][7:0] s3 = "Belo Horizonte";
    reg [0:4][7:0] s4;
    reg [0:5][7:0] s5;
    // actions
    initial
        begin : main
            s4[0] = 8'o115;
            s4[1] = 8'o141;
            s4[2] = 8'o156;
            s4[3] = 8'o150;
            s4[4] = 8'o141;
            s5[0] = 8'h42;
            s5[1] = 8'h2E;
            s5[2] = 8'h48;
            s5[3] = 8'h74;
            s5[4] = 8'h65;
            s5[5] = 8'h2E;
            $display ("\n05b.");
            $display ("%s      = %x %x %x %x %x %x %x %x %x (16_ASCII)", s1, s1[0], s1[1], s1[2], s1[3], s1[4], s1[5], s1[6], s1[7], s1[8]);
            $display ("%s        = %x %x %x %x %x %x %x       (16_ASCII)", s2, s2[0], s2[1], s2[2], s2[3], s2[4], s2[5], s2[6]);
            $display ("%s = %8b %8b %8b %8b\n                 %8b %8b %8b %8b\n                 %8b %8b %8b %8b\n                 %8b %8b          (2_ASCII)", s3, s3[0], s3[1], s3[2], s3[3], s3[4], s3[5], s3[6], s3[7], s3[8], s3[9], s3[10], s3[11], s3[12], s3[13]);
            
            $display ("%o %o %o %o %o = %s                 (ASCII)", s4[0], s4[1], s4[2], s4[3], s4[4], s4);
            $display ("%x %x %x %x %x %x   = %s                (ASCII)", s5[0], s5[1], s5[2], s5[3], s5[4], s5[5],s5);
    end // main
endmodule // Exercicio05