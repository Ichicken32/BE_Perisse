library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity cpt is
port
(
	araz, clk : in std_logic;
	FREQ : in std_logic_vector ( 15 downto 0);
	cpt_out : out std_logic
);
end cpt;

architecture ar of cpt is

signal cpt_sig : std_logic_vector ( 15 downto 0);
signal out_sig : std_logic;



begin


	process(araz, clk)
		begin
		if (araz = '1') then
			cpt_sig <=(others =>'0');
			out_sig <= '0';
				elsif (clk='1' and clk'event)
				then cpt_sig <= cpt_sig + 1;
					if(cpt_sig = FREQ)
						then 
							out_sig <= not(out_sig);
							cpt_sig <= (others => '0');
					end if;		
										
		end if;
	end process;
	
	cpt_out <= out_sig;
	
end ar;