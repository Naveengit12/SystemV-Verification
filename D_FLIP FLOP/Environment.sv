//include all lower class

`include "Transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator  gen;
  driver     drv;
  monitor    mon;
  scoreboard scb;
  event main_event;
  
//   Mailboxes for communication
  mailbox gen_to_drv;
  mailbox mon_to_scb;
  
//   interface handle
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif = vif;
    
//     mailboxes 
     gen_to_drv = new();
     mon_to_scb = new();
    
//     Instantiate components
    gen = new(gen_to_drv);
    drv = new(vif,gen_to_drv);
    mon = new(vif,mon_to_scb);
    scb = new(mon_to_scb);
    gen.e = main_event;
    scb.e = main_event;
  endfunction
  
  task test_run();
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
    join
  endtask
endclass 
