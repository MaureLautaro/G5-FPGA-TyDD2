Architecture Behavioral of ej_combinacional_testbench is

   Component ej_combinacional 
	   Port(
		 SW1 : in STD_LOGIC;
		 SW2 : in STD_LOGIC;
		 LED : out STD_LOGIC);
	End component;
	
	--Imputs
	signal SW1 : std_logic :='0';
	signal SW2 : std_logic :='0';
	--Ouputs
	signal LED : std_logic;
	
Begin 
   uut: ej_combinacional port map (
	   SW1 => SW1,
		SW2 => SW2,
		LED => LED
	);
	
	stim_proc : process 
	begin 
	   SW1 <= '0'; SW2 <= '0'; wait for 10ns;
		SW1 <= '0'; SW2 <= '1'; wait for 10ns;
		SW1 <= '1'; SW2 <= '0'; wait for 10ns;
		SW1 <= '1'; SW2 <= '1'; wait for 10ns;
	wait;
	end process;
	end;
	