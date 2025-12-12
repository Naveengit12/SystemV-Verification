// class monitor data here

class monitor;
  transaction trans;
  mailbox mon_to_scb;
  virtual interf vintf;
  
  function new(mailbox mon_to_scb, virtual interf vintf);
    this.mon_to_scb = mon_to_scb;
    this.vintf = vintf;
  endfunction
  
  task main();
    repeat(15) begin
      trans = new();
      @(posedge vintf.clk) begin
        trans.rd_ena = vintf.rd_ena;
        trans.wt_ena = vintf.wt_ena;
        trans.data_in = vintf.data_in;
        #2;
        trans.data_out = vintf.data_out;
        trans.full = vintf.full;
        trans.empty = vintf.empty;
        $dispaly("=========Monitor data=========");
        $display("MT time=%0t,rstn=%0b,wt_ena=%0b,rd_ena=%0b,data_in=%0d,data_out=%0d,full=%0d,empty=%0d", $time,trans.rstn,trans.wt_ena,trans.rd_ena,trans.data_in,trans.data_out,trans.full,trans.empty);
        mon_to_scb.put(trans);
      end
    end
  endtask
endclass
