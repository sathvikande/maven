// Code your design here
module seq_vending_machine(
    input clk, rst, i, j,
    output reg x, y
);

reg [1:0] ps, ns;

parameter [1:0] 
    s0 = 2'b00,
    s1 = 2'b01,
    s2 = 2'b10;


// State register
always @(posedge clk)
begin
    if (rst)
        ps <= s0;
    else
        ps <= ns;
end


// Next state and output logic
always @(*)
begin
    ns = ps;
    x = 1'b0;
    y = 1'b0;

    case(ps)

        // =========================
        // s0 : ₹0
        // =========================
        s0: begin

            if (i == 1'b0) begin
                ns = s0;             // 0X = No coin
            end

            else if (i == 1'b1 && j == 1'b0) begin
                ns = s1;             // 10 = ₹1
            end

            else if (i == 1'b1 && j == 1'b1) begin
                ns = s2;             // 11 = ₹2
            end

        end


        // =========================
        // s1 : ₹1
        // =========================
        s1: begin

            if (i == 1'b0) begin
                ns = s1;             // 0X = No coin
            end

            else if (i == 1'b1 && j == 1'b0) begin
                ns = s2;             // ₹1 + ₹1 = ₹2
            end

            else if (i == 1'b1 && j == 1'b1) begin
                ns = s0;             // ₹1 + ₹2 = ₹3
                x = 1'b1;            // Dispense
            end

        end


        // =========================
        // s2 : ₹2
        // =========================
        s2: begin

            if (i == 1'b0) begin
                ns = s2;             // 0X = No coin
            end

            else if (i == 1'b1 && j == 1'b0) begin
                ns = s0;             // ₹2 + ₹1 = ₹3
                x = 1'b1;            // Dispense
            end

            else if (i == 1'b1 && j == 1'b1) begin
                ns = s0;             // ₹2 + ₹2 = ₹4
                x = 1'b1;            // Dispense
                y = 1'b1;            // ₹1 Change
            end

        end


        default: begin
            ns = s0;
        end

    endcase
end

endmodule