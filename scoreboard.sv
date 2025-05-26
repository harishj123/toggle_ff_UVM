//class declaration
class tff_scoreboard extends uvm_scoreboard;
  //factory registration
  `uvm_component_utils(tff_scoreboard);

  uvm_analysis_imp #(tff_seq_item, tff_scoreboard) item_collected_export;

  //constructor
  function new(string name = "tff_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("score board class","constructor",UVM_NONE)
  endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export", this);
  endfunction

  //write function
  virtual function void write(tff_seq_item out);
    if(out.rstn!==1) begin
      if(out.q!==0) begin
        $error("Test Failed Time=%0t |  rstn=%0b t=%0b q=%0b", $time,  out.rstn, out.t, out.q);
      end
      else begin
        $display("Test Passed Time=%0t |  rstn=%0b t=%0b q=%0b", $time, out.rstn, out.t, out.q);
      end
    end
    else begin
      if(out.t!==1 && out.q == out.t) begin 
        $display("Test Passed Time=%0t |  rstn=%0b t=%0b q=%0b", $time, out.rstn, out.t, out.q);
      end
      else if(out.t==1 && out.q != out.t) begin
        $display("Test Passed Time=%0t | rstn=%0b t=%0b q=%0b", $time, out.rstn, out.t, out.q);
      end
      else begin
        $error("Test Failed Time=%0t | rstn=%0b t=%0b q=%0b", $time, out.rstn, out.t, out.q);
      end
    end
  endfunction
endclass
