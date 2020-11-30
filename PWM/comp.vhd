library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all; 

entity comp is
port
(
	araz, clk : in std_logic;
	DUTY : in std_logic_vector ( 7 downto 0);
	pwm_out : out std_logic
);
end comp;

architecture ar of comp is

signal comp_sig : std_logic_vector ( 15 downto 0);
signal pwm_sig : std_logic;


begin

	process(araz, clk)
		begin
		if (araz = '1') then
			pwm_sig <= '0';
				elsif (clk='1' and clk'event) then
					comp_sig <= comp_sig+1;
					if(comp_sig = 255) then
						comp_sig <= (others =>'0');
						pwm_sig <= '0';
						elsif(comp_sig = DUTY)
							then 
								pwm_sig <= '1';
						end if;		
										
		end if;
	end process;
	
	pwm_out <= pwm_sig;
	
end ar;