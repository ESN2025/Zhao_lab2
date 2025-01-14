library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity BCD7SEG is
	port (
		input : in std_logic_vector(3 downto 0);
		output : out std_logic_vector(7 downto 0)
	);
end entity BCD7SEG;

architecture rtl of BCD7SEG is

begin
	output <= "11000000" when input = "0000" else 	-- 0
				 "11111001" when input = "0001" else 	-- 1
				 "10100100" when input = "0010" else 	-- 2
				 "10110000" when input = "0011" else 	-- 3
				 "10011001" when input = "0100" else 	-- 4
				 "10010010" when input = "0101" else 	-- 5
				 "10000010" when input = "0110" else 	-- 6
				 "11111000" when input = "0111" else 	-- 7
				 "10000000" when input = "1000" else 	-- 8
				 "10010000" when input = "1001" else	-- 9
				 "11111111";

end architecture;