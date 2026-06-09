


module kogge_stone_adder_4bit (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire       Cin,
    output wire [3:0] Sum,
    output wire       Cout
);

    // --------------------------------------------------------
    // Step 1: Generate and Propagate signals
    // --------------------------------------------------------
    wire [3:0] P;
    wire [3:0] G;

    assign P = A ^ B;   // Propagate
    assign G = A & B;   // Generate

    // --------------------------------------------------------
    // Stage 1: Prefix computation with distance 1
    // --------------------------------------------------------
    wire G10, P10;
    wire G21, P21;
    wire G32, P32;

    assign G10 = G[1] | (P[1] & G[0]);
    assign P10 = P[1] & P[0];

    assign G21 = G[2] | (P[2] & G[1]);
    assign P21 = P[2] & P[1];

    assign G32 = G[3] | (P[3] & G[2]);
    assign P32 = P[3] & P[2];

    // --------------------------------------------------------
    // Stage 2: Prefix computation with distance 2
    // --------------------------------------------------------
    wire G20, P20;
    wire G30, P30;

    assign G20 = G21 | (P21 & G[0]);
    assign P20 = P21 & P[0];

    assign G30 = G32 | (P32 & G10);
    assign P30 = P32 & P10;

    // --------------------------------------------------------
    // Carry generation
    // --------------------------------------------------------
    wire C0, C1, C2, C3, C4;

    assign C0 = Cin;

    assign C1 = G[0] | (P[0] & Cin);
    assign C2 = G10  | (P10  & Cin);
    assign C3 = G20  | (P20  & Cin);
    assign C4 = G30  | (P30  & Cin);

    // --------------------------------------------------------
    // Sum generation
    // --------------------------------------------------------
    assign Sum[0] = P[0] ^ C0;
    assign Sum[1] = P[1] ^ C1;
    assign Sum[2] = P[2] ^ C2;
    assign Sum[3] = P[3] ^ C3;

    assign Cout = C4;

endmodule


