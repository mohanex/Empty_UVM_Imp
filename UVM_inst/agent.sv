
class alu_agent extends uvm_agent;
    `uvm_component_utils(alu_agent)

    alu_sequencer seqr;
    alu_monitor mon;
    alu_driver drv;

    function new(string name = "alu_agent", uvm_component parent);
        
        super.new(name, parent);
        `uvm_info("AGENT_CLASS","Inside constructor", UVM_HIGH)

    endfunction //new()

    function void build_phase(uvm_phase phase);
        
        super.build(phase);
        `uvm_info("AGENT_CLASS","build phase", UVM_HIGH)

        seqr = alu_sequencer::type_id::create("seqr", this);
        mon = alu_monitor::type_id::create("mon", this);
        drv = alu_driver::type_id::create("drv", this);

        
    endfunction


    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);
        `uvm_info("AGENT_CLASS","connect phase", UVM_HIGH)

        drv.seq_item_port.connect(seqr.seq_item_export);
        
        
    endfunction


    task run_phase(uvm_phase phase);

        super.run_phase(phase);
        
    endtask
endclass : alu_agent