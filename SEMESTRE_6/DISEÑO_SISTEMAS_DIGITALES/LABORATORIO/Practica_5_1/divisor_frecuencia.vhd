library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisor_frecuencia is 
	Port(
		reloj : in STD_LOGIC;
		reset : in STD_LOGIC;
		led   : out STD_LOGIC;
		led2  : out STD_LOGIC);
		
end divisor_frecuencia;

architecture Behavioral of divisor_frecuencia is
	
	signal temporal: STD_LOGIC;
	signal contador: integer range 0 to 24999999 := 0;
	
begin

	divisor_frecuencia: process (reset, reloj) begin
		if (reset = '1') then
			temporal <= '0';
			contador <= 0;
		elsif rising_edge(reloj) then
			if (contador = 24999999) then
				temporal <= NOT(temporal);
				contador <= 0;
			else
				contador <= contador + 1;
			end if;
		end if;
	end process;
	
	led <= temporal;
	
end Behavioral;