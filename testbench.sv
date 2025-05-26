`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module tff_tb_top;
  logic clk;
  
  tff_interface vif(clk);
  
  tff dut(
    .clk(vif.clk),
    .rstn(vif.rstn),
    .t(vif.t),
    .q(vif.q)
  );
  
  initial begin
    uvm_config_db#(virtual tff_interface)::set(null, "uvm_test_top.env.agent.driver", "vif", vif);
    uvm_config_db#(virtual tff_interface)::set(null, "uvm_test_top.env.agent.monitor", "vif", vif);
  end
  
   initial begin
    clk = 0;
    vif.t=1'b1;
    forever #5 clk = ~clk;
  end
  
  initial begin
    vif.rstn = 0; 
    #10 vif.rstn = 1;
    #100 vif.rstn = 0;
  end
  
  initial begin 
    run_test("tff_test");
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,dut);
  end
endmodule
