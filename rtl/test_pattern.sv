`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2026 07:48:07 PM
// Design Name: 
// Module Name: test_pattern
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_pattern(
    input logic [9:0] x,
    input logic [9:0] y,
    input logic video_on,
    
    output logic [3:0] red,
    output logic [3:0] green,
    output logic [3:0] blue
    );
    
    always_comb begin
    //during porch and sync timing -> print out black 
    red = 4'h0;
    green = 4'h0;
    blue = 4'h0;
    
    if (video_on) begin
        if (x<213) begin
            red = 4'hF;
        
        end else if(x < 426) begin
            green = 4'hF;
        end else begin
            blue = 4'hF;
        end
    end
end
endmodule
