// Environment
`include "Transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;

  // Component handles
  generator     gen;
  driver        drv;
  monitor       mon;
  scoreboard    scb;

  // Mailboxes for communication
  mailbox gen_to_drv;
  mailbox mon_to_scb;

  // Interface handle
  virtual intf vif;

  // Constructor
  function new(virtual intf vif);
    this.vif = vif;

    // Create mailboxes
    gen_to_drv = new();
    mon_to_scb = new();

    // Instantiate components
    gen = new(gen_to_drv);
    drv = new(vif, gen_to_drv);
    mon = new(vif, mon_to_scb);
    scb = new(mon_to_scb);
  endfunction

  // Run all components in parallel
  task test_run();
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
    join
  endtask
endclass
