library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity NMEA is
port
(
	raz_n, clk : in std_logic;
	start_stop_emission, start_stop_reception, in_trame, mode : in std_logic;
	S_emission, C_emission, D_emission, U_emission : in std_logic_vector ( 3 downto 0);
	S_reception, C_reception, D_reception, U_reception : out std_logic_vector ( 3 downto 0);
	output, fin_transmit, data_valid : out std_logic
);
end  NMEA;

architecture ar of  NMEA is

component cmd_emission 
port
(
	raz_n, clk : in std_logic;
	start_stop : in std_logic;
	S, C, D, U : in std_logic_vector ( 3 downto 0);
	output, fin_transmit : out std_logic
);
end component;

component cmd_reception 
port
(
	raz_n, clk : in std_logic;
	start_stop, mode : in std_logic;
	in_trame : in std_logic;
	S, C, D, U : out std_logic_vector ( 3 downto 0);
	data_valid : out std_logic
);
end component;

begin

C1 : cmd_emission port map(raz_n, clk, start_stop_emission, S_emission, C_emission, D_emission, U_emission, output, fin_transmit);

C2 : cmd_reception port map(raz_n, clk, start_stop_reception, mode, in_trame, S_reception, C_reception, D_reception, U_reception, data_valid);

end ar;