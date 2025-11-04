// driver class
class driver;
  virtual intf vif;
  mailbox gen_to_drv;
  transaction trans;
  
  function new(virtual intf vif, mailbox gen_to_drv);
    this.vif = vif;
    this.gen_to_drv = gen_to_drv;
  endfunction
  
  task main();
    repeat(4)
      begin
        #1;
        gen_to_drv.get(trans);
        vif.d = trans.d;
//         vif.q_out = this.q_out;
//         vif.rstn = trans.rstn;
        trans.display("driver class data");
      end
  endtask
endclass
         
