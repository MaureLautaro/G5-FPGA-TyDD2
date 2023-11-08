-- Quartus II VHDL Template
-- Four-State Mealy State Machine

-- A Mealy machine has outputs that depend on both the state and
-- the inputs.	When the inputs change, the outputs are updated
-- immediately, without waiting for a clock edge.  The outputs
-- can be written more than once per state or per clock cycle.

library ieee;
use ieee.std_logic_1164.all;

entity sumador_serie is

	port
	(
		clk   : in	std_logic;
		reset : in	std_logic;
		a     : in	std_logic;
		b     : in	std_logic;
		cin   : in	std_logic;
		z  	: out	std_logic;
		cout  : out std_logic
	);
end entity;

architecture Behavioral of sumador_serie is

	-- Build an enumerated type for the state machine
	type state_type is (e0, e1);

	-- Register to hold the current state
	signal EA ,ES : state_type;

begin

	process (clk, ES, reset)
	begin
		if reset = '0' then
			EA <= e0;
		elsif (rising_edge(clk)) then
			-- Determine the next state synchronously, based on
			-- the current state and the input
		EA <= ES;
		end if;
	end process;

	-- Determine the output based only on the current state
	-- and the input (do not wait for a clock edge).
	process (EA ,a ,b ,cin)
	begin
			case EA is
				when e0 => 
					if (a='0' and b='0' and cin='0') then
					   ES <= e0;
						z <= '0';
						cout <= '0';
					else 
					   if (a='0' and b='1' and cin='0') then
					      ES <= e0;
						   z <= '1';
							cout <= '0';
						else
						   if (a='1' and b='0' and cin='0') then
					         ES <= e0;
						      z <= '1';
								cout <= '0';
						   else
						      if (a='1' and b='1' and cin='0') then
					            ES <= e1;
						         z <= '0';
									cout <= '1';
					end if;
					end if;
					end if;
					end if;
				
				when e1 =>
					if (a='0' and b='0' and cin='1') then
					   ES <= e0;
						z <= '1';
						cout <= '0';
					else 
					   if (a='0' and b='1' and cin='1') then
					      ES <= e1;
						   z <= '0';
							cout <= '1';
						else
						   if (a='1' and b='0' and cin='1') then
					         ES <= e1;
						      z <= '0';
								cout <= '1';
						   else
						      if (a='1' and b='1' and cin='1') then
					            ES <= e1;
						         z <= '1';
									cout <= '1';
					end if;	
				   end if;
			      end if;
					end if;
			end case;
	end process;
end behavioral;
