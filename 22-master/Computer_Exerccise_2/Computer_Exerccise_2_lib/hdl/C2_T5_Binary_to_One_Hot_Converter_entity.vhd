--
-- VHDL Entity Computer_Exerccise_2_lib.C2_T5_Binary_to_One_Hot_Converter.arch_name
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-713-SPC)
--          at - 14:04:57 10.10.2019
--
-- using Mentor Graphics HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY C2_T5_Binary_to_One_Hot_Converter IS
   PORT( 
      binary_in   : IN     std_logic_vector (2 DOWNTO 0);
      one_hot_out : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END C2_T5_Binary_to_One_Hot_Converter ;

