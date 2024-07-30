
class alu_driver extends uvm_driver#(alu_sequence_item);
    `uvm_component_utils(alu_driver)

    virtual alu_interface vif;
    alu_sequence_item item;

    function new(string name = "alu_driver", uvm_component parent);
        
        super.new(name, parent);
        `uvm_info("DRIVER_CLASS","Inside constructor", UVM_HIGH)

    endfunction //new()

    function void build_phase(uvm_phase phase);
        
        super.build(phase);
        `uvm_info("DRIVER_CLASS","build phase", UVM_HIGH)
        
        if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif))) begin // Getting the alu_interface database 
            `uvm_error("DRIVER_CLASS", "Failed to get VIF from config DB!")
        end

        
    endfunction


    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);
        `uvm_info("DRIVER_CLASS","connect phase", UVM_HIGH)
        
    endfunction


    task run_phase(uvm_phase phase);

        super.run_phase(phase);
        `uvm_info("DRIVER_CLASS","run phase", UVM_HIGH)

        forever begin
            item = alu_sequence_item::type_id::create("item",this);
            seq_item_port.get_next_item(item);
            drive(item);
            seq_item_port.item_done();
        end
        
    endtask

    task drive(alu_sequence_item item);

        @(posedge vif.clock);
            vif.reset <= item.reset;
            vif.a <= item.a;
            vif.b <= item.b;
            vif.op_code <= item.op_code;
        
    endtask : drive
endclass : alu_driver