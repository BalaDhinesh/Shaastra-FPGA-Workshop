`timescale 1ns / 1ps

module timerCount(
input clk,//clock from Basys 3
    input reset,//reset
       output [4:0] count//20 second timer
);
wire clk_out;
timerClock UTC(clk, clk_out);
reg [4:0] current_count = 20; //initially setting counter to zero
always @(posedge clk_out) begin //when positive edge of the clock arrives
    if(reset)
        current_count <= 20;
    else if(current_count == 0)
        current_count <= current_count;  
    else if(current_count >= 1)
        current_count <= current_count - 1; 
    else
        current_count <= current_count;
end
    assign count = current_count;
endmodule
