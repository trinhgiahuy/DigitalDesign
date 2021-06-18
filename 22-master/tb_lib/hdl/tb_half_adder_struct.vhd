-- VHDL Entity tb_lib.tb_half_adder.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-717-SPC)
--          at - 13:35:16 06/05/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_half_adder IS
-- Declarations

END tb_half_adder ;

--
-- VHDL Architecture tb_lib.tb_half_adder.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-717-SPC)
--          at - 13:32:44 30.09.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY ComputerExercise1_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_half_adder IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL carry : std_logic;
   SIGNAL sum   : std_logic;
   SIGNAL sw0   : std_logic;
   SIGNAL sw1   : std_logic;


   -- Component Declarations
   COMPONENT c1_t1_half_adder
   PORT (
      sw0   : IN     std_logic ;
      sw1   : IN     std_logic ;
      carry : OUT    std_logic ;
      sum   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT half_adder_test_block
   PORT (
      carry : IN     std_logic;
      sum   : IN     std_logic;
      sw0   : OUT    std_logic;
      sw1   : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c1_t1_half_adder USE ENTITY ComputerExercise1_lib.c1_t1_half_adder;
   FOR ALL : half_adder_test_block USE ENTITY tb_lib.half_adder_test_block;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : c1_t1_half_adder
      PORT MAP (
         sw0   => sw0,
         sw1   => sw1,
         carry => carry,
         sum   => sum
      );
   U_0 : half_adder_test_block
      PORT MAP (
         carry => carry,
         sum   => sum,
         sw0   => sw0,
         sw1   => sw1
      );

END struct;
