LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity tb_flipflop is
end tb_flipflop;

architecture tb_arch of tb_flipflop is

    component flipflop
        port( clock: in std_logic;
		  D: in std_logic;
	      Q: out std_logic
	    );
		
    end component;
	

   signal clk : std_logic := '0';
   signal dados:  std_logic := '0';
	signal saida: std_logic := '0' ;
	 
   begin
   	instacia: flipflop port map (CLOCK => clk, D => dados, Q=>saida);

		
   
			--if(rising_edge(clk)) then	
				dados <= '0' after 0 ns,
				 '1' after 10 ns,
				 '0' after 15 ns,
				 '1' after 30 ns,
				 '0' after 36 ns,
				 '1' after 50 ns,
				 '0' after 57 ns;			
				
				clk <= not clk after 10 ns;
				
 			  --end if;
		

end tb_arch;
