library IEEE;
use IEEE.std_logic_1164.all;

entity Adder_subtracter is
generic (n: natural:= 4);
port ( 
		A, B: in std_logic_vector(n-1 downto 0);
		sel: in std_logic;
		R: out std_logic_vector(n downto 0)
		);
end entity;

architecture behav of Adder_subtracter is

component somador is
generic (N: natural := 4);
port (
		A, B: in std_logic_vector(N-1 downto 0);
		cin: in std_logic;
		R: out std_logic_vector(N downto 0)
		);
end component;

component mux21 is
generic (N: natural:= 4);
port (
		A, B: in std_logic_vector(N-1 downto 0);
		sel: in std_logic;
		C: out std_logic_vector(N-1 downto 0)
		);
end component;

signal fB, nB: std_logic_vector(n-1 downto 0);
begin
nB <= not(B);
mux:mux21 port map(B, nB, sel, fB);
sum:somador port map(A, fB, sel, R);
end behav;