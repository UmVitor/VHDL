--                                     |                             |
--                                     |                             |
--                                     |                             |
-- Decodificador 2 para 4              |       Truth Table           |              Entity 
--                                     |                             |
-- Kit EE02-SOQ ITEM                   |  EN  B1  B0 | Y3 Y2 Y1 Y0   |             __________
--                                     |   0   0   0 |  Z  Z  Z  Z   |      B0 ---| p41      |
-- FPGA: família Cyclone II            |   0   0   1 |  Z  Z  Z  Z   |      B1 ---| p42  p44 |--- Y0
--                                     |   0   1   0 |  Z  Z  Z  Z   |            |      p45 |--- Y1
--                                     |   0   1   1 |  Z  Z  Z  Z   |            |      p52 |--- Y2
--                                     |   1   0   0 |  0  0  0  1   |      EN ---| p32  p53 |--- Y3
--                                     |   1   0   1 |  0  0  1  0   |            |__________|
--                                     |   1   1   0 |  0  1  0  0   |
--                                     |   1   1   1 |  1  0  0  0   |
--                                     |                             |
--
--
	
	library IEEE;
	use IEEE.std_logic_1164.all;
	
	entity decodificador is port
	(
		B	:	in 	std_logic_vector (1 downto 0);   -- entradas B1 e B0 (vector)
		Y	:	out 	std_logic_vector (3 downto 0);	-- saidas Y (vetor)
		EN	:	in		std_logic
		
	);
	end decodificador;
	
	architecture hardware of decodificador is 
	begin
		process(B,EN) -- O que está dentro do process é "compilado" de forma sequencial
			begin
				y <= "ZZZZ";	-- Alta impedancia
				
				if(EN = '1') then
					case B is 
						when "00" => Y <= "0001";
						when "01" => Y <= "0010";
						when "10" => Y <= "0100";
						when "11" => Y <= "1000";
						when others => Y <= "0000";
					end case;
				end if;
		end process;
	end hardware;