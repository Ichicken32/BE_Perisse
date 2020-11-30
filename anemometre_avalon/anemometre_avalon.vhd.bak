library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity anemometre_avalon is
port (
clk, chipselect, write_n, reset_n : in std_logic;
writedata : in std_logic_vector (15 downto 0);
readdata : out std_logic_vector (15 downto 0);
address: std_logic_vector (1 downto 0)
);
end anemometre_avalon;

ARCHITECTURE arch_anemometre_avalon of anemometre_avalon IS

component anemometre
port
(
	raz_n, clk_50M : in std_logic;
	start_stop, continu : in std_logic;
	in_freq_anemometre : in std_logic;
	data_anemometre : out std_logic_vector ( 7 downto 0);
	data_valid : out std_logic
);
end component;

signal start_stop, continu, in_freq_anemometre, raz_n, data_valid : std_logic;
signal data_anemometre : std_logic_vector ( 7 downto 0);

BEGIN

process_write : process (clk, reset_n)
begin
if reset_n = '0' then
	raz_n <= '0';
	continu <= '0';
	start_stop <= '0';
	elsif clk'event and clk = '1' then
	if chipselect ='1' and write_n = '0' then
		if address = "00" then
			raz_n <= writedata(0);
			continu <= writedata(1);
			start_stop <= writedata(2);
		end if;
	end if;
end if;
end process;

-- lecture registres
process_Read : process(address, start_stop, continu, raz_n)
BEGIN
case address is
when "00" => readdata <= X"000"&"0"&start_stop&continu&raz_n;
when "10" => readdata <= X"0"&"000"&data_valid&data_anemometre;
when others => readdata <= (others => '0');
end case;
END PROCESS process_Read ;

C1 : anemometre port map(raz_n, clk, start_stop, continu, in_freq_anemometre, data_anemometre, data_valid);


END arch_anemometre_avalon ;