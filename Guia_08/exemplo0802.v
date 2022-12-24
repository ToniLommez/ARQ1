// ---------------------
// SUBTRATORES
// Nome: Marcos Antonio lommez Candido Ribeiro
// Matricula: 771157
// 25/09/2022
// ---------------------


// -------------------------
// full Sub
// -------------------------
module fullSub ( output s1, output s0, input a, input b, input carryIn );
    wire not_a;
    wire not_t;
    wire t0;
    wire t1;
    wire t2;
    wire t3;

    // half Sub
    not not1 ( not_a, a );
    and AND1 ( t0, b, not_a );
    xor XOR1 ( t1, b, a     );
    // carry Sub
    not not2 ( not_t, t1 );
    and AND2 ( t2, not_t, carryIn );
    xor XOR2 ( s0, t1,    carryIn );
    or  OR1  ( s1, t2,    t0      );
endmodule // fullSub


module test_fullSub;
    // ------------------------- definir dados
    reg [4:0] x;
    reg [4:0] y;
    wire [4:0] sub;
    wire w0;
    wire w1;
    wire w2;
    wire w3;
    wire w4;

    fullSub FA0 ( w0, sub[0], x[0], y[0], 1'b0 );
    fullSub FA1 ( w1, sub[1], x[1], y[1], w0   );
    fullSub FA2 ( w2, sub[2], x[2], y[2], w1   );
    fullSub FA3 ( w3, sub[3], x[3], y[3], w2   );
    fullSub FA4 ( w4, sub[4], x[4], y[4], w3   );

    // ------------------------- parte principal
    initial 
        begin
            $display("Ex0802 - Marcos Antonio Lommez - 771157");
            $display("---- 5 bits sub ----");

            // projetar testes do subtrator completo
            $display("  x     y          s  ");
            $monitor("%b %b      %b ", x, y, sub);
               x = 5'b00000; y = 5'b00000;
            #1 x = 5'b00000; y = 5'b00001;
            #1 x = 5'b11111; y = 5'b00011;
            #1 x = 5'b00111; y = 5'b11001;
            #1 x = 5'b00000; y = 5'b11111;
        end
endmodule // test_fullSub