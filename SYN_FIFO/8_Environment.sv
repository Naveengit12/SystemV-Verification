// class environment data here

`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"

class environment;
  virtual interf vintf;
  event shouryanga_parvam;
  
  generator gt;
  driver dv;
  monitor mt;
  scoreboard sd;
  
  mailbox gen_to_drv;
  mailbox mon_to_scb;
  
  function new(virtual interf vintf);
    gen_to_drv = new();
    mon_to_scb = new();
    this.vintf = vintf;
    
    gt = new(gen_to_drv, vintf);
    dv = new(gen_to_drv, vintf);
    mt = new(mon_to_scb, vintf);
    sd = new(mon_to_scb, vintf);
    
    gt.shouryanga_parvam = this.shouryanga_parvam;
    sd.shouryanga_parvam = this.shouryanga_parvam;
  endfunction
  
  task main();
    fork
      gt.main();
      dv.main();
      mt.main();
      sd.main();
    join
  endtask
endclass
    
