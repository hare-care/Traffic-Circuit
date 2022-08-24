module traffic_light(clk, rstb, light);
    /* Inputs Outputs */
    input clk, rstb;
    output reg [2:0] light;

    /* states */
    reg [1:0] scurr, snext;
    parameter [2:0] green = 2'b00, 
                    flash_green = 2'b01, 
                    yellow = 2'b11, 
                    red = 2'b10;

    /* State memory */
    always @(posedge clk) begin
        scurr <= snext;
    end

    /* Next State logic */
    always @(scurr or negedge rstb) begin
        if (rstb == 1'b1) begin
            scurr <= green;
        end


        case(scurr)
            green: snext = flash_green;
            flash_green: snext = yellow;
            yellow: snext = red;
            red: snext = green;
        endcase
    end

    /* Output logic */
    always @(scurr or negedge rstb) begin
        if (rstb == 1'b1) begin
            light <= green;
        end
        
        case(scurr)
            green: light = green;
            flash_green: light = flash_green;
            yellow: light = yellow;
            red: light = red;
        endcase
    end


endmodule