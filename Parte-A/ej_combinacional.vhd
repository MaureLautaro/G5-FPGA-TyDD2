Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

Entity ej_combinacional is
    Port (
	    SW1 : in STD_LOGIC;
		 SW2 : in STD_LOGIC;
		 LED : out STD_LOGIC);
End ej_combinacional;

Architecture Behavioral of ej_combinacional is
Begin 
LED <= not (SW1 and SW2);
end Behavioral;
			
	 