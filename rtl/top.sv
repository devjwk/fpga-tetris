`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2026 07:48:07 PM
// Design Name: 
// Module Name: top
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


module top(
    input  logic       clk_100mhz,
    input  logic       reset_btn,

    output logic [3:0] vga_red,
    output logic [3:0] vga_green,
    output logic [3:0] vga_blue,
    output logic       vga_hsync,
    output logic       vga_vsync
    );
    logic clk_pix;
    logic clk_locked;

    logic [9:0] x;
    logic [9:0] y;
    logic video_on;
    logic frame_tick;

    // 100 MHz input → 25 MHz pixel clocks
    clk_wiz_0 u_clock (
        .clk_in1  (clk_100mhz),
        .clk_out1 (clk_pix),
        .reset    (reset_btn),
        .locked   (clk_locked)
    );

    // remain reset until clock stable
    // reset release going on with pixel clock timing
    (* ASYNC_REG = "TRUE" *)
    logic [1:0] reset_sync = 2'b11;

    logic reset_pix;

    always_ff @(posedge clk_pix or posedge reset_btn
               or negedge clk_locked) begin
        if (reset_btn || !clk_locked)
            reset_sync <= 2'b11;
        else
            reset_sync <= {reset_sync[0], 1'b0};
    end

    assign reset_pix = reset_sync[1];

    // current pixel location and initialize sync signal
    vga_timing u_timing (
        .clk_pix    (clk_pix),
        .reset      (reset_pix),
        .x          (x),
        .y          (y),
        .video_on   (video_on),
        .hsync      (vga_hsync),
        .vsync      (vga_vsync),
        .frame_tick (frame_tick)
    );

    // print out red/green/blue in indicate region
    test_pattern u_pattern (
        .x        (x),
        .y        (y),
        .video_on (video_on && !reset_pix),
        .red      (vga_red),
        .green    (vga_green),
        .blue     (vga_blue)
    );
endmodule
