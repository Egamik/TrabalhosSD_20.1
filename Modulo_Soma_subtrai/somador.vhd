library IEEE;
use IEEE.std_logic_1164.all;

entity somador is
generic (N: natural := 4);
port (
		A, B: in std_logic_vector(N-1 downto 0);
		cin: in std_logic;
		R: out std_logic_vector(N downto 0)
		);
end entity;

architecture behav of somador is
component full_adder is
 Port ( A : in STD_LOGIC;
 B : in STD_LOGIC;
 Cin : in STD_LOGIC;
 S : out STD_LOGIC;
 Cout : out STD_LOGIC);
end component;

signal fio: std_logic_vector(N downto 0);

begin
	R(N) <= fio(N);
	fio(0) <= cin;
	adder:for i in 0 to N-1 generate
		add:full_adder port map(A(i), B(i), fio(i), R(i), fio(i+1));
	end generate;
end behav;