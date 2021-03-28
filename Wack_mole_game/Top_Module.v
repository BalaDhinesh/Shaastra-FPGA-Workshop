
`timescale 1ns / 1ps

module Top_Module(   //Top Module
    input clk, //system clock 100 MHz Basys 3 Board
	input [15:0] sw,//switches to whack a mole
	input reset, //to reset the game
	output [15:0] led, //leds as mole
	output [3:0] an, 
	output [6:0] seg
	); //to display timer (2 left most segments) and mole count (2 right most segments)
	
	
	wire clk_out; //100 Hz slow clock for toggling 7 segments
	wire timer_clk_out; //1Hz (1 sec) timer clock for count down 20, 19, 18,...0
	wire [3:0] mux_out; //output of the multiplexer
	wire [1:0] counter_out; //2-bit counter output, initially set to 0
	wire [3:0] timer_count_ones, timer_count_tens, score_ones, score_tens;//input to Mux, o/p of BCD module
	wire [5:0] score_count; //Max score of 32, input to BCD module
	wire [4:0] timer_count; //Game Timer runs for 20 seconds, input to BCD module

	
	binarytobcd UBCD(timer_count, score_count, timer_count_ones, timer_count_tens, score_ones, score_tens); 
	
	mux4to1 UMUX(score_ones, score_tens, timer_count_ones, timer_count_tens, counter_out, mux_out); 
	
	slowclock USCK(clk, clk_out); //slow clock for seven segment
	
	twobitcounter U2BC(clk_out, counter_out); //counter for toggling 4 segments on board and displaying game timer and score count
	
	decoder2to4 UD(counter_out, an); //cycles through 4 segments on Basys 3
	
	bcd7seg UBCDSEG(mux_out, seg); //Converts bcd to seven segment
	
    timerClock UTCK(clk, timer_clk_out); //1 second clock for game timer
	
	timerCount UTC(clk, reset, timer_count, Buzzer); //Game timer 20 --> 0
	
	Whack_a_Mole_Game UWGM(clk, sw, reset, led, score_count);//Game/score count
	
endmodule
