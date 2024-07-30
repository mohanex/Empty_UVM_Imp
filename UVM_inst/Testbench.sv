// this is the top tesbench UVM file

`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module top;

    logic clock;

    alu_interface intf(.clock(clock));    // here the first clock is the name of the variable the second is the actual logic clock

    alu dut(                              // here we interconnect all the signals of instantiated interface with signals in the dut
        .clock(intf.clock),
        .reset(intf.reset),
        .A(intf.a),
        .B(intf.b),
        .ALU_Sel(intf.op_code),
        .ALU_Out(intf.result),
        .CarryOut(intf.carry_out)
    );

    //---------------------------------------------------
    // Interface Setting
    //---------------------------------------------------
    initial begin
        uvm_config_db #(virtual alu_interface)::set(null, "*", "vif", intf)
    end

    //---------------------------------------------------
    //Start the test
    //---------------------------------------------------
    initial begin
        run_test();
    end

    //---------------------------------------------------
    // Generate clock
    //---------------------------------------------------
    initial begin
        clock = 0;
        #5;
        forever begin
            clock = ~clock;
            #2;
        end
    end

    //---------------------------------------------------
    //Finish simulation
    //---------------------------------------------------
    initial begin
        #5000;                          //wait for 500ns
        $display("5000 ns cap");        //print text
        $finish();                      //stops simulation
    end

endmodule: top