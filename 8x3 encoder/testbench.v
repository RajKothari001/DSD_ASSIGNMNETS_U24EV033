module testbench();
    wire [2:0] y;
    reg [7:0] a;
    reg enable;

    encoder_behavioral dut(.y(y), .a(a), .enable(enable));

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, testbench);

        $monitor($time, "a = %b, enable = %b | y = %b", a, enable, y);

            enable = 1;

            a = 8'b00000001; #10;
            a = 8'b00000010; #10;
            a = 8'b00000100; #10;
            a = 8'b00001000; #10;
            a = 8'b00010000; #10;
            a = 8'b00100000; #10;
            a = 8'b01000000; #10;
            a = 8'b10000000; #10;

            enable = 0;
            a = 8'b00000001; #10;

        $finish;
    end

endmodule