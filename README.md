# FPGA Tetris

A SystemVerilog FPGA Tetris project targeting the ZedBoard,
developed for Iowa State University CPRE 487.

## Development Environment

- FPGA board: ZedBoard
- Target device: xc7z020clg484-1
- Tool: Vivado 2020.1
- Input clock: 100 MHz
- Configured pixel clock: 25 MHz
- VGA visible resolution: 640 × 480

## Current Progress

The first milestone establishes the VGA output foundation.

- VGA timing, RGB test pattern, and top-level integration implemented
- Synthesis and implementation completed
- Current specified timing constraints met
- WNS: +36.521 ns
- WHS: +0.131 ns
- WPWS: +3.000 ns
- Failed routes: 0

Bitstream completion and hardware output verification are pending.
Tetris gameplay logic has not yet been implemented.

## Repository Structure

- rtl/: SystemVerilog source files
- constraints/: ZedBoard pin and clock constraints
- ip/: IP configuration files
- scripts/: Project and IP recreation scripts
- docs/reports/: Progress reports
- docs/evidence/: Experiment screenshots and hardware observations
- reports/: Vivado analysis reports

## Next Steps

1. Confirm bitstream generation.
2. Program the ZedBoard and observe the RGB test pattern.
3. Verify VGA timing through simulation.
4. Implement synchronized and debounced game inputs.
