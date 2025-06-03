module full_adder_behavioral(sum, cout, a , b, cin);
    input a, b, cin;
    output sum, cout;

    {cout, sum} = a + b + cin;
endmodule
