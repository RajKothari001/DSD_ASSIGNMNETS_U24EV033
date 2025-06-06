module lca_behavioral(sum, cout, a, b, cin);
    input [7:0] a, b;
    input cin;
    output reg [7:0] sum;
    output reg cout;
    reg [7:0] p, g, c;
    
    integer i;    

    always @(*) begin: lca_adder
    c[0] = cin;
    p = a ^ b;
    g = a & b;
    sum[0] = p[0] ^ cin;
        for (i = 1; i < 8; i = i + 1) begin
            c[i] = g[i-1] | (p[i-1] & c[i-1]);
            sum[i] = p[i] ^ c[i];
        end
    cout = g[7] | (p[7] & c[7]);
    end

endmodule 