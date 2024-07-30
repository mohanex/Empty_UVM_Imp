
class alu_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(alu_scoreboard)


    function new(string name ="alu_scoreboard", uvm_component parent);
        
        super.new(name, parent);
        `uvm_info("SCOREBOARD_CLASS", "inside constructor", UVM_HIGH)
        
    endfunction

    function void build_phase(uvm_phase phase);
        
        super.build_phase(phase);
        `uvm_info("SCOREBOARD_CLASS", "build phase", UVM_HIGH)
        
    endfunction

    function void connect_phase(uvm_phase phase);
        
        super.connect_phase(phase);
        `uvm_info("SCOREBOARD_CLASS", "connect phase", UVM_HIGH)

    endfunction

    task run_phase(uvm_phase phase);

        super.run_phase(phase);
        
    endtask //automatic

endclass: alu_scoreboard