`timescale 1ns / 1ps
// counter based(to slow down the clock signal)
module clock_divider #(parameter div_value = 24999999)(
    input wire clk,             // 100MHz
    output reg divided_clk = 0     // 1 Hz => 0.5s ON and 0.5s OFF
    // Why reg in always block? Anything which needs to be assigned or reassigned in the always block should have reg since it stores previous values
    );


// Formula:
// division_value = 100MHz/(2*desired frequency) - 1

// counter
integer counter_value = 0;  // integer is a 32bit wide register bus

always@ (posedge clk)       // paranthesis stands for sensitivity list  // posedge means rising edge 0-1
begin
    if (counter_value == div_value)
        counter_value <= 0;  // reset counter value
    else
        counter_value <= counter_value + 1;  // count up // '<=' means the line updates in parallel 
end

// divide clock
always@ (posedge clk)
begin
    if(counter_value == div_value)
        divided_clk <= ~divided_clk; // flip the signal
    else
        divided_clk <= divided_clk;// previous value(no change) 
end
endmodule
