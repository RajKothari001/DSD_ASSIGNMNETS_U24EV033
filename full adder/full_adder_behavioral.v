module full_adder_behavioral(sum, cout, a , b, cin);
    input a, b, cin;
    output sum, cout;

    always @(*) begin
        {cout, sum} = a + b + cin;
    end
endmodule
