
class alu_test extends uvm_test:

    `uvm_component_utils(alu_test)

    function new(string name="alu_test", uvm_component parent);
        super.new(name, parent);
        `uvm_info("TEST_CLASS", "inside_constructor", UVM_HIGH)
    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);
        `uvm_info("TEST_CLASS", "build_phase", UVM_HIGH)

    endfunction: build_phase

    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);
        `uvm_info("TEST_CLASS", "connect_phase", UVM_HIGH)

    endfunction: connect_phase


    task run_phase(uvm_phase phase);

        super.run_phase(phase);
        `uvm_info("TEST_CLASS", "run_phase", UVM_HIGH)

        //Logic


    endtask: run_phase


endclass : alu_test