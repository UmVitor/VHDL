--testbench
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_alu is
end tb_alu;


architecture teste of tb_alu is
  component alu is
    port (  CONTROL : in    std_logic_vector(3 downto 0);
        SRC1    : in    std_logic_vector(31 downto 0);
        SRC2    : in    std_logic_vector(31 downto 0);
        RESULT  : out   std_logic_vector(31 downto 0);
        ZERO    : out   std_logic
    );
  end component;
  signal X, Y, R:  std_logic_vector(31 downto 0);                                        
  signal C:  std_logic_vector(3 downto 0);
  signal Z: std_LOGIC;
  begin
    instancia_alu: alu port map(SRC1=>X,SRC2=>Y,CONTROL=>C,RESULT=>R,ZERO=>Z);
      C <=  "0000",
            "0001" after 20 ns,
            "0010" after 40 ns,
            "0110" after 60 ns,
            "0111" after 60 ns,
            "1100" after 60 ns;
end teste;
