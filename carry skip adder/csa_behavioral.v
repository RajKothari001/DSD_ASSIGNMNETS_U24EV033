module csa_behavioral(sum, cout, a, b, cin);
    output reg [31:0]sum;
    output reg cout;
    input [31:0] a, b;
    input cin;
    reg [31:0] p, g;
    reg [32:0] c;
    integer i, j;
    reg [7:0] group_p;

    always @(*) begin
        // Initialize carry array and group propagation
        p = a ^ b;
        g = a & b;
        c[0] = cin;

        for (i = 0; i < 8; i=i+1) begin
            // Ripple carry generation for 4 bits
            for (j = 0; j < 4; j= j+1) begin
                c[i*4+j+1] = g[i*4+j] | (p[i*4+j] & c[i*4+j]);
            end
            // Group Propagation for 4 bits
            group_p[i] = &p[i*4 +: 4]; 

            // If all propagates in the group are 1, then carry is skipped
            if (group_p[i]) begin
                c[i*4+4] = c[i*4]; 
            end else begin
                c[i*4+4] = g[i*4+3] | (p[i*4+3] & c[i*4+3]);
            end
        end

        // Final carry out and sum
        sum = p ^ c[31:0];
        cout = c[32];
    end
endmodule