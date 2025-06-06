module rca_dataflow(sum, cout, a, b, cin);
    input [7:0] a, b;
    input cin;
    output [7:0] sum;
    output cout;
    wire [7:0] carry;

    assign sum[0] = a[0] ^ b[0] ^ cin;
    assign carry[0] = (a[0] & b[0]) | (b[0] & cin) | (a[0] & cin);
    generate
    for (genvar i = 1; i < 8; i = i + 1) begin
        assign sum[i] = a[i] ^ b[i] ^ carry[i-1];
        assign carry[i] = (a[i] & b[i]) | (b[i] & carry[i-1]) | (a[i] & carry[i-1]);
    end
    endgenerate
    assign cout = carry[7];
    
endmodule