-- VHDL Entity tb_lib.tb_incrementer.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-722-SPC)
--          at - 13:52:37 06/05/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_incrementer IS
-- Declarations

END tb_incrementer ;

--
-- VHDL Architecture tb_lib.tb_incrementer.struct
--
-- Created:
--          by - qkrasi.UNKNOWN (HTC219-722-SPC)
--          at - 12:22:00  8.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.numeric_std.all;

LIBRARY Computer_Exerccise_2_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_incrementer IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL correct : std_logic;
   SIGNAL result  : std_logic_vector(2 DOWNTO 0);
   SIGNAL to_duv  : std_logic_vector(2 DOWNTO 0);


   -- Component Declarations
   COMPONENT C2_T1_Incrementer
   PORT (
      Input  : IN     std_logic_vector (2 DOWNTO 0);
      Output : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT incrementer_test_block
   PORT (
      result  : IN     std_logic_vector (2 DOWNTO 0);
      correct : OUT    std_logic ;
      to_duv  : OUT    std_logic_vector (2 Downto 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : C2_T1_Incrementer USE ENTITY Computer_Exerccise_2_lib.C2_T1_Incrementer;
   FOR ALL : incrementer_test_block USE ENTITY tb_lib.incrementer_test_block;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : C2_T1_Incrementer
      PORT MAP (
         Input  => to_duv,
         Output => result
      );
   U_0 : incrementer_test_block
      PORT MAP (
         result  => result,
         correct => correct,
         to_duv  => to_duv
      );

END struct;
