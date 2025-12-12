// class scoreboard data here

class scoreboard;
  transaction trans;
  mailbox mon_to_scb;
  virtual interf vintf;
  localparam int width = 3;
  localparam int addr = 10;
  int count;
  bit full;
  bit empty;
  bit [width-1:0] temp[$];
  bit [width-1:0] chat;
  event shouryanga_parvam;
  
  function new(mailbox mon_to_scb, virtual interf vintf);
    this.mon_to_scb = mon_to_scb;
    this.vintf = vintf;
  endfunction
  
  task main();
    repeat(15) begin
      trans = new();
      mon_to_scb.get(trans);
      $dispaly("========== Scoreboard data===========");
      $display("SD  time=%0t,rstn=%0b,wt_ena=%0b,rd_ena=%0b,data_in=%0d,data_out=%0d,full=%0d,empty=%0d", $time,trans.rstn,trans.wt_ena,trans.rd_ena,trans.data_in,trans.data_out,trans.full,trans.empty);
      if(trans.wt_ena && !empty) begin
        if(temp.size()>0) begin
          chat = temp.pop_front();
          count = count - 1;
        end
        else begin
          chat = 0;
        end
        if(trans.data_out == chat) begin
          $display("**********PASS*************");
        end
        else begin
          $display("**********FAIL**************");
        end
      end
      full = (count == 8);
      empty = (count == 0);
      
      ->shouryanga_parvam;
    end
  endtask
endclass
