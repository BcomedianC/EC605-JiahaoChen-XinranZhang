module Full_Adder_Test;
    reg A, B, Cin;
    wire S, Cout;
    
    singlebitfulladder uut(.A(A), .B(B), .CI(Cin), .Y(S), .CO(Cout));
    
    initial
    begin
            A = 0;
            B = 0;
            Cin = 0;
    
            #10;
			{A, B, Cin} = 1;
            #10;
			{A, B, Cin} = 2;
            #10;
			{A, B, Cin} = 3;
            #10;
			{A, B, Cin} = 4;
            #10;
			{A, B, Cin} = 5;
            #10;
			{A, B, Cin} = 6;
            #10;
			{A, B, Cin} = 7;
            #10;

            $finish;
    end
endmodule
