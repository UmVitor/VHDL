LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity tb_pseudo_mux is
end tb_pseudo_mux;

architecture arch of tb_pseudo_mux is

    component pseudo_mux
        port(
		  
		  RESET   : in    std_logic; -- reset input
        CLOCK   : in    std_logic; -- clock input
        S       : in    std_logic; -- control input
        A,B,C,D : in    std_logic; -- data inputs
        Q       : out   std_logic  -- data output
		  );
		
    end component;
	

   signal clk : std_logic := '0';
   signal X,Y,Z,W:  std_logic;
	signal R: std_logic := '0' ;
	signal MD: std_logic;
	 
   begin
   	instacia: pseudo_mux port map (CLOCK => clk, A => X, B=>Y, C =>Z, D =>W, RESET =>R, S=> MD);

  
   	process(clk,X,Y,Z,W,MD)
   	begin
        	
			
			clk <= not clk after 5 ns;
   
			--if(rising_edge(clk)) then	
				MD <= '1' after 0 ns;
				Md <= '0' after 1 ns;
				X<= '1' after 0 ns;
				X<= '0' after 20 ns;
				
				MD <= '1' after 20 ns;
				Md <= '0' after 21 ns;
				Y<= '1' after 20 ns;
				Y<= '0' after 30 ns;
				
				MD <= '1' after 30 ns;
				Md <= '0' after 31 ns;
				Z<= '1' after 30 ns;
				Z<= '0' after 40 ns;
				
				MD <= '1' after 40 ns;
				Md <= '0' after 41 ns;
				W<= '1' after 40 ns;
				W<= '0' after 50 ns;
				
				
 			  --end if;
			  end process;

end arch;
