library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_unsigned.all;

entity logic_comp is
generic (n: natural:= 4);
port (
		A, B: in std_logic_vector(n-1 downto 0);
		sel: in std_logic; -- 0-> AND  1-> OR
		R: out std_logic_vector(n-1 downto 0)
		);
end entity;

architecture behav of logic_comp is
signal anb, aob: std_logic_vector(n-1 downto 0);
begin
	anb <= A and B;
	aob <= A or B;
	with sel select
	 R <= anb when '0',
			aob when '1';
end behav;