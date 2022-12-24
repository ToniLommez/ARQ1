// ---------------------------
// -- test clock generator (6)
// ---------------------------
`include "clock.v"

module quadruplepulse ( signal, clock );
    input clock;
    output signal;
    reg signal;
    always @ ( posedge clock )
        begin
            signal = 1'b1;
            #3 signal = 1'b0;
            #3 signal = 1'b1;
            #3 signal = 1'b0;
            #3 signal = 1'b1;
            #3 signal = 1'b0;
            #3 signal = 1'b1;
            #3 signal = 1'b0;
        end
endmodule // pulse

module Exemplo_0906;
    wire clock;
    clock clk ( clock );
    wire p1;
    quadruplepulse PT1 ( p1, clock );

    initial 
        begin
            $dumpfile ( "Exemplo_0906.vcd" );
            $dumpvars ( 1, clock, p1);
            #480 $finish;
        end
endmodule // Exemplo_0906