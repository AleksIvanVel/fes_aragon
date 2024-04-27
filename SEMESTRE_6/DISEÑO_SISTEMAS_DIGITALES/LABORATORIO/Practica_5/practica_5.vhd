library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity practica_5 IS
	Port(CLOCK : in STD_logic;
			J	: in STD_logic;
			K : in std_logic;
			Q : out std_logic;
			QN : out std_logic);
end practica_5;

architecture Behavioral of practica_5 is
SIGNAL QT, QTN : STD_LOGIC;
begin
process (clock)
begin
	if (clock'event and clock = '1')then
		if ((j = '1') and (k = '1')) then
		Q <= '0';
		QN <= '1';
		QT <='1';
		QTN <= '0';
		
		ELSif((j = '1') and (k = '0' )) then 
		Q <= '0';
		QN <= '1';
		QT <='0';
		QTN <= '1';
		
		ELSif((k = '1') and (j = '0' )) then 
		Q <= '1';
		QN <= '0';
		QT <='0';
		QTN <= '1';
		
		ELSif((k = '0') and (j = '0' )) then 
		Q <= '1';
		QN <= '0';
		QT <='1';
		QTN <= '0';
		
		END IF;
	END IF;
END PROcess;
end Behavioral;

