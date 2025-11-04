// generator
class generator;
  transaction trans;
  mailbox gen_to_drv;
  event e;     // Create an event handle
  
  function new(mailbox gen_to_drv);
    this.gen_to_drv = gen_to_drv;
  endfunction
  
  task main();
    repeat(4)
      begin
        trans = new();   // creating object for transaction class
        trans.randomize();
        trans.display("generator class data");
        gen_to_drv.put(trans);  // put the data into mailbox via transaction
        @(e); // Wait for event or Suspend until event occurs
      end
  endtask
endclass
