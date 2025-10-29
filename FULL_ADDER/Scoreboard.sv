// Scoreboard
class scoreboard;

  // Mailbox to receive transactions from monitor
  mailbox mon_to_scb;

  // Constructor to initialize mailbox
  function new(mailbox mon_to_scb);
    this.mon_to_scb = mon_to_scb;
  endfunction

  // Main task to verify outputs
  task main();
    transaction trans;

    repeat (5) begin 
      mon_to_scb.get(trans);  // Receive transaction from monitor

      trans.display("-------Scoreboard-------");  // Display received values

      // Check expected sum and carry using full adder logic
      if ((trans.a ^ trans.b ^ trans.c_in) == trans.sum &&
          ((trans.a & trans.b) | (trans.b & trans.c_in) | (trans.a & trans.c_in)) == trans.c_out)
        $display("--------- PASS---------");
      else
        $display("-------- FAIL-----------");
      $display("--------TRANSACTION DONE--------");
    end
  endtask

endclass
