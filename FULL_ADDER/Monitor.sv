// Monitor
class monitor;

  virtual intf vif;
  mailbox mon_to_scb;
  transaction trans;

  // Constructor to initialize handles
  function new(virtual intf vif, mailbox mon_to_scb);
    this.vif = vif;
    this.mon_to_scb = mon_to_scb;
  endfunction

  // Main task to monitor DUT outputs and send to scoreboard
  task main();
    repeat (5) begin
      #2; // Wait for outputs to settle
      
      trans = new();
      
      // Sample values from DUT through interface
      trans.a     = vif.a;
      trans.b     = vif.b;
      trans.c_in  = vif.c_in;
      trans.sum   = vif.sum;
      trans.c_out = vif.c_out;
      
      // Send transaction to scoreboard
      mon_to_scb.put(trans);
      
      // Display captured values
      trans.display("--------Monitor class data-------");
      #1;
    end
  endtask
endclass 
