library IEEE;
use IEEE.std_logic_1164.all;

entity mux21 is
generic (N: natural:= 4);
port (
		A, B: in std_logic_vector(N-1 downto 0);
		sel: in std_logic;
		C: out std_logic_vector(N-1 downto 0)
		);
end entity;

architecture behav of mux21 is
begin
	C <= A when sel = '0' else B;
end behav;