library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_completo is
   port(
	   a     : in STD_LOGIC;
		b     : in STD_LOGIC;
		cin   : in STD_LOGIC;
		f     : out STD_LOGIC;
		cout  : out STD_LOGIC);
end sumador_completo;

architecture Behavioral of sumador_completo is 
begin 
   f <= a xor b xor cin;
	cout <= (a and b) or (cin and (a xor b));
end Behavioral;

	