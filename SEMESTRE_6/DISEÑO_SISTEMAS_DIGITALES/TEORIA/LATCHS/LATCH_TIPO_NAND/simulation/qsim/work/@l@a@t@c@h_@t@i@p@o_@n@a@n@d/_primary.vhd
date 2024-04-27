library verilog;
use verilog.vl_types.all;
entity LATCH_TIPO_NAND is
    port(
        Q               : out    vl_logic;
        Rn              : in     vl_logic;
        Sn              : in     vl_logic;
        Qn              : out    vl_logic
    );
end LATCH_TIPO_NAND;
