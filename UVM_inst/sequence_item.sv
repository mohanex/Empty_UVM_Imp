
class alu_sequence_item extends uvm_sequence_item;

    `uvm_object_utils(alu_sequence_item)

    //Signals
    rand logic reset;

    rand logic [7:0] a, b;
    rand logic [3:0] op_code;
    
    logic [7:0] result;
    bit carry_out;


    //---------------------------------------------------
    // ALU Constraints
    //---------------------------------------------------
    contraint input1_c {a inside {[10:20]};}
    contraint input2_c {b inside {[1:10]};}
    contraint op_code_c {op_code inside {0,1,2,3};}



    function new(string name ="alu_sequence_item");
        
        super.new(name);
        
    endfunction


endclass : alu_sequence_item