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

module buf_gate(y, a);
  	input a;
  	output y;
  	assign y = a;
endmodule

module rca_structural(sum, cout, a, b, cin);
    input [7:0] a, b;
    input cin;
    output [7:0] sum;
    output cout;
    wire [8:0] carry;
    
    wire [7:0] w1, w2, w3;

    buf_gate b0(carry[0], cin); // Initial carry input

    generate
        for (genvar i = 0; i < 8; i = i + 1) begin : gen_rca
            xor_gate x_inst(w3[i], a[i], b[i]);
            xor_gate s_inst(sum[i], w3[i], carry[i]);
            and_gate a_inst(w1[i], a[i], b[i]);
            and_gate w_inst(w2[i], w3[i], carry[i]);
            or_gate c_inst(carry[i+1], w1[i], w2[i]);
        end
    endgenerate

    buf_gate b1(cout, carry[8]); // Final carry output

endmodule
