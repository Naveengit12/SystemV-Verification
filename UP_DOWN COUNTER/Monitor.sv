// monitor code here

class monitor;
  mailbox mon_to_scb;          
  virtual intf vif;    
  transaction trans;      

  function new(mailbox mon_to_scb, virtual intf vif);
    this.mon_to_scb = mon_to_scb;
    this.vif = vif;
  endfunction

  task main();
    repeat(5)begin
      @(negedge vif.clk);
      trans = new();

      trans.rstn   = vif.rstn;
      trans.up_down    = vif.up_down;
      trans.count = vif.count;

      mon_to_scb.put(trans);  // Send to scoreboard
      trans.display("------- Monitor------");
//       $display(vif.count,vif.up);
    end
  endtask
endclass
