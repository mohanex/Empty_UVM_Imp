
class alu_monitor extends uvm_monitor;
    `uvm_component_utils(alu_monitor)
    virtual alu_interface vif;
    alu_sequence_item item;

    //Monitor and scoreboard doesnt have by default the port export ports, thus we need to create them

    uvm_analysis_port #(alu_sequence_item) monitor_port;


    function new(string name = "alu_monitor", uvm_component parent);
        
        super.new(name, parent);
        `uvm_info("MONITOR_CLASS","Inside constructor", UVM_HIGH)

    endfunction //new()

    function void build_phase(uvm_phase phase);
        
        super.build(phase);
        `uvm_info("MONITOR_CLASS","build phase", UVM_HIGH)

        monitor_port = new("monitor_port", this);

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
        `uvm_info("MONITOR_CLASS","run phase", UVM_HIGH)
        forever begin
            item = alu_sequence_item::type_id::create("item",this);
            
            wait(!vif.reset);
            //sample inputs
            @(posedge vif.clock);
                item.a = vif.a;
                item.b = vif.b;
                item.op_code = vif.op_code;
            //sample outputs
            @(posedge vif.clock);   // in the specs the DUT gives result after one cycle so we nee to wait for another posedge !!!!!!!!<<This is pure specs for this ALU>>!!!!!!!!
                item.carry_out = vif.carry_out;
                item.result = vif.result;

            //send items to the scoreboard
            monitor_port.write(item);


        end
        
    endtask

endclass : alu_monitor