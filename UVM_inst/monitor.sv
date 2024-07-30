
class alu_monitor extends uvm_monitor;
    `uvm_component_utils(alu_monitor)
    virtual alu_interface vif;

    function new(string name = "alu_monitor", uvm_component parent);
        
        super.new(name, parent);
        `uvm_info("MONITOR_CLASS","Inside constructor", UVM_HIGH)

    endfunction //new()

    function void build_phase(uvm_phase phase);
        
        super.build(phase);
        `uvm_info("MONITOR_CLASS","build phase", UVM_HIGH)

        if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif))) begin // Getting the alu_interface database 
            `uvm_error("MONITOR_CLASS", "Failed to get VIF from config DB!")
        end
        
    endfunction


    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);
        `uvm_info("MONITOR_CLASS","connect phase", UVM_HIGH)
        
    endfunction


    task run_phase(uvm_phase phase);

        super.run_phase(phase);
        
    endtask

    task drive()
        @(posedge vif.clock);
            
    endtask
endclass : alu_monitor