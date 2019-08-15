-- decodificador e contador 8CD para Display de 7
-- segmentos catodo comum em VHDL
--Objetivo: Incrementar o display de 0 a 9 a cada atualizaçao
-- de clock externo


	library IEEE;
	use IEEE.std_logic_1164.all;
	entity display is 
	port(
		bar	:	out	std_logic_vector(6 downto 0);
		clk	:	in		std_logic);
	end display;
	
	architecture hardware of display is
	begin 
	process(clk)
		variable	counter	:	integer range 0 to 10;
	begin
		if (clk = '1') then
			counter := counter + 1;
			if(counter = 10) then 
				counter := 0;
			end if;
		end if;
		
		case counter is 
			when 0 => bar <= "1111110";
			when 1 => bar <= "0110000";
			when 2 => bar <= "1101101";
			when 3 => bar <= "1111001";
			when 4 => bar <= "0110011";
			when 5 => bar <= "1011011";
			when 6 => bar <= "1011111";
			when 7 => bar <= "1110000";
			when 8 => bar <= "1111111";
			when 9 => bar <= "1111011";
			when others => bar <= "0000000";
		end case;
		
	end process;
	
	end hardware;
			
		