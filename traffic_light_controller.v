
`timescale 1ns / 1ps



module traffic_light_controller (

    input wire clk, reset,

    output reg [2:0] NS_light, EW_light // 3-bits: [Red, Yellow, Green]

);



    // (States Parameters)

    parameter S0 = 2'b00; // NS Green, EW Red

    parameter S1 = 2'b01; // NS Yellow, EW Red

    parameter S2 = 2'b10; // NS Red, EW Green

    parameter S3 = 2'b11; // NS Red, EW Yellow



   
    parameter GREEN_DURATION  = 10;

    parameter YELLOW_DURATION = 3;



    reg [1:0] state, next_state;

    reg [3:0] timer;




    always @(posedge clk or posedge reset) begin

        if (reset) begin

            state <= S0;

            timer <= 0;

        end else begin

            if ((state == S0 || state == S2) && timer >= GREEN_DURATION) begin

                state <= next_state;

                timer <= 0;

            end else if ((state == S1 || state == S3) && timer >= YELLOW_DURATION) begin

                state <= next_state;

                timer <= 0;

            end else begin

                timer <= timer + 1;

            end

        end

    end



    // (Combinational Next State Logic)

    always @(*) begin

        case (state)

            S0:      next_state = S1;

            S1:      next_state = S2;

            S2:      next_state = S3;

            S3:      next_state = S0;

            default: next_state = S0;

        endcase

    end



    //  (Output Logic)

    always @(*) begin

        case (state)

            S0: begin // North-South

                NS_light = 3'b001; // Green

                EW_light = 3'b100; // Red

            end

            S1: begin // North-South

                NS_light = 3'b010; // Yellow

                EW_light = 3'b100; // Red

            end

            S2: begin // East-West

                NS_light = 3'b100; // Red

                EW_light = 3'b001; // Green

            end

            S3: begin // East-West

                NS_light = 3'b100; // Red

                EW_light = 3'b010; // Yellow

            end

            default: begin

                NS_light = 3'b100;

                EW_light = 3'b100;

            end

        endcase

    end



endmodule

