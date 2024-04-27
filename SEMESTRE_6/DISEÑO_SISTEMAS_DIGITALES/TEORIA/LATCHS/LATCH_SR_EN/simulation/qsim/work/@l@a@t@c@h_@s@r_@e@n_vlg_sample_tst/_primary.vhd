library verilog;
use verilog.vl_types.all;
entity LATCH_SR_EN_vlg_sample_tst is
    port(
        EN              : in     vl_logic;
        R               : in     vl_logic;
        S               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end LATCH_SR_EN_vlg_sample_tst;
