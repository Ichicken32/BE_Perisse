library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity cmd_emission is
port
(
	raz_n, clk : in std_logic;
	start_stop, sec : in std_logic;
	S, C, D, U : in std_logic_vector ( 3 downto 0);
	output : out std_logic
);
end cmd_emission;

architecture ar of cmd_emission is

signal trame : std_logic_vector( 17 downto 0);

begin

process (clk, raz_n)

variable trame_v : std_logic_vector(17 downto 0);

begin

if (raz_n = '0')then
	trame <= (others => '0'); 
	elsif clk'event and clk = '1' then	
		if start_stop = '1' and sec = '1' then trame_v := '1' & S & C & D & U & '1';
			elsif(start_stop = '1' and sec = '0') then
				trame_v := trame;
				trame_v := trame_v(16 downto 0) & '0';
				output <= trame(17);
		end if;
end if;

trame <= trame_v;

end process;

end ar;