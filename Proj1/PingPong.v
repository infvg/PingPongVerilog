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
module PingPong(input clk, reset,D,P0,P1, output [7:0]seg, [3:0]an,output L1,L2,L3,L4,L5,L6,L7,L8);

reg pl;
parameter STATE0 = 4'd0, STATE1 = 4'd1,STATE2 = 4'd2,STATE3 = 4'd3,STATE4 = 4'd4,STATE5 = 4'd5,STATE6 = 4'd6,STATE7 = 4'd7,STATE8 = 4'd8;

reg[3:0] state, next_state;
reg [3:0]sc0,sc1;
reg addToMin,addToMax;

assign L1 = (state==4'd1);
assign L2 = (state==4'd2);
assign L3 = (state==4'd3);
assign L4 = (state==4'd4);
assign L5 = (state==4'd5);
assign L6 = (state==4'd6);
assign L7 = (state==4'd7);
assign L8 = (state==4'd8) | (state==4'd0);

reg gameStart;

DISP7SEG disp (clk, sc1,D1,D2,sc0,text_mode,slow,medum,fast,wrong,error,seg,an);



always @(posedge clk,posedge reset) 
	if(reset)
	begin
		sc0 <= 0;
		sc1 <= 0;
		state <= STATE0;
	end
	else if(D)
	begin
		sc0 <= sc0 + addToMin;
		sc1 <= sc1 + addToMax;
		state <= next_state;
	end
	
always @(state,P0,P1)
begin
	case(state)
		STATE0:
		begin 
			
			addToMin <= 0;
			addToMax <= 0;
			
			if(sc0 == 15 | sc1 == 15) begin
				next_state = STATE0;
				end
			else begin
				if(P1) begin
				pl <= 1;
				next_state = STATE7;
				end
				else next_state = STATE0;
			end
		end

		STATE1:
		begin 
		if(P0)
			begin
			pl <= 0;
			addToMax <= 0;
			addToMin <= 0;
			next_state = STATE2;
			end
		else begin
			addToMax <= 1;
			addToMin <= 0;
			next_state = STATE0;
			end
		end

		STATE2:
		begin 
		if(pl) begin
		if(P0) begin
		addToMax <= 1;
		addToMin <= 0;
		next_state = STATE0;
		end
		else begin
		addToMax <= 0;
		addToMin <= 0;
		next_state = STATE1;
		end
		end
		else begin 
		addToMax <= 0;
		addToMin <= 0;
		next_state = STATE3;
		end
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
		next_state = STATE6;
		end

		STATE6:
		begin 
		if(pl)
		next_state = STATE5;
		else
		next_state = STATE7;
		end

		STATE7:
		begin
		if(gameStart) begin
		gameStart = 0;
		pl <= 1;
		next_state = STATE6;
		end 
		else 
		if(pl)
		next_state = STATE6;
		else begin
		if(P1) begin

		addToMin <= 1;
		addToMax <= 0;
		next_state = STATE0;

		end
		else begin
		
		addToMax <= 0;
		addToMin <= 0;
		next_state = STATE8;

		end
		end
		end

		STATE8:
		begin 
		if(P1) begin
		pl <= 1;
		addToMax <= 0;
		addToMin <= 0;
		next_state = STATE7;

		end
		else begin
		addToMin <= 1;
		addToMax <= 0;
		next_state = STATE0;
		end
		end

	endcase
end
endmodule
