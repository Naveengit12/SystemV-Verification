// Code your testbench here
// or browse Examples

`include "Interface.sv"
`include "Test.sv"

module tb;
  interf inf();
  test t1(inf);
  
  initial begin
    inf.clk = 0;
    forever #4 inf.clk = ~inf.clk;
  end
  
  initial begin
    inf.rstn = 1;
    #5 inf.rstn = 0;
  end
  
  sync_fifo #(.fifo_depth(inf.fifo_depth), .data_width(inf.data_width))
  uut (.clk(inf.clk), .rstn(inf.rstn), .wt_ena(inf.wt_ena), .rd_ena(inf.rd_ena), .data_in(inf.data_in), .data_out(inf.data_out), .full(inf.full), .empty(inf.empty));
  
  initial begin
    $dumpfile(".vcd");
    $dumpvars();
    #1000;
    $finish;
  end
endmodule
