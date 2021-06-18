--
-- VHDL Entity ComputerExercise1_lib.entity_name.arch_name
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-709-SPC)
--          at - 15:25:41  4.10.2019
--
-- using Mentor Graphics HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c1_t3_hello_led_top_level IS
   PORT( 
      btn     : IN     std_logic_vector (3 DOWNTO 0);
      sw0     : IN     std_logic;
      color   : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c1_t3_hello_led_top_level ;

