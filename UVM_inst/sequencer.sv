
class alu_sequencer extends uvm_sequence#(alu_sequence_item);
    `uvm_object_utils(alu_sequencer);


    //  Constructor: new
    function new(string name = "alu_sequencer", uvm_component parent);
        
        super.new(name,parent);
        `uvm_info("SEQ_CLASS","Inside constructor", UVM_HIGH)

    endfunction: new



    function void build_phase(uvm_phase phase);
        
        super.build_phase(phase);
        `uvm_info("SEQ_CLASS","Build phase", UVM_HIGH)
        
    endfunction


    function void connect_phase(uvm_phase phhase);

        super.connect_phase(phase);
        ``uvm_info("SEQ_CLASS", "connect phase", UVM_HIGH)
        
    endfunction
    
endclass: alu_sequencer