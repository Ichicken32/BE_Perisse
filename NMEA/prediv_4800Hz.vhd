library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity prediv_4800Hz is
port
(
	araz, clk : in std_logic;
	clk_out : out std_logic
);
end prediv_4800Hz;

architecture ar of prediv_4800Hz is

signal cpt : std_logic_vector(27 downto 0);
signal clk_sig : std_logic;

begin

	process(araz, clk)
		begin
		if (araz = '0') then
			clk_sig <= '0';
			cpt <=(others =>'0');
				elsif (clk='1' and clk'event)
				then cpt <= cpt + 1;
					if(cpt = 5209)
						then 
						cpt <= (others => '0');
						clk_sig <= not(clk_sig);
						end if;
		end if;
	end process;
	
clk_out <= clk_sig;

end ar;

