`timescale 1ns / 1ps
module top(
    input wire [3:0] buttons,
    input wire [7:0] switch,
    output wire [3:0] anode,
    output wire [7:0] cathode
    );
    assign anode = ~buttons;
    assign cathode = switch;
endmodule
