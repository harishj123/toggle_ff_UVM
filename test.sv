//class declaration
class tff_test extends uvm_test;
  // Factory registration
  `uvm_component_utils(tff_test)

  tff_env env;
  tff_seq seq;

  // Constructor
  function new(string name = "tff_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("tff_base_test", "constructor", UVM_NONE)
  endfunction : new

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = tff_env::type_id::create("env", this);
    seq = tff_seq::type_id::create("seq", this);
  endfunction : build_phase

  // Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction : connect_phase

  // Run phase
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.start(env.agent.sequencer);
    phase.drop_objection(this);
  endtask : run_phase
endclass
