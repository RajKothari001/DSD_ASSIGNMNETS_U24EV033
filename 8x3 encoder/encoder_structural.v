module and_gate(y, enable, a);
    output y;
    input enable, a;
    assign y = enable & a;
endmodule

module or_gate(y, a, b, c, d);
    output y;
    input a, b, c, d;
    assign y = a | b | c | d;
endmodule

module encoder_structural(
    output [2:0] y,
    input [7:0] a,
    input enable
);

    wire y2_temp, y1_temp, y0_temp;
    
    or_gate o2(y2_temp, a[4], a[5], a[6], a[7]);
    and_gate a2(y[2], enable, y2_temp);

    or_gate o1(y1_temp, a[2], a[3], a[6], a[7]);
    and_gate a1(y[1], enable, y1_temp);

    or_gate o0(y0_temp, a[1], a[3], a[5], a[7]);
    and_gate a0(y[0], enable, y0_temp);

endmodule