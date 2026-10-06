`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2026 07:48:07 PM
// Design Name: 
// Module Name: vga_timing
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


module vga_timing (
    input  logic       clk_pix,
    input  logic       reset,

    output logic [9:0] x,
    output logic [9:0] y,
    output logic       video_on,
    output logic       hsync,
    output logic       vsync,
    output logic       frame_tick
);

    // Horizontal: 640 visible + 16 front porch
    //             + 96 sync pulse + 48 back porch
    localparam int H_VISIBLE    = 640;
    localparam int H_SYNC_START = 656;
    localparam int H_SYNC_END   = 752;
    localparam int H_TOTAL      = 800;

    // Vertical: 480 visible + 10 front porch
    //           + 2 sync pulse + 33 back porch
    localparam int V_VISIBLE    = 480;
    localparam int V_SYNC_START = 490;
    localparam int V_SYNC_END   = 492;
    localparam int V_TOTAL      = 525;

    // Advance the pixel position on each rising clock edge.
    always_ff @(posedge clk_pix) begin
        if (reset) begin
            x <= 10'd0;
            y <= 10'd0;
        end else begin
            if (x == H_TOTAL - 1) begin
                x <= 10'd0;

                if (y == V_TOTAL - 1)
                    y <= 10'd0;
                else
                    y <= y + 10'd1;
            end else begin
                x <= x + 10'd1;
            end
        end
    end

    // Enable color output within the visible display area.
    assign video_on = (x < H_VISIBLE) && (y < V_VISIBLE);

    // Generate active-low horizontal and vertical sync pulses.
    assign hsync = !((x >= H_SYNC_START) && (x < H_SYNC_END));
    assign vsync = !((y >= V_SYNC_START) && (y < V_SYNC_END));

    // Assert for one pixel clock at the final position of each frame.
    assign frame_tick = (x == H_TOTAL - 1) &&
                        (y == V_TOTAL - 1);

endmodule
