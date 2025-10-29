// Driver
class driver;

  //  virtual interface and mailbox
  virtual intf vif;
  mailbox gen_to_drv;
  transaction trans;

  // Constructor
  function new(virtual intf vif, mailbox gen_to_drv);
    this.vif = vif;
    this.gen_to_drv = gen_to_drv;
  endfunction

  task main();
    repeat (5) begin
      #1;
      trans =new();
      gen_to_drv.get(trans);        // Receive transaction from generator
      vif.a = trans.a;             // Drive input signals
      vif.b = trans.b;
      vif.c_in = trans.c_in;                        
      trans.display("----- Driver class data------ ");
      #2;// Display the transaction
    end
  endtask

endclass
