`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:22 12/05/2021 
// Design Name: 
// Module Name:    PingPong 
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
module PingPong(input clk, reset,D,P0,P1, output [7:0]seg, [3:0]an,output L1,L2,L3,L4,L5,L6);

reg pl;
parameter STATE0 = 3'd0, STATE1 = 3'd1,STATE2 = 3'd2,STATE3 = 3'd3,STATE4 = 3'd4,STATE5 = 3'd5,STATE6 = 3'd6;

reg[2:0] state, next_state;
reg [3:0]sc0,sc1;
reg resetsc;

assign L1 = ~state[2] & ~state[1];
assign L2 = ~state[2] & state[1] & ~state[0];
assign L3 = ~state[2] & state[1] & state[0];
assign L4 = state[2] & ~state[1] & ~state[0];
assign L5 = state[2] & ~state[1] & state[0];
assign L6 = state[2] & state[1] & ~state[0];
DISP7SEG disp (clk, sc0,4'd0,4'd0,sc1,0,0,0,0,0,0,seg,an);
always @(posedge clk,posedge reset) 
	if(reset)
	begin
		state <= STATE0;
		resetsc = 1;
	end
	else if(D)
	begin
		if(resetsc)
		resetsc = 0;
		state <= next_state;
	end
always @(state,P0,P1)
begin
case(state)
STATE0:
begin 

if(resetsc)
sc0 <= 4'd0; sc1 <= 4'd0;

if(sc0 == 4'hF | sc1 == 4'hF) begin
next_state = STATE0;
end
else begin

if(P1) begin
pl = 1;
next_state = STATE5;
end
else next_state = STATE0;
end
end

STATE1:
begin 
if(P0)
begin
pl = 0;
next_state = STATE2;
end
else begin
sc1 <= sc1 + 1;
next_state = STATE0;
end
end

STATE2:
begin 
if(pl)
if(P0) begin
sc1 <= sc1 + 1;
next_state = STATE0;
end
else
next_state = STATE1;
else
next_state = STATE3;
end

STATE3:
begin 
if(pl)
next_state = STATE2;
else
next_state = STATE4;
end

STATE4:
begin 
if(pl)
next_state = STATE3;
else
next_state = STATE5;
end

STATE5:
begin 
if(pl)
next_state = STATE4;
else
if(P1) begin
sc0 <= sc0 + 1;
next_state = STATE0;
end
else begin
next_state = STATE6;
end
end

STATE6:
begin 
if(P1) begin
pl = 1;
next_state = STATE5;
end
else begin
sc0 <= sc0 + 1;
next_state = STATE0;
end
end

endcase
end
endmodule
