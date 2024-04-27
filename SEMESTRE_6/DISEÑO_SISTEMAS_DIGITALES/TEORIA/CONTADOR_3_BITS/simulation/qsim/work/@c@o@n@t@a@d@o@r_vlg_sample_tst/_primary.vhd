library verilog;
use verilog.vl_types.all;
entity CONTADOR_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        ENTRADA         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CONTADOR_vlg_sample_tst;
