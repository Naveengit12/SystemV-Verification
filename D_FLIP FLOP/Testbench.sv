

`include "interface.sv"
`include "test.sv"

module testbench;
  logic clk,rstn;
  intf vif(clk,rstn);

  dff dut(.d(vif.d), .clk(clk), .rstn(rstn), .q(vif.q),
          .q_(vif.q_));

  test t1(vif);

  initial begin
    clk = 0;
    vif.d = 0;
    rstn = 0;  // Start with known reset value
  end

  always #1 clk = ~clk; //vif.clk = ~vif.clk;  

  initial begin
    $dumpfile(".vcd");
    $dumpvars();
    #100;
    $finish;
  end
endmodule
