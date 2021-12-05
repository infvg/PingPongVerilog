`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:56:49 12/05/2021 
// Design Name: 
// Module Name:    TwoHZ 
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
module TwoHZ(input clk, reset, output clk1hz);
reg [26:0] counter;
always @(posedge clk)
begin
if (reset)
counter <= 0;
else
counter <= counter + 1;
end
assign clk1hz = (counter == 49999999);

endmodule