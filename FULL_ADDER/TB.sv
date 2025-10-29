
` include "interface.sv"
` include "test.sv"

module testbench;
  intf vif();
  test t1(vif);
  
  full_adder FA(.a(vif.a),
                .b(vif.b),
                .c_in(vif.c_in),
                .sum(vif.sum),
                .c_out(vif.c_out));
  
  
  initial begin
  $dumpfile(".vcd");
  $dumpvars();
  #100;
  end
endmodule
