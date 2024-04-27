library verilog;
use verilog.vl_types.all;
entity CONTADOR is
    port(
        C               : out    vl_logic;
        ENTRADA         : in     vl_logic;
        CLK             : in     vl_logic;
        B               : out    vl_logic;
        A               : out    vl_logic
    );
end CONTADOR;
