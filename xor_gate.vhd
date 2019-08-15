-- porta lógica XOR

  library IEEE;
  use IEEE.std_logic_1164.all;
  
  entity xor_gate is
  port(
      in1 : in  std_logic;
      in2 : in  std_logic;
      o   : out std_logic
      );
  end  xor_gate;
  
  architecture hardware of xor_gate is 
  begin
      o <= in1 xor in2;
  end hardware;
