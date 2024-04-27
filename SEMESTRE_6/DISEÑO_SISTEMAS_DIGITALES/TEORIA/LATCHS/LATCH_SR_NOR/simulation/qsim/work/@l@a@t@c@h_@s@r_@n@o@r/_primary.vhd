library verilog;
use verilog.vl_types.all;
entity LATCH_SR_NOR is
    port(
        Q               : out    vl_logic;
        R               : in     vl_logic;
        S               : in     vl_logic;
        Qn              : out    vl_logic
    );
end LATCH_SR_NOR;
