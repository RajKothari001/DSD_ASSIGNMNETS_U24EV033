`timescale 1ns/1ps
module testbench();
    reg a, b, cin;
    wire sum, cout;

    // Instantiate the full adder module
    full_adder_structural uut (
        .sum(sum),
        .cout(cout),
        .a(a),
        .b(b),
        .cin(cin)
    );

    initial begin
        // Open a VCD file for waveform output
        $dumpfile("full_adder.vcd");
        $dumpvars(0, testbench);

        // Monitor the inputs and outputs
        $monitor($time, " a=%b, b=%b, cin=%b | sum=%b, cout=%b", a, b, cin, sum, cout);

        // Test cases
        a = 0; b = 0; cin = 0; #10; // 0 + 0 + 0 = 00
        a = 0; b = 1; cin = 0; #10; // 0 + 1 + 0 = 01
        a = 1; b = 0; cin = 0; #10; // 1 + 0 + 0 = 01
        a = 1; b = 1; cin = 0; #10; // 1 + 1 + 0 = 10 (sum=0, cout=1)
        a = 0; b = 0; cin = 1; #10; // 0 + 0 + 1 = 01
        a = 0; b = 1; cin = 1; #10; // 0 + 1 + 1 = 10 (sum=0, cout=1)
        a = 1; b = 0; cin = 1; #10; // 1 + 0 + 1 = 10 (sum=0, cout=1)
        a = 1; b = 1; cin = 1; #10; // 1 + 1 + 1 = 11 (sum=1, cout=1)

        // Finish simulation
        $finish;
    end
endmodule