// test class data here

`include "Environment.sv"
program test(interf inff);
  environment env;
  
  initial begin
    env = new(inff);
    env.main();
  end
endprogram
