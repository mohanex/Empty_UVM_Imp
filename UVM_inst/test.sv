
class alu_test extends uvm_test:

    `uvm_component_utils(alu_test)

    alu_env env;
    alu_test_sequence test_seq;
    alu_base_sequence reset_seq;

    function new(string name="alu_test", uvm_component parent);
        super.new(name, parent);
        `uvm_info("TEST_CLASS", "inside_constructor", UVM_HIGH)
    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);
        `uvm_info("TEST_CLASS", "build_phase", UVM_HIGH)

        env = alu_env::type_id::create("env",this);

    endfunction: build_phase

    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);
        `uvm_info("TEST_CLASS", "connect_phase", UVM_HIGH)

    endfunction: connect_phase


    task run_phase(uvm_phase phase);

        super.run_phase(phase);
        `uvm_info("TEST_CLASS", "run_phase", UVM_HIGH)

        //Logic
        phase.raise_objection(this);

        //start our sequences

        //reset_sequence
        reset_seq = alu_base_sequence::type_id::create("reset_seq", this);   // 
        reset_seq.start(env.agnt.seqr);   //path to sequencer


        //test_sequence
        test_seq = alu_test_sequence::type_id::create("test_seq", this);
        test_seq.start(env.agnt.seqr);

        phase.drop_objection(this);


    endtask: run_phase


endclass : alu_test