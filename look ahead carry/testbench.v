`timescale 1ns/1ps
module testbench;
    reg [7:0] a, b;
    reg cin;
    wire [7:0] sum;
    wire cout;

    rca_behavioral uut(.sum(sum), .a(a), .b(b), .cin(cin), .cout(cout));

    initial begin
        dumpfile("testbench.vcd");
        dumpvars(0, testbench);
        // Initialize inputs
        a = 8'b00000000;
        b = 8'b00000000;
        cin = 0;

        // Apply test vectors
        #10 a = 8'b00001111; b = 8'b00000001; cin = 0; // Test case 1
        #10 a = 8'b11111111; b = 8'b00000001; cin = 0; // Test case 2
        #10 a = 8'b10101010; b = 8'b01010101; cin = 1; // Test case 3
        #10 a = 8'b11111111; b = 8'b11111111; cin = 1; // Test case 4
        #10 a = 8'b00000000; b = 8'b00000000; cin = 0; // Test case 5
        #10 a = 8'b00000001; b = 8'b00000001; cin = 0; // Test case 6
        #10 a = 8'b00000010; b = 8'b00000010; cin = 1; // Test case 7
        #10 a = 8'b11111110; b = 8'b00000001; cin = 0; // Test case 8
        
        // Finish simulation
        #10 $finish;
    end
endmodule