library verilog;
use verilog.vl_types.all;
entity LATCH_TIPO_D is
    port(
        Q               : out    vl_logic;
        D               : in     vl_logic;
        En              : in     vl_logic;
        Qn              : out    vl_logic
    );
end LATCH_TIPO_D;
