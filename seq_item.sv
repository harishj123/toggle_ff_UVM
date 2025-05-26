//class declaration
class tff_seq_item extends uvm_sequence_item;
  //factory registration
  `uvm_object_utils(tff_seq_item)
  //initializing inputs
  rand bit rstn;
  rand bit t;
  bit q;
  
  //constructor
  function new(string name = "tff_seq_item");
    super.new(name);
    `uvm_info("tff_seq_item","constructor",UVM_NONE)
  endfunction
endclass
