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

component cmd_emission 
port
(
	raz_n, clk : in std_logic;
	start_stop : in std_logic;
	S, C, D, U : in std_logic_vector ( 3 downto 0);
	output, fin_transmit : out std_logic
);
end component;

signal raz_n, start_stop, output, fin_transmit : std_logic;
signal S, C, D, U :  std_logic_vector ( 3 downto 0);

begin

process_write : process (clk, reset_n)
begin
if reset_n = '0' then
	raz_n <= '0';
	start_stop <= '0';
	S <= "0000";C <= "0000";D <= "0000";U <= "0000";
	elsif clk'event and clk = '1' then
	if chipselect ='1' and write_n = '0' then
		if address = "00" then
			raz_n <= writedata(0);
			start_stop <= writedata(1);
		end if;
		if address = "01" then
			S <= writedata(3 downto 0);
		end if;
		if address = "10" then
			C <= writedata(3 downto 0);
		end if;
		if address = "11" then
			D <= writedata(3 downto 0);
		end if;
		if address = "100" then
			U <= writedata(3 downto 0);
		end if;
	end if;
end if;
end process;

-- lecture registres
process_Read : process(address, start_stop, raz_n, fin_transmit)
BEGIN
case address is
when "000" => readdata <= X"000"&"0"&fin_transmit&start_stop&raz_n;
when "001" => readdata <= X"000"&S;
when "010" => readdata <= X"000"&C;
when "011" => readdata <= X"000"&D;
when "100" => readdata <= X"000"&U;
when others => readdata <= (others => '0');
end case;
END PROCESS process_Read ;

C1 : cmd_emission port map(raz_n, clk, start_stop, S, C, D, U, output, fin_transmit);

end ar;