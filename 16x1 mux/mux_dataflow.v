module mux_dataflow(
    output out,
    input [3:0] sel,
    input [15:0] in
);

    assign out =    (sel == 4'd0) ? in[0] :
                    (sel == 4'd1) ? in[1] :
                    (sel == 4'd2) ? in[2] :
                    (sel == 4'd3) ? in[3] :
                    (sel == 4'd4) ? in[4] :
                    (sel == 4'd5) ? in[5] :
                    (sel == 4'd6) ? in[6] :
                    (sel == 4'd7) ? in[7] :
                    (sel == 4'd8) ? in[8] :
                    (sel == 4'd9) ? in[9] :
                    (sel == 4'd10) ? in[10] :
                    (sel == 4'd11) ? in[11] :
                    (sel == 4'd12) ? in[12] :
                    (sel == 4'd13) ? in[13] :
                    (sel == 4'd14) ? in[14] : in[15] ;

endmodule