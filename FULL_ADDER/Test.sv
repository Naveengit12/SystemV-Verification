`include "environment.sv"

program test(intf vif);
  environment env;
  initial begin
    env = new(vif);
    env.test_run();
  end
endprogram
