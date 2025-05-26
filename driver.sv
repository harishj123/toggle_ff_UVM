//class declaration
class tff_driver extends uvm_driver #(tff_seq_item);
  // Factory registration
  `uvm_component_utils(tff_driver)

  virtual tff_interface vif;
  tff_seq_item seq_item;
  
  // Constructor
  function new(string name = "tff_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info("tff_driver", "constructor", UVM_NONE)
  endfunction

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(virtual tff_interface)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NO_VIF", "Virtual interface not found")
    end
  endfunction

  // Run phase
  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(seq_item);
      drive();
      seq_item_port.item_done();
    end
  endtask : run_phase

  // Drive task
  task drive();
    @(posedge vif.clk);
    //vif.rst = seq_item.rst; 
    vif.t = seq_item.t;
    //vif.s = seq_item.s;
  endtask
endclass
