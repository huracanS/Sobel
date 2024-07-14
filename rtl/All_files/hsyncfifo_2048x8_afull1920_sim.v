// Verilog netlist created by Tang Dynasty v5.6.71036
// Thu Jul 11 23:06:58 2024

`timescale 1ns / 1ps
module hsyncfifo_2048x8_afull1920  // hsyncfifo_2048x8.v(14)
  (
  clk,
  di,
  re,
  rst,
  we,
  afull_flag,
  do,
  empty_flag,
  full_flag
  );

  input clk;  // hsyncfifo_2048x8.v(24)
  input [7:0] di;  // hsyncfifo_2048x8.v(23)
  input re;  // hsyncfifo_2048x8.v(25)
  input rst;  // hsyncfifo_2048x8.v(22)
  input we;  // hsyncfifo_2048x8.v(24)
  output afull_flag;  // hsyncfifo_2048x8.v(29)
  output [7:0] do;  // hsyncfifo_2048x8.v(27)
  output empty_flag;  // hsyncfifo_2048x8.v(28)
  output full_flag;  // hsyncfifo_2048x8.v(29)

  wire empty_flag_syn_2;  // hsyncfifo_2048x8.v(28)
  wire full_flag_syn_2;  // hsyncfifo_2048x8.v(29)

  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  not empty_flag_syn_1 (empty_flag_syn_2, empty_flag);  // hsyncfifo_2048x8.v(28)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000011000),
    .AEP1(32'b00000000000000000000000000011100),
    .AF(32'b00000000000000000001110111111100),
    .AFM1(32'b00000000000000000001110111111000),
    .ASYNC_RESET_RELEASE("ASYNC"),
    .DATA_WIDTH_A("4"),
    .DATA_WIDTH_B("4"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000000100),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111100),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    fifo_inst_syn_3 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n47,open_n48,open_n49,open_n50,open_n51,di[3:0]}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .afull_flag(afull_flag),
    .dob({open_n71,open_n72,open_n73,open_n74,open_n75,do[3:0]}),
    .empty_flag(empty_flag),
    .full_flag(full_flag));  // hsyncfifo_2048x8.v(42)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000011000),
    .AEP1(32'b00000000000000000000000000011100),
    .AF(32'b00000000000000000001110111111100),
    .AFM1(32'b00000000000000000001110111111000),
    .ASYNC_RESET_RELEASE("ASYNC"),
    .DATA_WIDTH_A("4"),
    .DATA_WIDTH_B("4"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000000100),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111100),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    fifo_inst_syn_4 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n76,open_n77,open_n78,open_n79,open_n80,di[7:4]}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n101,open_n102,open_n103,open_n104,open_n105,do[7:4]}));  // hsyncfifo_2048x8.v(42)
  not full_flag_syn_1 (full_flag_syn_2, full_flag);  // hsyncfifo_2048x8.v(29)

endmodule 

