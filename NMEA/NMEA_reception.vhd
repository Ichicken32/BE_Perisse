library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity NMEA_reception is
port
(
	raz_n, clk : in std_logic;
	start_stop, mode : in std_logic;
	S, C, D, U : out std_logic_vector ( 3 downto 0);
	data_valid : out std_logic
);
end NMEA_reception;