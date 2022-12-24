// ---------------------
// SOMADORES
// Nome: Marcos Antonio lommez Candido Ribeiro
// Matricula: 771157
// 25/09/2022
// ---------------------


// -------------------------
// full adder
// -------------------------
module fullAdder ( output s1, output s0, input a, input b, input carryIn );
    wire t0;
    wire t1;
    wire t2;
    wire t3;

    // half adder
    xor XOR2 ( t0, a, b );
    and AND2 ( t1, a, b );
    // carry adder
    xor XOR3 ( s0, t0, carryIn );
    and AND4 ( t2, t0, carryIn );
    or  OR1  ( s1, t2, t1      );
endmodule // fullAdder


module test_fullAdder;
    // ------------------------- definir dados
    reg [4:0] x;
    reg [4:0] y;
    wire [4:0] soma;
    wire w1;
    wire w2;
    wire w3;
    wire w4;

    fullAdder FA0 ( w0, soma[0], x[0], y[0], 1'b0 );
    fullAdder FA1 ( w1, soma[1], x[1], y[1], w0   );
    fullAdder FA2 ( w2, soma[2], x[2], y[2], w1   );
    fullAdder FA3 ( w3, soma[3], x[3], y[3], w2   );
    fullAdder FA4 ( w4, soma[4], x[4], y[4], w3   );

    // ------------------------- parte principal
    initial 
        begin
            $display("Ex0801 - Marcos Antonio Lommez - 771157");
            $display("---- 5 bits adder ----");

            // projetar testes do somador completo
            $display("  x     y          s  ");
            $monitor("%b %b      %b ", x, y, soma);
               x = 5'b00000; y = 5'b00000;
            #1 x = 5'b00000; y = 5'b00001;
            #1 x = 5'b00111; y = 5'b00111;
            #1 x = 5'b00111; y = 5'b11001;
            #1 x = 5'b11111; y = 5'b11111;
        end
endmodule // test_fullAdder