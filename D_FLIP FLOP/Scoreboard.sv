// scoreboard class
class scoreboard;
  mailbox mon_to_scb;
  event e;
  
  function new(mailbox mon_to_scb);
    this.mon_to_scb = mon_to_scb;
  endfunction
  
  task main();
    transaction trans;
    repeat(4)
      begin
        mon_to_scb.get(trans);
        trans.display("scoreboard class data");
        if ((trans.rstn && (trans.q == 0) && (trans.q_ == 1)) ||
            (!trans.rstn && (trans.q == trans.d) && (trans.q_ == ~trans.q))) 
        $display("----------PASS-----------");
        else
          $display("--------FAIL-----------");
        $display("----------TRANSACTION DONE-----------");
        -> e; // Trigger event or notify waiting processes immediately
      end
  endtask
endclass
