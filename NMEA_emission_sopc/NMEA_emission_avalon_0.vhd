-- NMEA_emission_avalon_0.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NMEA_emission_avalon_0 is
	port (
		chipselect : in  std_logic                     := '0';             -- avalon_slave_0.chipselect
		write_n    : in  std_logic                     := '0';             --               .write_n
		writedata  : in  std_logic_vector(15 downto 0) := (others => '0'); --               .writedata
		readdata   : out std_logic_vector(15 downto 0);                    --               .readdata
		address    : in  std_logic_vector(2 downto 0)  := (others => '0'); --               .address
		clk        : in  std_logic                     := '0';             --          clock.clk
		reset_n    : in  std_logic                     := '0'              --          reset.reset_n
	);
end entity NMEA_emission_avalon_0;

architecture rtl of NMEA_emission_avalon_0 is
	component NMEA_emission_avalon is
		port (
			chipselect : in  std_logic                     := 'X';             -- chipselect
			write_n    : in  std_logic                     := 'X';             -- write_n
			writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			address    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			clk        : in  std_logic                     := 'X';             -- clk
			reset_n    : in  std_logic                     := 'X'              -- reset_n
		);
	end component NMEA_emission_avalon;

begin

	nmea_emission_avalon_0 : component NMEA_emission_avalon
		port map (
			chipselect => chipselect, -- avalon_slave_0.chipselect
			write_n    => write_n,    --               .write_n
			writedata  => writedata,  --               .writedata
			readdata   => readdata,   --               .readdata
			address    => address,    --               .address
			clk        => clk,        --          clock.clk
			reset_n    => reset_n     --          reset.reset_n
		);

end architecture rtl; -- of NMEA_emission_avalon_0
