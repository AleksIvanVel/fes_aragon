library verilog;
use verilog.vl_types.all;
entity LATCH_SR_EN_vlg_check_tst is
    port(
        Q               : in     vl_logic;
        Qn              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end LATCH_SR_EN_vlg_check_tst;
