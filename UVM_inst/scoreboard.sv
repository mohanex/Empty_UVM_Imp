
class alu_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(alu_scoreboard)

    uvm_analysis_imp #(alu_sequence_item, alu_scoreboard) scoreboard_port;

    alu_sequence_item transactions[$];

    function new(string name ="alu_scoreboard", uvm_component parent);
        
        super.new(name, parent);
        `uvm_info("SCOREBOARD_CLASS", "inside constructor", UVM_HIGH)
        
    endfunction

    function void build_phase(uvm_phase phase);
        
        super.build_phase(phase);
        `uvm_info("SCOREBOARD_CLASS", "build phase", UVM_HIGH)

        scoreboard_port = new("scoreboard_port", this);
        
    endfunction

    function void connect_phase(uvm_phase phase);
        
        super.connect_phase(phase);
        `uvm_info("SCOREBOARD_CLASS", "connect phase", UVM_HIGH)

    endfunction

    function void write(alu_sequence_item item);
        
        transactions.push_back(item);
        
    endfunction




    task run_phase(uvm_phase phase);

        super.run_phase(phase);
        `uvm_info("SCOREBOARD_CLASS", "run phase", UVM_HIGH)

        forever begin
            alu_sequence_item current_transaction;
            wait((transactions.size() != 0));
            current_transaction = transactions.pop_front();
            compare(current_transaction);
            
        end
        
    endtask //automatic

    task  compare(alu_sequence_item current_transaction);
        
        logic [7:0] expected:
        logic [7:0] actual;

        case (current_transaction)
            0: begin 
                expected = current_transaction.a + current_transaction.b;
            end
            1: begin 
                expected = current_transaction.a - current_transaction.b;
            end
            2: begin 
                expected = current_transaction.a * current_transaction.b;
            end
            3: begin 
                expected = current_transaction.a / current_transaction.b;
            end
        endcase

        actual = current_transaction.result;

        if (actual != expected) begin
            `uvm_error("COMPARE", $sformatf("Transaction failed! actual = %d while expected = %d", actual, expected))
        end
        else begin
            `uvm_info("COMPARE", $sformatf("Transaction passed! actual = %d while expected = %d", actual, expected), UVM_LOW)
        end


    endtask //

endclass: alu_scoreboard