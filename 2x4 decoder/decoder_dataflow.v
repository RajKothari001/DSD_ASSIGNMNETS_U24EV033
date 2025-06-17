module decoder_dataflow (
    output [3:0]y,
  input [1:0]a,
  input enable
);
  
  assign y = enable ? (4'b0001 << a) : 4'b0000;
    
endmodule