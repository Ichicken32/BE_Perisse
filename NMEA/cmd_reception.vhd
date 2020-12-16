library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity cmd_reception is
port
(
	raz_n, clk : in std_logic;
	start_stop, mode : in std_logic;
	in_trame : in std_logic;
	S, C, D, U : out std_logic_vector ( 3 downto 0);
	data_valid : out std_logic
);
end cmd_reception;

architecture ar of cmd_reception is

signal trame_data : std_logic_vector( 17 downto 0);
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
	trame_v := (others => '0');
	elsif(mode = '1')then
	if (in_trame = '1' and depart = false)then
		depart := true;
		cpt := cpt - 1;
		trame_v(0) := in_trame;
		elsif(depart = true and cpt /= 0)then
		cpt := cpt - 1;
		trame_v(0) := in_trame;
		trame_v := trame_v(16 downto 0) & in_trame;
		elsif(depart = true and cpt = 0)then
		data_valid <= '1';
		cpt := 18;
		depart := false;
	end if;
	elsif(start_stop = '1')then
	elsif (start_stop = '0')then
	trame_v := (others => '0');
end if;

trame_data <= trame_v;

end process;




C1 : prediv_1s port map(raz_n, clk, sec);
C2 : prediv_4800Hz port map(raz_n, clk, clk_4800);

end ar;