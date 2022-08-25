`timescale 1ns/10ps

module traffic_tb();
    reg clk, reset;
    wire [1:0] out;
    traffic_light my_light(.clk(clk), .rstb(reset), .light(out));

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
        #1
        reset <= 0;
        #21
        reset <= 1;
        #1
        reset <= 0;
        #10
        $finish;
    end

endmodule