// scoreboard code here

class scoreboard;

  mailbox mon_to_scb;        
  transaction trans;    
  bit [3:0] count;  
  event gym;     

  function new(mailbox mon_to_scb, event gym);
    this.mon_to_scb = mon_to_scb;
    this.gym = gym;
    count = 0;  // Initialize expected count
  endfunction

  task main();
    repeat (10) begin
      mon_to_scb.get(trans);
      trans.display("----------- scoreboard--------");

      if (trans.rstn)
        count = 0;
      else begin 
        if (trans.up_down)
        count = count + 1;
      else
        count = count - 1;
        
      end

      if (count == trans.count)
        $display("------------ PASS -------------");
      else
        $display("----------- FAIL ----------",trans.count);
      $display("--------TRANSACTION DONE--------");

      ->gym; 
    end
  endtask
endclass
