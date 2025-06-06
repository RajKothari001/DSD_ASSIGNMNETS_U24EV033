module cla_dataflow(sum, cout, a, b, cin);
    input [7:0] a, b;
    input cin;
    output [7:0] sum;
    output cout;
    wire [7:0] p, g;
  	wire [8:0] c;	

    assign p = a ^ b;
    assign g = a & b;
    assign c[0] = cin;
    assign sum[0] = p[0] ^ cin;
  	assign c[8:1] = g[7:0] | (p[7:0] & c[7:0]);
    assign sum[7:1] = p[7:1] ^ c[7:1];
  	assign cout = c[8];
    // genvar i;
    // generate
    //     for (i = 1; i < 8; i = i + 1) begin : lca_adder
    //         assign c[i] = g[i-1] | (p[i-1] & c[i-1]);
    //         assign sum[i] = p[i] ^ c[i];
    //     end
    // endgenerate
endmodule
