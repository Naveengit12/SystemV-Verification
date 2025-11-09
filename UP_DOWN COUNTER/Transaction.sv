//  transaction code

class transaction;
  rand bit up_down;           
  bit rstn;               
  bit [2:0] count;       
  bit clk;

  function void display(string name);
    $display("%s", name);
    $display($time,"up_down=%b, clk=%b, rstn=%b, count=%0d", up_down, clk, rstn, count);
  endfunction
endclass
