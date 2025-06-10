module carry_skip_adder_32bit_tb;

    reg [31:0] a, b;
    reg cin;
    wire [31:0] sum;
    wire cout;

    csa_behavioral uut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );
    
    initial begin
      $dumpfile("csa32.vcd");
      $dumpvars(0, carry_skip_adder_32bit_tb);
	end

    initial begin
        $display("Time |        A         +        B         + Cin =        Sum        Cout");
        $display("------------------------------------------------------------------------");

        a = 32'h00000000; b = 32'h00000000; cin = 0;
        #10 $display("%4t | %h + %h + %b = %h %b", $time, a, b, cin, sum, cout);

        a = 32'h0000FFFF; b = 32'h00000001; cin = 0;
        #10 $display("%4t | %h + %h + %b = %h %b", $time, a, b, cin, sum, cout);

        a = 32'hAAAAAAAA; b = 32'h55555555; cin = 1;
        #10 $display("%4t | %h + %h + %b = %h %b", $time, a, b, cin, sum, cout);

        a = 32'hFFFFFFFF; b = 32'h00000001; cin = 0;
        #10 $display("%4t | %h + %h + %b = %h %b", $time, a, b, cin, sum, cout);

        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; cin = 1;
        #10 $display("%4t | %h + %h + %b = %h %b", $time, a, b, cin, sum, cout);

        $finish;
    end
endmodule