library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity PWM is
  port (clk,araz: in std_logic;
		FREQ : in std_logic_vector ( 15 downto 0);
		DUTY : in std_logic_vector ( 7 downto 0);
		ref : out std_logic;

		PWM_out : out std_logic
);
end PWM;

architecture ar of PWM  is 

component cpt
port
(
	araz, clk : in std_logic;
	FREQ : in std_logic_vector ( 15 downto 0);
	cpt_out : out std_logic
);
end component;

component comp 
port
(
	araz, clk : in std_logic;
	DUTY : in std_logic_vector ( 7 downto 0);
	pwm_out : out std_logic
);
end component;


signal clk_sig, araz_sig : std_logic;
signal FREQ_sig : std_logic_vector ( 15 downto 0);

begin

FREQ_sig <= "0000000000000000";

C1 : cpt port map(araz, clk,FREQ,clk_sig);
C2 : comp port map(araz, clk_sig,DUTY,PWM_out);
ref <= clk_sig;

end;