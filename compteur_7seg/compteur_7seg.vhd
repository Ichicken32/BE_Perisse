library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity compteur_7seg is
  port (clk,araz: in std_logic;
		clk_sec : out std_logic;
		seg: out std_logic_vector (6 downto 0)
);
end compteur_7seg;

architecture ar of compteur_7seg is 

component diviseur
  port
(
	araz, clk : in std_logic;
	clk_out : out std_logic
);
end component;

component cpt_bcd 
port
(
	aclr, clk : in std_logic;
	unit,diz : out std_logic_vector(3 downto 0)
);
end component;

component deco_7seg 
port
(
	cpt_bcd : in std_logic_vector(3 downto 0);
	deco : out std_logic_vector(6 downto 0)
);
end component;

signal clk_sig, araz_sig : std_logic;
signal cpt,cpt2 : std_logic_vector(3 downto 0);

begin

C1 : diviseur port map(araz, clk,clk_sig);
C2 : cpt_bcd port map(araz, clk_sig,cpt,cpt2);
C3 : deco_7seg port map(cpt,seg);

clk_sec <= clk_sig;

end;