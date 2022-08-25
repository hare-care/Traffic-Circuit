`timescale 1ns/10ps

module traffic_tb();
    reg clk, rstb;
    wire [1:0] output;
    traffic_light my_light(.clk(clock), .rstb(reset), .light(output));

    /* making clock */
    always begin
        #0.5 clk = ~clk;
    end

/* initialize and let it run */
    initial begin
        clk <= 1;
        reset <= 0;
        #1
        reset <= 1;
        #21
        reset <= 0;
        #10
        $finish;
    end

endmodule