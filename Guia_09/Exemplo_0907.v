// ---------------------------
// -- test clock generator (7)
// ---------------------------
`include "clock.v"

module quadruplepulse ( signal, clock );
    input clock;
    output signal;
    reg signal;
    always @ ( negedge clock )
        begin
            signal = 1'b0;
            #5 signal = 1'b1;
            #5 signal = 1'b0;
            #5 signal = 1'b1;
            #5 signal = 1'b0;
            #5 signal = 1'b1;
            #5 signal = 1'b0;
            #5 signal = 1'b1;
            #5 signal = 1'b0;
            #5 signal = 1'b1;
            #5 signal = 1'b0;
            #5 signal = 1'b1;
            #5 signal = 1'b0;
            #5 signal = 1'b1;
            #5 signal = 1'b0;
            #5 signal = 1'b1;
            #5 signal = 1'b0;
            #5 signal = 1'b1;
            #5 signal = 1'b0;
            #5 signal = 1'b1;
            #5 signal = 1'b0;
            #5 signal = 1'b1;
            #5 signal = 1'b0;
            #5 signal = 1'b1;
        end
endmodule // pulse

module Exemplo_0907;
    wire clock;
    clock clk ( clock );
    wire p1;
    quadruplepulse PT1 ( p1, clock );

    initial 
        begin
            $dumpfile ( "Exemplo_0907.vcd" );
            $dumpvars ( 1, clock, p1);
            #480 $finish;
        end
endmodule // Exemplo_0907