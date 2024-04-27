library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Practica_2 is
	port
	(
		S: in std_logic;
		E: in std_logic;
		C: in std_logic;
		R: out std_logic;
		A: out std_logic;
		V: out std_logic
	);
end Practica_2;

architecture rtl of Practica_2 is
begin

	
	R <= S;
	A <= NOT(S) AND E;
	V <= NOT(S) AND NOT (E) AND C;
	
end rtl;