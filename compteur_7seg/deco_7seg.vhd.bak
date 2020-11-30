library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity deco_7seg is
port
(
	cpt_bcd : in std_logic_vector(3 downto 0);
	deco : out std_logic_vector(6 downto 0)
);
end deco_7seg;

architecture ar of deco_7seg is

begin

	with cpt_bcd select deco <=
	"0111111" when "0000",
	"0000110" when "0001",
	"1011011" when "0010",
	"1001111" when "0011",
	"1100110" when "0100",
	"1101101" when "0101",
	"1111101" when "0110",
	"0000111" when "0111",
	"1111111" when "1000",
	"1101111" when "1001",
	"0000000" when others;

end ar;