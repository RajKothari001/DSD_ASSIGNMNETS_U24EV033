module xor_gate(y, a, b);
    input a, b;
    output y;
    assign y = a ^ b;
endmodule

module and_gate(y, a, b);
    input a, b;
    output y;
    assign y = a & b;
endmodule

module or_gate(y, a, b);
    input a, b;
    output y;
    assign y = a | b;
endmodule

module buf(y, a);
    input a;
    output y;
    assign y = a;
endmodule

module rca_structural(sum, cout, a, b, cin);
    input [7:0] a, b;
    input cin;
    output [7:0] sum;
    output cout;
    wire [7:0] carry;
    
    wire [7:0] w1, w2, w3;

    xor_gate x0(w3[0], a[0], b[0]);
    xor_gate x1(sum[0], w3[0], cin);
    and_gate a0(w1[0], a[0], b[0]);
    and_gate a1(w2[0], a[0], cin);
    or_gate c0(carry[0], w1[0], w2[0]);

    generate
        for (genvar i = 1; i < 8; i = i + 1) begin : gen_rca
            xor_gate x_inst(w3[i], a[i], b[i]);
            xor_gate s_inst(sum[i], w3[i], carry[i-1]);
            and_gate a_inst(w1[i], a[i], b[i]);
            and_gate w_inst(w2[i], a[i], carry[i-1]);
            or_gate c_inst(carry[i], w1[i], w2[i]);
        end
    endgenerate

    buf b0(cout, carry[7]); // Final carry output

endmodule