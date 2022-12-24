// ---------------------------
// -- test clock generator (4)
// ---------------------------
`include "clock.v"

module triplepulse ( signal, clock );
    input clock;
    output signal;
    reg signal;
    always @ ( clock )
        begin
            signal = 1'b0;
            #4 signal = 1'b1;
            #4 signal = 1'b0;
            #4 signal = 1'b1;
            #4 signal = 1'b0;
            #4 signal = 1'b1;
        end
endmodule // pulse

module Exemplo_0904;
    wire clock;
    clock clk ( clock );
    wire p1;
    triplepulse PT1 ( p1, clock );

    initial 
        begin
            $dumpfile ( "Exemplo_0904.vcd" );
            $dumpvars ( 1, clock, p1);
            #480 $finish;
        end
endmodule // Exemplo_0904