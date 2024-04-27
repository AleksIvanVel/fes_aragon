library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FLIPFLOPD is
	Port(
			CLOCK : in STD_LOGIC;
			D     : in STD_LOGIC;
			Q 		: out STD_LOGIC;
			QN		: out STD_LOGIC);
end FLIPFLOPD;

architecture Behavioral of FLIPFLOPD is begin

	process(clock) begin
	
		if (clock'event and clock = '1') then
			Q <= D;
			QN <= NOT(D);
		end if;
		
	end process;

end Behavioral;
	