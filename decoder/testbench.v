`timescale 1ns/1ps
module testbench();
    reg [1:0] a;
  	reg enable;
    wire [3:0] y;

  decoder_behavioral dut(.a(a), .y(y), .enable(enable));

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, testbench);

        $monitor($time, "a = %b | y = %b", a, y);

        enable = 1;
        a = 2'b00; #10;

        a = 2'b00; #10;
        a = 2'b01; #10;
        a = 2'b10; #10;
        a = 2'b11; #10;

        enable = 0; #10;

        $finish;
    end
endmodule