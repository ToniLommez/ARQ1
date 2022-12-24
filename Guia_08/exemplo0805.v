// ---------------------
// COMPLEMENTO DE 2
// Nome: Marcos Antonio lommez Candido Ribeiro
// Matricula: 771157
// 25/09/2022
// ---------------------


// -------------------------
// two complement
// -------------------------
module twoComplement ( output s1, output s0, input a, input carryIn );
    wire not_a;
    
    // one complement
    not NOT1 (not_a, a);
    // two complement
    xor XOR1 ( s0, not_a, carryIn );
    and AND1 ( s1, not_a, carryIn );
endmodule // twoComplement


module test_twoComplement;
    // ------------------------- definir dados
    reg [4:0] x;
    wire [4:0] comp_dois;
    wire w1;
    wire w2;
    wire w3;
    wire w4;

    twoComplement FA0 ( w0, comp_dois[0], x[0], 1'b1 );
    twoComplement FA1 ( w1, comp_dois[1], x[1], w0   );
    twoComplement FA2 ( w2, comp_dois[2], x[2], w1   );
    twoComplement FA3 ( w3, comp_dois[3], x[3], w2   );
    twoComplement FA4 ( w4, comp_dois[4], x[4], w3   );

    // ------------------------- parte principal
    initial 
        begin
            $display("Ex0805 - Marcos Antonio Lommez - 771157");
            $display("---- 5 bits two complement ----");

            // projetar testes do complemento de dois
            $display("  x    complemento de 2  ");
            $monitor(" %b         %b ", x, comp_dois);
               x = 5'b00000;
            #1 x = 5'b00000;
            #1 x = 5'b00111;
            #1 x = 5'b00111;
            #1 x = 5'b11111;
            #1 x = 5'b10000;
        end
endmodule // test_twoComplement