module lca_dataflow(sum, cout, a, b, cin);
    input [7:0] a, b;
    input cin;
    output [7:0] sum;
    output cout;
    wire [7:0] p, g, c;

    assign p = a ^ b;
    assign g = a & b;
    assign c[0] = cin;
    assign sum[0] = p[0] ^ cin;
    assign c[7:1] = g[6:0] | (p[7:1] & c[6:0]);
    assign sum[7:1] = p[7:1] ^ c[7:1];
    // genvar i;
    // generate
    //     for (i = 1; i < 8; i = i + 1) begin : lca_adder
    //         assign c[i] = g[i-1] | (p[i-1] & c[i-1]);
    //         assign sum[i] = p[i] ^ c[i];
    //     end
    // endgenerate
    assign cout = g[7] | (p[7] & c[7]);

endmodule