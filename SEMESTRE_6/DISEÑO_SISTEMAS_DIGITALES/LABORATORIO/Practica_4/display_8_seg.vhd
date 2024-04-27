library ieee;
use ieee.std_logic_1164.all;

entity display_8_seg is
	port
	(
		A: in std_logic_vector(3 downto 0);
		d: out std_logic_vector(7 downto 0)
	);
end display_8_seg;

architecture arqdeco of display_8_seg is
begin
	process (A) begin
		case A is
			when "0000" => d <= "00000011";
			when "0001" => d <= "10011111";
			when "0010" => d <= "00100101";
			when "0011" => d <= "00001101";
			when "0100" => d <= "10011001";
			when "0101" => d <= "01001001";
			when "0110" => d <= "01000001";
			when "0111" => d <= "00011101";
			when "1000" => d <= "00000001";
			when "1001" => d <= "00001001";
			when others => d <= "11111110";
		end case;
	end process;
end arqdeco;