--
-- VHDL Entity Computer_Exerccise_2_lib.entity_name.arch_name
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-711-SPC)
--          at - 14:36:38 11.10.2019
--
-- using Mentor Graphics HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Basic_Alien_y_coord IS
   PORT( 
      clk     : IN     std_logic;
      rst_n   : IN     std_logic;
      y_coord : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END Basic_Alien_y_coord ;

