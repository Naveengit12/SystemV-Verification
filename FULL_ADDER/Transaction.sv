
// Transaction Class
class transaction;
  rand bit a;
  rand bit b;
  rand bit c_in;
       bit sum;
       bit c_out;
  
  function void display(string name);
    $display("%s",name);
    $display("a=%b,b=%b,c_in=%b,sum=%b,c_out=%b",a,b,c_in,sum,c_out);
  endfunction
endclass
