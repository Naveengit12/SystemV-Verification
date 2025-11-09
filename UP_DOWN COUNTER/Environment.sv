// include all lower class

`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  event gym_freak;

  mailbox gen_to_drv;
  mailbox mon_to_scb;

  virtual intf vif;

  function new(virtual intf vif);
    this.vif = vif;

    gen_to_drv = new();
    mon_to_scb = new();


    gen = new(gen_to_drv, gym_freak);
    drv = new(gen_to_drv, vif);
    mon = new(mon_to_scb, vif); 
    scb = new(mon_to_scb, gym_freak);
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
