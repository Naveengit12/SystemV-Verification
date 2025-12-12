//  class generator data here

`include "Transaction.sv"

class generator;
  transaction trans;
  mailbox gen_to_drv;
  virtual interf vintf;
  event shouryanga_parvam;
  int count = 0;
  
  function new(mailbox gen_to_drv, virtual interf vintf);
    this.gen_to_drv = gen_to_drv;
    this.vintf = vintf;
  endfunction
  
  task main();
    repeat(15) begin
      trans = new();
      trans.data(count);
      void'(trans.randomize());
      $display("===========Generator data===========");
      $display("GEN time=%0t,rstn=%0b,wt_ena=%0b,rd_ena=%0b,data_in=%0d,data_out=%0d,full=%0d,empty=%0d", $time,vintf.rstn,trans.wt_ena,trans.rd_ena,trans.data_in,trans.data_out,trans.full,trans.empty);
      gen_to_drv.put(trans);
      @shouryanga_parvam;
      count++;
    end
  endtask
endclass
