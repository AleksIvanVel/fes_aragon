library verilog;
use verilog.vl_types.all;
entity LATCH_TIPO_D_vlg_sample_tst is
    port(
        D               : in     vl_logic;
        En              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end LATCH_TIPO_D_vlg_sample_tst;
