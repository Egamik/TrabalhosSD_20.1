library IEEE;
use IEEE.std_logic_1164.all;

entity mux41 is
generic (n: natural:= 4);
port (
		A, B, C, D: in std_logic_vector(n-1 downto 0);
		sel: in std_logic_vector(1 downto 0);
		Z: out std_logic_vector(n-1 downto 0)
		);
end entity;

architecture behav of mux41 is
begin
	Z <= A when sel = "00" else
			B when sel = "01" else
			C when sel = "10" else
			D when sel = "11";
end behav;