`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:05:45 11/08/2021 
// Design Name: 
// Module Name:    OneHZ 
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
module OneHZ (input clk, reset, output clk1hz);
reg [26:0] counter;
always @(posedge clk)
begin
if (reset)
counter <= 0;
else
counter <= counter + 1;
end
assign clk1hz = (counter == 99999999);

endmodule

