library IEEE;
use IEEE.std_logic_1164.all;

entity ULA is
generic (n: natural:=4);
port (
		A, B: in std_logic_vector(n-1 downto 0);
		opcode: in std_logic_vector(2 downto 0);
		flag: out std_logic;
		R: out std_logic_vector(n-1 downto 0)
);
end entity;

architecture behav of ULA is

component Adder_subtracter is
generic (n: natural:= 4);
port ( 
		A, B: in std_logic_vector(n-1 downto 0);
		sel: in std_logic;
		R: out std_logic_vector(n downto 0)
		);
end component;

component logic_comp is
generic (n: natural:= 4);
port (
		A, B: in std_logic_vector(n-1 downto 0);
		sel: in std_logic; -- 0-> AND  1-> OR
		R: out std_logic_vector(n-1 downto 0)
		);
end component;

component comparador_magnitude is
generic (n: natural:= 4);
port(	a: in std_logic_vector(n-1 downto 0);
		b: in std_logic_vector(n-1 downto 0);
		c: out std_logic_vector(2 downto 0)
		);
end component;

component mux41 is
generic (n: natural:= 4);
port (
		A, B, C, D: in std_logic_vector(n-1 downto 0);
		sel: in std_logic_vector(1 downto 0);
		Z: out std_logic_vector(n-1 downto 0)
		);
end component;
-- opcode:0 A+B, 1 A-B, 2 A or B, 3 A and B, 4 not A, 5 A < B
signal sumout: std_logic_vector(n downto 0);				 -- saida do add_sub
signal nA, omux, olcp: std_logic_vector(n-1 downto 0); -- saidas:mux41, logic comp, not A
signal omgcp: std_logic_vector(2 downto 0);				 -- saida comparador magnitude
signal zero: std_logic_vector(n-1 downto 3);

begin
	flag <= sumout(n); -- indica overflow
	nA <= not(A);
	zero <= (others => '0');
	adds: Adder_subtracter port map(A, B, opcode(0), sumout);
	lgcp: logic_comp port map(A, B, opcode(0), olcp);
	cpmg: comparador_magnitude port map(A, B, omgcp);
	mux: mux41 port map(sumout(n-1 downto 0), olcp, nA, zero&omgcp, opcode(2 downto 1), R);
end behav;