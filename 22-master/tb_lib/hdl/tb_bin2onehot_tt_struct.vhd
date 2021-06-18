-- VHDL Entity tb_lib.tb_bin2onehot_tt.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-713-SPC)
--          at - 15:32:10 06/12/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_bin2onehot_tt IS
-- Declarations

END tb_bin2onehot_tt ;

--
-- VHDL Architecture tb_lib.tb_bin2onehot_tt.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-713-SPC)
--          at - 14:23:30 10.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY Computer_Exerccise_2_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_bin2onehot_tt IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL correct : std_logic;
   SIGNAL res     : std_logic_vector(7 DOWNTO 0);
   SIGNAL to_duv  : std_logic_vector(2 DOWNTO 0);


   -- Component Declarations
   COMPONENT C2_T5_Binary_to_One_Hot_Converter
   PORT (
      binary_in   : IN     std_logic_vector (2 DOWNTO 0);
      one_hot_out : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT tt_tester
   PORT (
      res     : IN     std_logic_vector (7 DOWNTO 0);
      correct : OUT    std_logic ;
      to_duv  : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : C2_T5_Binary_to_One_Hot_Converter USE ENTITY Computer_Exerccise_2_lib.C2_T5_Binary_to_One_Hot_Converter;
   FOR ALL : tt_tester USE ENTITY tb_lib.tt_tester;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : C2_T5_Binary_to_One_Hot_Converter
      PORT MAP (
         binary_in   => to_duv,
         one_hot_out => res
      );
   U_0 : tt_tester
      PORT MAP (
         res     => res,
         correct => correct,
         to_duv  => to_duv
      );

END struct;
