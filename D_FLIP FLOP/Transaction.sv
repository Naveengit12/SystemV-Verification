// transaction or packet class

class transaction;
  rand bit d;
  bit rstn;
  bit q;  //// output, don't randamization
  bit q_;
  
  function void display(string name);
    $display("-------%s------",name);
    $display("time=%0t,rstn=%b,d=%0b,q=%0b,q_=%0b",$time,rstn,d,q,q_);
  endfunction
endclass
