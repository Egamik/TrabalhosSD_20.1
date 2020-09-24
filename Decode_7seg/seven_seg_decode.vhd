library IEEE;
use IEEE.std_logic_1164.all;

entity seven_seg_decode is
port (abcd: in std_logic_vector(3 downto 0);
		z: out std_logic_vector(6 downto 0)
		);
end entity;

architecture behav of seven_seg_decode is

begin
	p:process(abcd) is
	begin
		case abcd is
			when "1000" =>
				z <= "0110111";
			when "0100" =>
				z <= "1111111";
			when "0010"	=>
				z <= "0111001";
			when "0001" =>
				z <= "0111111";
			when others =>
				z <= "0000000";
		end case;	
	end process;			
end behav;