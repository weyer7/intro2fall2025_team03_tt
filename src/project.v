`default_nettype none

module tt_um_intro_ii_f25_matrix_mult (
`ifdef USE_POWER_PINS
    inout VPWR,
    inout VGND,
`endif
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out[7:2] = '0;
  assign uio_out = '0;
  assign uio_oe  = '0;

  top project_inst(
    // I/O ports
    .hz100(clk),
    .spi_clk(ui_in[0]),
    .cs(ui_in[1]),
    .mosi(ui_in[2]),
    .miso(uo_out[0]),
    .ready(uo_out[1])
    );

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, 1'b0};

endmodule