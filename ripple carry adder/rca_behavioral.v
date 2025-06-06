module rca_behavioral(sum, cout, a, b, cin);
    input [7:0] a, b;
    input cin;
    output reg [7:0] sum;
    output reg cout;

    always @(*) begin
        {cout, sum} = a + b + cin; // Behavioral description of ripple carry adder
    end
endmodule