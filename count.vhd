library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity count is
	port (
		CLK      : in  std_logic := '0'; 					--   clk.clk
		RESET : in  std_logic  := '0'; 					-- reset.reset_n
		SEG1   : out std_logic_vector(7 downto 0);         --  seg1.export
		SEG2   : out std_logic_vector(7 downto 0);        --  seg2.export
		SEG3   : out std_logic_vector(7 downto 0)         --  seg3.export
	);
end entity count;

architecture rtl of count is

	component countt is
		port (
			clk_clk       : in  std_logic := 'X'; 							-- clk
			reset_reset_n : in  std_logic := 'X'; 							-- reset_n
			seg1_export   : out std_logic_vector(3 downto 0);         -- export
			seg2_export   : out std_logic_vector(3 downto 0);       -- export
			seg3_export   : out std_logic_vector(3 downto 0)         -- export
		);
	end component countt;
	
	component BCD7SEG is
		port (
			input : in std_logic_vector(3 downto 0) := (others => 'X'); 
			output : out std_logic_vector(7 downto 0)
		);
	end component BCD7SEG;
	
signal segment1 : std_logic_vector(3 downto 0);
signal segment2 : std_logic_vector(3 downto 0);
signal segment3 : std_logic_vector(3 downto 0);
begin

	u0 : component countt
		port map (
			clk_clk       => CLK,       --   clk.clk
			reset_reset_n => RESET, -- reset.reset_n
			seg1_export   => segment1,    --  seg1.export
			seg2_export   => segment2,   --  seg2.export
			seg3_export   => segment3    --  seg3.export
		);
		
	u1 : component BCD7SEG
		port map (
			input => segment1,
			output => SEG1
		);

	u2 : component BCD7SEG
		port map (
			input => segment2,
			output => SEG2
		);
		
	u3 : component BCD7SEG
		port map (
			input => segment3,
			output => SEG3
		);
end architecture;