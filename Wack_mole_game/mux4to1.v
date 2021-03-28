`timescale 1ns / 1ps

module mux4to1( 
input [3:0] A,
input [3:0] B,
input [3:0] C,
input [3:0] D,
input [1:0] sel, 
output [3:0] Y);
assign Y = (sel==0)?A : (sel==1)?B : (sel==2)?C : D; //selector switches decide what data at the input data lines go through to the output (Y). 
endmodule
