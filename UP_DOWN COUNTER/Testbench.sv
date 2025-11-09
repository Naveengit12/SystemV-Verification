// Code your testbench here

`include "interface.sv"
`include "test.sv"

module testbench;

  intf vif();

  // Instantiate the DUT
  up_down_counter dut (
    .clk   (vif.clk),
    .rstn   (vif.rstn),
    .up_down    (vif.up_down),
    .count (vif.count)
  );

  // Instantiate the test program
  test t1(vif);

  // Clock generation
  initial begin 
    vif.clk = 1;
    vif.rstn=1;
    #4;
    vif.rstn = 0;
//     vif.up_down=0;
  end
  always #2 vif.clk = ~vif.clk; // 4 time unit period
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars();
    #100;
    $finish;
  end
endmodule
