
class alu_env extends uvm_env;
    `uvm_component_utils(alu_env)

    alu_agent agnt;
    alu_scoreboard scoreboard;


    function new(string name ="alu_env", uvm_component parent);
        
        super.new(name, parent);
        `uvm_info("ENV_CLASS", "inside constructor", UVM_HIGH)
        
    endfunction

    function void build_phase(uvm_phase phase);
        
        super.build_phase(phase);
        `uvm_info("ENV_CLASS", "build phase", UVM_HIGH)

        agnt = alu_agent::type_id::create("agnt", this);
        scoreboard = alu_scoreboard::type_id::create("scoreboard", this);
        
    endfunction

    function void connect_phase(uvm_phase phase);
        
        super.connect_phase(phase);
        `uvm_info("ENV_CLASS", "connect phase", UVM_HIGH)

    endfunction

    task run_phase(uvm_phase phase);

        super.run_phase(phase);
        
    endtask //automatic

endclass: alu_env