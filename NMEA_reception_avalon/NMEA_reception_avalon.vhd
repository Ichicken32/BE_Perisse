library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity NMEA_reception_avalon is
port
(
	--avalon
	clk, chipselect, write_n, reset_n : in std_logic;
	writedata : in std_logic_vector (15 downto 0);
	readdata : out std_logic_vector (15 downto 0);
	address: std_logic_vector (2 downto 0)
);
end  NMEA_reception_avalon;

architecture ar of  NMEA_reception_avalon is

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

signal raz_n, start_stop, mode, in_trame, data_valid : std_logic;
signal S, C, D, U :  std_logic_vector ( 3 downto 0);

begin

process_write : process (clk, reset_n)
begin
if reset_n = '0' then
	raz_n <= '0';
	start_stop <= '0';
	mode <= '0';
	elsif clk'event and clk = '1' then
	if chipselect ='1' and write_n = '0' then
		if address = "00" then
			raz_n <= writedata(0);
			start_stop <= writedata(1);
			mode <= writedata(2);
		end if;
	end if;
end if;
end process;

-- lecture registres
process_Read : process(address, start_stop, raz_n, mode)
BEGIN
case address is
when "000" => readdata <= X"000"&"0"&mode&start_stop&raz_n;
when "001" => readdata <= X"000"&S;
when "010" => readdata <= X"000"&C;
when "011" => readdata <= X"000"&D;
when "100" => readdata <= X"000"&U;
when others => readdata <= (others => '0');
end case;
END PROCESS process_Read ;

C1 : cmd_reception port map(raz_n, clk, start_stop, mode, in_trame, S, C, D, U, data_valid);

end ar;