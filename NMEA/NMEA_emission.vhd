library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity NMEA_emission is
port
(
	raz_n, clk : in std_logic;
	start_stop : in std_logic;
	S, C, D, U : in std_logic_vector ( 3 downto 0);
	trame : out std_logic_vector;
	fin_transmit : out std_logic
);
end NMEA_emission;

architecture ar of NMEA_emission is

signal seconde : std_logic;


begin

end ar;