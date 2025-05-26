//class declaration
class tff_env extends uvm_env;
  //factory registration
  `uvm_component_utils(tff_env)

  tff_agent agent;
  tff_scoreboard sc;

  //constructor
  function new(string name = "tff_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info("tff_env","constructor",UVM_NONE)
  endfunction: new

  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = tff_agent::type_id::create("agent", this);
    sc = tff_scoreboard::type_id::create("sc", this);
  endfunction: build_phase

  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.monitor.monitor_analysis_port.connect(sc.item_collected_export);
  endfunction: connect_phase
endclass
