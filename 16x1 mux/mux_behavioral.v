module mux_behavioral(
    output reg out,
    input [3:0] sel,
    input [15:0] in
);

    always @(*) begin
        out = in[sel];
    end

endmodule