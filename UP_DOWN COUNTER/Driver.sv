// driver code

class driver;
  mailbox gen_to_drv;          
  virtual intf vif;     
  transaction trans;       

  function new(mailbox gen_to_drv, virtual intf vif);
    this.gen_to_drv = gen_to_drv;
    this.vif = vif;
  endfunction

  task main();
    repeat (5) begin
      gen_to_drv.get(trans);  // Wait for transaction from generator

      vif.up_down  = trans.up_down;
//       vif.rst = tr.rst;1

      trans.display("------- driver-------");
    end
  endtask
endclass
