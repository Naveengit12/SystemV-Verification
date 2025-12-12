// class driver data here

class driver;
  transaction trans;
  mailbox gen_to_drv;
  virtual interf vintf;
  
  function new(mailbox gen_to_drv, virtual interf vintf);
    this.gen_to_drv = gen_to_drv;
    this.vintf = vintf;
  endfunction
  
  task main();
    repeat(15) begin
      trans = new();
      gen_to_drv.get(trans);
      @(posedge vintf.clk) begin
        vintf.wt_ena = trans.wt_ena;
        vintf.rd_ena = trans.rd_ena;
        vintf.data_in = trans.data_in;
        $dispaly("==============Driver data=========");
        $display("DV time=%0t,rstn=%0b,wt_ena=%0b,rd_ena=%0b,data_in=%0d,data_out=%0d,full=%0d,empty=%0d", $time,vintf.rstn,trans.wt_ena,trans.rd_ena,trans.data_in,trans.data_out,trans.full,trans.empty);
      end
    end
  endtask
endclass
