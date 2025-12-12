//  class transaction data here 

class transaction #(parameter fifo_depth = 10, data_width = 4);
  bit clk;
  bit rstn;
  bit rd_ena;
  bit wt_ena;
  rand bit [data_width-1:0] data_in;
  bit [data_width-1:0] data_out;
  bit full;
  bit empty;
  
  function void data(int count);
    if(count<fifo_depth) begin
      wt_ena = 1;
      rd_ena = 0;
    end
    else
      begin
        wt_ena = 0;
        rd_ena = 1;
      end
  endfunction
endclass
      
