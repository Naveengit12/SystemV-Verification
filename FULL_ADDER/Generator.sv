// Generator
class generator;

  // Declare a  handles
  transaction trans;
  mailbox gen_to_drv;

  // Constructor for connects mailbox
  function new(mailbox gen_to_drv);
    this.gen_to_drv = gen_to_drv;
  endfunction

  task main();
    repeat (5) begin
      trans = new();                 
      trans.randomize();            
      trans.display("-------- Generator class data------"); 
      gen_to_drv.put(trans);        // Send to driver
      #3;
    end
  endtask
endclass
