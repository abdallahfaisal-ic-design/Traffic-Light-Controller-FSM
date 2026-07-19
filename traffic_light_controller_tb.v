
`timescale 1ns / 1ps



module traffic_light_controller_tb;

    reg clk, reset;

    wire [2:0] NS_light, EW_light;



    traffic_light_controller uut (

        .clk(clk), .reset(reset), .NS_light(NS_light), .EW_light(EW_light)

    );



    always #5 clk = ~clk;



    initial begin

        clk = 0; reset = 1;

        #15 reset = 0;

        

        $display("[TB] Traffic Light Controller Active. Monitoring state durations...");


        #400;

        

        $finish;

    end

    


    always @(NS_light or EW_light) begin

        $display("Time=%0t | NS Light [R,Y,G]=%b | EW Light [R,Y,G]=%b", $time, NS_light, EW_light);

    end

endmodule

