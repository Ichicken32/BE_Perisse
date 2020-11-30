library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity cpt_bcd is
port
(
	aclr, clk : in std_logic;
	unit,diz : out std_logic_vector(3 downto 0)
);
end cpt_bcd;

architecture ar of cpt_bcd is

signal cpt : std_logic_vector ( 3 downto 0);
signal cpt_diz : std_logic_vector ( 3 downto 0);

begin

	process(aclr, clk)
		begin
		if (aclr = '1') then
			cpt_diz <=(others =>'0');
			cpt <=(others =>'0');
				elsif (clk='1' and clk'event)
				then cpt <= cpt + 1;
					if(cpt = 9)
						then 
						cpt <= (others => '0');
						cpt_diz <= cpt_diz + 1;
						end if;
		end if;
	end process;
	unit <= cpt;
	diz <= cpt_diz;
	

end ar;