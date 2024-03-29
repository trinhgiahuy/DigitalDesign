--
-- VHDL Entity Computer_Exerccise_2_lib.C2_T3_Leftshifter.arch_name
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-713-SPC)
--          at - 13:32:51 10.10.2019
--
-- using Mentor Graphics HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY C2_T3_Leftshifter IS
   PORT( 
      data_in  : IN     std_logic_vector (7 DOWNTO 0);
      data_out : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END C2_T3_Leftshifter ;


--
-- VHDL Architecture Computer_Exerccise_2_lib.C2_T3_Leftshifter.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-713-SPC)
--          at - 13:49:03 10.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF C2_T3_Leftshifter IS

   -- Architecture declarations

   -- Internal signal declarations



BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'and'
   data_out(1) <= data_in(0) AND data_in(0);

   -- ModuleWare code(v1.12) for instance 'U_1' of 'and'
   data_out(7) <= data_in(6) AND data_in(6);

   -- ModuleWare code(v1.12) for instance 'U_2' of 'and'
   data_out(6) <= data_in(5) AND data_in(5);

   -- ModuleWare code(v1.12) for instance 'U_3' of 'and'
   data_out(5) <= data_in(4) AND data_in(4);

   -- ModuleWare code(v1.12) for instance 'U_4' of 'and'
   data_out(4) <= data_in(3) AND data_in(3);

   -- ModuleWare code(v1.12) for instance 'U_5' of 'and'
   data_out(3) <= data_in(2) AND data_in(2);

   -- ModuleWare code(v1.12) for instance 'U_6' of 'and'
   data_out(2) <= data_in(1) AND data_in(1);

   -- ModuleWare code(v1.12) for instance 'U_7' of 'constval'
   data_out(0) <= '0';

   -- Instance port mappings.

END struct;
