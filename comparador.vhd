library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;

entity comparador is
port (A, B: in std_logic_vector(3 downto 0) ;
saida1, saida2, saida3 : out STD_LOGIC ) ;
end comparador;
architecture Behavior of comparador is
begin
saida1 <= '1' when A = B else '0' ;
saida2 <= '1' when A > B else '0' ;
saida3 <= '1' when A < B else '0' ;
end Behavior ;