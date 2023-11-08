Library IEEE;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_arith.all;
Use ieee.std_logic_unsigned.all;

Entity D_FF is 
Port
   (D, CLOCK : in std_logic;
	 Q       : out std_logic);
end D_FF;

Architecture behavioral of D_FF is 
begin 
process(CLOCK)
begin
if(CLOCK='1' and CLOCK'EVENT) then 
Q <= D;
end if;
end process;
end behavioral;

