module full_adder_structural(sum, cout, a, b, cin);
    input a, b, cin;
    output sum, cout;

    wire w1, w2, w3, w4, w5;

    xor_gate xor1(w1, a, b);
    xor_gate xor2(sum, w1, cin);

    and_gate and1(w2, a, b);    
    and_gate and2(w3, b, cin);
    and_gate and3(w4, a, cin);

    or_gate or1(w5, w2, w3);
    or_gate or1(cout, w5, w4);
endmodule

module xor_gate(output out, input a, b);
    assign out = a ^ b;
endmodule

module and_gate(output out, input a, b);
    assign out = a & b;
endmodule

module or_gate(output out, input a, b);
    assign out = a | b;
endmodule 