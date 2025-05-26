//class declaration
class tff_agent extends uvm_agent;
  //factory registration
  `uvm_component_utils(tff_agent)
   //handle
  tff_driver driver;
  tff_monitor monitor;
  tff_sequencer sequencer;

  //constructor
  function new(string name = "tff_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("tff_agent","constructor",UVM_NONE)
  endfunction

  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (get_is_active() == UVM_ACTIVE) begin
      driver = tff_driver::type_id::create("driver", this);
      sequencer = tff_sequencer::type_id::create("sequencer", this);
    end
    monitor = tff_monitor::type_id::create("monitor", this);
  endfunction

  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (get_is_active()) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction
endclass
