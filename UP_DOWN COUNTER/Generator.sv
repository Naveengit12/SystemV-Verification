// generator code

class generator;
  transaction trans;
  mailbox gen_to_drv;
  event gym;

  // Constructor: pass both mailbox and event from environment
  function new(mailbox gen_to_drv, event gym);
    this.gen_to_drv = gen_to_drv;
    this.gym = gym;
  endfunction

  task main();
    repeat (10) begin
      trans = new();
      trans.randomize();
      trans.display("--------- Generator---------");
      gen_to_drv.put(trans);       //  transaction to driver
      @gym;         // Wait until driver signals completion
    end
  endtask
endclass
