LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_clocks IS
END tb_clocks;

ARCHITECTURE behavior OF tb_clocks IS

    COMPONENT clocks PORT(
        CLK     : in    std_logic;
        RESET   : in    std_logic;
        INP   : in    std_logic_vector(31 downto 0);
        OUTP  : out   std_logic_vector(31 downto 0)

        );

    END COMPONENT;


   signal clk1 : std_logic := '0';
   --constant clk_period : time := 2 ns;
   signal X:  std_logic_vector(31 downto 0);
   SIGNAL SAIDA:   std_logic_vector(31 downto 0);
   signal ttr: std_logic := '0';


BEGIN

   instacia_test: clocks PORT MAP(clk => clk1, INP=>X, OUTP=>SAIDA, reset=>ttr);

     
    X <= "00000000000000000000000000000001",
     "00000000000000000000000000000011" after 3 ns,
     "00000000000000000000000000000111" after 7 ns,
     "00000000000000000000000000000101" after 11 ns,
     "00000000000000000000000000000110" after 15 ns,
     "00000000000000000000000000000100" after 19 ns,
     "00000000000000000000000000010000" after 23 ns;

clk1 <= not clk1 after 2 ns;

END behavior;
