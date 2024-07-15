// Verilog netlist created by Tang Dynasty v5.6.71036
// Mon Jul 15 22:18:02 2024

`timescale 1ns / 1ps
module hsyncfifo_2048x24_afull1920  // hsyncfifo_2048x24_afull1920.v(14)
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

  input clk;  // hsyncfifo_2048x24_afull1920.v(24)
  input [23:0] di;  // hsyncfifo_2048x24_afull1920.v(23)
  input re;  // hsyncfifo_2048x24_afull1920.v(25)
  input rst;  // hsyncfifo_2048x24_afull1920.v(22)
  input we;  // hsyncfifo_2048x24_afull1920.v(24)
  output afull_flag;  // hsyncfifo_2048x24_afull1920.v(29)
  output [23:0] do;  // hsyncfifo_2048x24_afull1920.v(27)
  output empty_flag;  // hsyncfifo_2048x24_afull1920.v(28)
  output full_flag;  // hsyncfifo_2048x24_afull1920.v(29)

  wire empty_flag_syn_2;  // hsyncfifo_2048x24_afull1920.v(28)
  wire full_flag_syn_2;  // hsyncfifo_2048x24_afull1920.v(29)

  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  not empty_flag_syn_1 (empty_flag_syn_2, empty_flag);  // hsyncfifo_2048x24_afull1920.v(28)
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
    fifo_inst_syn_10 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n47,open_n48,open_n49,open_n50,open_n51,di[15:12]}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n72,open_n73,open_n74,open_n75,open_n76,do[15:12]}));  // hsyncfifo_2048x24_afull1920.v(42)
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
    fifo_inst_syn_11 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n79,open_n80,open_n81,open_n82,open_n83,di[19:16]}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n104,open_n105,open_n106,open_n107,open_n108,do[19:16]}));  // hsyncfifo_2048x24_afull1920.v(42)
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
    fifo_inst_syn_12 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n111,open_n112,open_n113,open_n114,open_n115,di[23:20]}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n136,open_n137,open_n138,open_n139,open_n140,do[23:20]}));  // hsyncfifo_2048x24_afull1920.v(42)
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
    fifo_inst_syn_7 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n143,open_n144,open_n145,open_n146,open_n147,di[3:0]}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .afull_flag(afull_flag),
    .dob({open_n167,open_n168,open_n169,open_n170,open_n171,do[3:0]}),
    .empty_flag(empty_flag),
    .full_flag(full_flag));  // hsyncfifo_2048x24_afull1920.v(42)
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
    fifo_inst_syn_8 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n172,open_n173,open_n174,open_n175,open_n176,di[7:4]}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n197,open_n198,open_n199,open_n200,open_n201,do[7:4]}));  // hsyncfifo_2048x24_afull1920.v(42)
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
    fifo_inst_syn_9 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n204,open_n205,open_n206,open_n207,open_n208,di[11:8]}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n229,open_n230,open_n231,open_n232,open_n233,do[11:8]}));  // hsyncfifo_2048x24_afull1920.v(42)
  not full_flag_syn_1 (full_flag_syn_2, full_flag);  // hsyncfifo_2048x24_afull1920.v(29)

endmodule 

