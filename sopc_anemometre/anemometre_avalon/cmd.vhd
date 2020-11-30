library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity cmd is
port
(
	araz, clk : in std_logic;
	start_stop, continu : in std_logic;
	data_in : in std_logic_vector ( 7 downto 0);
	data_out : out std_logic_vector ( 7 downto 0);
	data_valid : out std_logic
);
end cmd;

architecture ar of cmd is

signal data_sig : std_logic_vector ( 7 downto 0);

begin
	
	process(araz, clk)
		begin
		if (araz = '0') then
		data_sig <= (others =>'0');
				elsif (clk='1' and clk'event) then
				if(continu = '1') then
					data_sig <= data_in;
				end if;
		end if;
	end process;
	
	data_valid <= '0' when (araz = '0') else
				  '1' when (continu = '0' and start_stop = '1') else
				  '1' when (continu = '1') else
				  '0';	
								
	data_out <= "00000000" when (araz = '0') else
				data_sig when (continu = '1') else					
				data_in when (continu = '0' and start_stop = '1') else
				"00000000";
end ar;