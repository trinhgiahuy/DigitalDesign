--
-- VHDL Entity Computer_Exerccise_2_lib.Basic_Alien_color.arch_name
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-711-SPC)
--          at - 14:40:39 11.10.2019
--
-- using Mentor Graphics HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Basic_Alien_color IS
   PORT( 
      clk       : IN     std_logic;
      hit       : IN     std_logic;
      rst_n     : IN     std_logic;
      alien_col : OUT    std_logic_vector (23 DOWNTO 0)
   );

-- Declarations

END Basic_Alien_color ;

