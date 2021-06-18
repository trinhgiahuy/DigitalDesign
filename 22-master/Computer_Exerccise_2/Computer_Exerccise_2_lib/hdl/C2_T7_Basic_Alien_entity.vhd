--
-- VHDL Entity Computer_Exerccise_2_lib.C2_T7_Basic_Alien.arch_name
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-711-SPC)
--          at - 11:22:06 11.10.2019
--
-- using Mentor Graphics HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY C2_T7_Basic_Alien IS
   PORT( 
      clk         : IN     std_logic;
      enable      : IN     std_logic;
      enable_slow : IN     std_logic;
      hit         : IN     std_logic;
      rst_n       : IN     std_logic;
      speed       : IN     std_logic;
      alien_col   : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord     : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord     : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END C2_T7_Basic_Alien ;

