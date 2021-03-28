`timescale 1ns / 1ps
module top(
    input wire clk, // 100MHz(very fast, we need to slow down)
    output wire led
    );
    
// wrapper for clock divider
clock_divider wrapper (
    .clk(clk),
    .divided_clk(led)
    );
endmodule
