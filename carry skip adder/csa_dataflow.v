module csa_dataflow(sum, cout, a, b, cin);
    output [31:0] sum;
    output cout;
    input [31:0] a, b;
    input cin;
    wire [31:0] p, g;
    wire [32:0] c;
    wire [7:0] group_p;
    genvar i, j;

    assign p = a ^ b; // Propagate
    assign g = a & b; // Generate
    assign c[0] = cin; // Initial carry

    generate
            // Ripple carry generation for 4 bits
        for (i = 0; i < 8; i = i + 1) begin : ripple_carry
            for (j = 0; j < 4; j = j + 1) begin : inner_ripple
                assign c[i*4+j+1] = g[i*4+j] | (p[i*4+j] & c[i*4+j]);
            end
        
            // Group Propagation for 4 bits
            assign group_p[i] = &p[i*4 +: 4]; // Check if all bits propagate in the group
        
            // If all propagate in the group are 1, then carry is skipped
            assign c[i*4+4] = group_p[i] ? c[i*4] : g[i*4+3] | (p[i*4+3] & c[i*4+3]);   
        end
    endgenerate

    // Final carry out and sum
    assign sum = p ^ c[31:0];
    assign cout = c[32];

endmodule