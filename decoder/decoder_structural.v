module not_gate(output y, input a);
    assign y = ~a;
endmodule

module and_gate(output y, input enable, input a, input b);
    assign y = enable & a & b;
endmodule

module decoder_structural (
    output [3:0]y,
    input [1:0]a,
    input enable
);

    wire na0, na1;

    not_gate n1(na0, a[0]);
    not_gate n2(na1, a[1]);

    and_gate a0(y[0], enable, na0, na1);
    and_gate a1(y[1], enable, na1, a[0]);
    and_gate a2(y[2], enable, a[1], na0);
    and_gate a3(y[3], enable, a[1], a[0]);


endmodule