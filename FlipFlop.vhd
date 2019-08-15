LIBRARY IEEE;
use ieee.std_logic_1164.all;

entity FlipFlop is
	port( clock: in std_logic;
		  D: in std_logic := '0';
	     Q: out std_logic
	    );
end FlipFlop;




 
architecture RTL of FlipFlop is

	signal data: std_logic := D;
   signal en:  std_logic := '1'; 
   signal saida: std_logic;
   signal saida1: std_logic;
	signal saida2: std_logic;
	signal aux1: std_logic := '0';
	signal aux2: std_logic := '0';
	
	begin
	process(clock)
		begin
		if (clock = '1' AND clock'event) then
			saida <= (data nand data);
			saida1 <= (en nand data);
			saida2 <= (en nand saida);
			aux1 <= (saida1 nand aux2);
			aux2 <= (saida2 nand aux1);
	   end if;
	end process;
	Q <= aux1;
end RTL;