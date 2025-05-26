//class declaration
class tff_sequencer extends uvm_sequencer #(tff_seq_item);
  //factory registration
  `uvm_component_utils(tff_sequencer)
   //handle
  tff_seq seq;
  
  //constructor
  function new(string name = "tff_sequencer", uvm_component parent);
    super.new(name, parent);
    `uvm_info("tff_sequencer","constructor",UVM_NONE)
  endfunction:new
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq = tff_seq::type_id::create("tff_seq");
  endfunction
endclass

