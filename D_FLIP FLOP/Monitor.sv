// monitor class
class monitor;
  virtual intf vif;
  mailbox mon_to_scb;
  transaction trans;
  
  
  function new(virtual intf vif, mailbox mon_to_scb);
    this.vif = vif;
    this.mon_to_scb = mon_to_scb;
  endfunction
  
  task main();
    repeat(4)
      begin
        #1;
//    transaction trans;
        trans = new();
         trans.d = vif.d;
//         trnas.clk = vif.clk;
        trans.rstn = vif.rstn;
        trans.q = vif.q;
        trans.q_ = vif.q_;
        mon_to_scb.put(trans);
        trans.display("monitor class data");
//         #1;
      end
  endtask
endclass
