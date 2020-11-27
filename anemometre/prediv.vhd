library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity prediv_250 is
port
(
	araz, clk : in std_logic;
	clk_out : out std_logic
);
end prediv_250;

architecture ar of prediv_250 is

signal cpt_sig : std_logic_vector ( 18 downto 0);
signal out_sig : std_logic;



begin


	process(araz, clk)
		begin
		if (araz = '0') then
			cpt_sig <=(others =>'0');
			out_sig <= '0';
				elsif (clk='1' and clk'event)
				then cpt_sig <= cpt_sig + 1;
					if(cpt_sig = 100000)
						then 
							out_sig <= not(out_sig);
							cpt_sig <= (others => '0');
					end if;		
										
		end if;
	end process;
	
	clk_out <= out_sig;
	
end ar;