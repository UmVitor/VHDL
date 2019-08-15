-- bancada virtual da porta XOR

  entity testbench1 is end;     -- testbench1 � uma entidade sem entradas ou saidas 
  library IEEE;
  use IEEE.std_logic_1164.all;
  use std.textio.all;
  
  architecture  tb_xor_gate of testbench1 is 
  
  component xor_gate
      port(
        in1 : in  std_logic;
        in2 : in  std_logic;
        o   : out std_logic
      );
  end  component;
  
  --sinais auxiliares para  interconexcao ao processo de estimulo
  
  signal  i_1 : std_logic;
  signal  i_2 : std_logic;
  
  -- codigo concorrente
  
  begin
  
  -- Intancia do componente xor_gate para interconxao do componente com o processo de estimilo 
  
  xor1 : xor_gate port map (in1 => i_1, in2 => i_2, o => open);
    
  estimulo  : process
  begin
      wait for 5 ns; i_1 <= '0'; i_2 <= '0';
      wait for 5 ns; i_1 <= '1';
      wait for 5 ns; i_2 <= '1';
      wait for 5 ns; i_1 <= '0';
end process estimulo;
end tb_xor_gate;