library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Conversion_2 is
port
(
	araz, clk : in std_logic;
	in_freq : in std_logic;
	data : out std_logic_vector(7 downto 0)
);
end Conversion_2;

architecture ar of Conversion_2 is

signal cpt_sig : std_logic_vector ( 7 downto 0);
signal data_sig : std_logic_vector ( 7 downto 0);

begin

	process(araz, in_freq)
		begin
		if (araz = '0') then
			cpt_sig <=(others =>'0');
				elsif (in_freq='1' and in_freq'event)
				then
					if(clk = '1')
						then cpt_sig <= (others => '0');
							 data <= data_sig+1;
					elsif(clk = '0')
					then
						cpt_sig <= cpt_sig + 1;
						data_sig <= cpt_sig;
					end if;			
		end if;
	end process;

end ar;