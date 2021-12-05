`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:13 12/05/2021 
// Design Name: 
// Module Name:    PingPongTest 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PingPongTest(input clk, reset,P1,P2,D1,D2, output [7:0]seg, [3:0]an,output L1,L2,L3,L4,L5,L6);

assign D = D2 ? (D1 ? clk2hz : clk3hz) : (clk1hz); 

PingPong p (clk,reset,D,P1,P2,seg,an,L1,L2,L3,L4,L5,L6);

OneHZ h1(clk,reset,clk1hz);
TwoHZ h2(clk,reset,clk2hz);
ThreeHZ h3(clk,reset,clk3hz);

endmodule
