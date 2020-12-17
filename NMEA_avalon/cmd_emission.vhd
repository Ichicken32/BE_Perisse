library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity cmd_emission is
port
(
	raz_n, clk : in std_logic;
	start_stop : in std_logic;
	S, C, D, U : in std_logic_vector ( 3 downto 0);
	output, fin_transmit : out std_logic
);
end cmd_emission;

architecture ar of cmd_emission is

signal trame : std_logic_vector( 17 downto 0);
signal clk_4800, sec : std_logic;

component prediv_1s
port
(
	araz, clk : in std_logic;
	clk_out : out std_logic
);
end component;

component prediv_4800Hz
port
(
	araz, clk : in std_logic;
	clk_out : out std_logic
);
end component;


begin

process (clk_4800, raz_n)

variable trame_v : std_logic_vector(17 downto 0);
variable cpt : integer := 18;
variable depart : boolean  := false;

begin

if (raz_n = '0')then
	trame <= (others => '0'); 
	elsif clk_4800'event and clk_4800 = '1' then
		if (cpt = 0)then fin_transmit <= '1'; cpt := 18; depart := false; elsif(cpt /= 0) then fin_transmit <= '0'; end if;
		if start_stop = '1' and sec = '1' then trame_v := '1' & S & C & D & U & '1'; depart := true;
			elsif(start_stop = '1' and sec = '0') then
				if (depart = true) then cpt := cpt - 1; end if;
				trame_v := trame;
				trame_v := trame_v(16 downto 0) & '0';
				output <= trame(17);
		end if;
end if;

trame <= trame_v;

end process;

C1 : prediv_1s port map(raz_n, clk, sec);
C2 : prediv_4800Hz port map(raz_n, clk, clk_4800);

end ar;