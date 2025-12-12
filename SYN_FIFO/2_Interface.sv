//  interface data contains here 

interface interf #(parameter fifo_depth = 10, data_width = 4);
  logic clk;
  logic rstn;
  logic wt_ena;
  logic rd_ena;
  logic [data_width-1:0] data_in;
  logic [data_width-1:0] data_out;
  logic full;
  logic empty;
endinterface
