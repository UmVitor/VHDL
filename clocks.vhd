

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clocks is
    generic (
        W       :       integer := 32
    );
    port (
        CLK     : in    std_logic;
        RESET   : in    std_logic;
        INP   : in    std_logic_vector(W - 1 downto 0);
        OUTP  : out   std_logic_vector(W - 1 downto 0)
    );
end clocks;

-- Implement the testbench and find the errors in this model.
-- Consider the following expected behavior:
--      Every rising edge of CLK input, the content of INPUT
--      is added to a register chain and used to calculate the
--      mean value over 4 clock periods

architecture arch of clocks is
begin
    process(CLK, RESET,inp) is
        variable var1 : unsigned(W - 1 downto 0);
        variable var2 : unsigned(W - 1 downto 0);
        variable var3 : unsigned(W - 1 downto 0);
        variable var4 : unsigned(W - 1 downto 0);
		  variable tot : 	unsigned(W - 1 downto 0);
    begin
        if (RESET = '1') then
            var1 := to_unsigned(0,W);
            var2 := to_unsigned(0,W);
            var3 := to_unsigned(0,W);
            var4 := to_unsigned(0,W);
            tot  := to_unsigned(0,W);
        elsif (rising_edge(CLK)) then
            var4 := var3;
				    var3 := var2;
				    var2 := var1;
				    var1 := unsigned (INP(W-1 downto 0));
				    
        end if;

        tot := (var1 + var2 + var3 + var4);
        
		  OUTP <= std_logic_vector("00" & tot(W-1 downto 2));
			 

    end process;

end arch;