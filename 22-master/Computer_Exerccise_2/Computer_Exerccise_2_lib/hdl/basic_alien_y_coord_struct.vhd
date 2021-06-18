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


--
-- VHDL Architecture Computer_Exerccise_2_lib.Basic_Alien_y_coord.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-707-SPC)
--          at - 10:47:28 23.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF Basic_Alien_y_coord IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL din0 : std_logic_vector(7 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_1' of 'adff'
   SIGNAL mw_U_1reg_cval : std_logic_vector(7 DOWNTO 0);


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_1' of 'adff'
   y_coord <= mw_U_1reg_cval;
   u_1seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_1reg_cval <= "00000001";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_1reg_cval <= din0;
      END IF;
   END PROCESS u_1seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_12' of 'constval'
   din0 <= "00000001";

   -- Instance port mappings.

END struct;
