library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_comparador is
end tb_comparador;

architecture teste of tb_comparador is
component comparador is
port ( A, B : in  std_logic_vector(3 downto 0);
		saida1, saida2, saida3 : out STD_LOGIC);
end component;
signal X, Y:  std_logic_vector(3 downto 0);
signal S,D,F: std_LOGIC;
begin
instancia_comparador: comparador port map(A=>X,B=>Y,saida1=>S,saida2=>D,saida3=>F);
X <= "0000", "0011" after 20 ns, "1111" after 40 ns, "0100" after 60 ns;
Y <= "0000", "0100" after 10 ns, "0011" after 30 ns, "0001" after 50 ns;
end teste;