--
-- VHDL Entity Computer_Exerccise_2_lib.Basic_Alien_Direction.arch_name
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-711-SPC)
--          at - 14:48:55 11.10.2019
--
-- using Mentor Graphics HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Basic_Alien_Direction IS
   PORT( 
      clk       : IN     std_logic;
      enable    : IN     std_logic;
      rst_n     : IN     std_logic;
      x_0       : IN     std_logic;                      -- Condition to switch direction
      x_7       : IN     std_logic;                      -- Condition to switch direction
      direction : OUT    std_logic_vector (1 DOWNTO 0)   -- 2 MSB allow to shift - 2 LSB decide direction
   );

-- Declarations

END Basic_Alien_Direction ;

