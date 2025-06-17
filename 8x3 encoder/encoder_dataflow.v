module encoder_dataflow(
    output [2:0] y,
    input [7:0] a,
    input enable
);
    
    assign y =  (enable == 0) ? 3'b000 :
                (a[0] == 1 && enable == 1)   ? 3'b000 :
                (a[1] == 1 && enable == 1)   ? 3'b001 :
                (a[2] == 1 && enable == 1)   ? 3'b010 :
                (a[3] == 1 && enable == 1)   ? 3'b011 :
                (a[4] == 1 && enable == 1)   ? 3'b100 :
                (a[5] == 1 && enable == 1)   ? 3'b101 :
                (a[6] == 1 && enable == 1)   ? 3'b110 :
                (a[7] == 1 && enable == 1)   ? 3'b111 : 3'b000;

endmodule