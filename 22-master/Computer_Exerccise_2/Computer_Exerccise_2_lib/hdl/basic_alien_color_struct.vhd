--
-- VHDL Entity Computer_Exerccise_2_lib.Basic_Alien_color.arch_name
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-711-SPC)
--          at - 14:40:39 11.10.2019
--
-- using Mentor Graphics HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Basic_Alien_color IS
   PORT( 
      clk       : IN     std_logic;
      hit       : IN     std_logic;
      rst_n     : IN     std_logic;
      alien_col : OUT    std_logic_vector (23 DOWNTO 0)
   );

-- Declarations

END Basic_Alien_color ;


--
-- VHDL Architecture Computer_Exerccise_2_lib.Basic_Alien_color.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-711-SPC)
--          at - 15:27:46 11.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF Basic_Alien_color IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL d     : std_logic_vector(23 DOWNTO 0);
   SIGNAL din3  : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout5 : std_logic_vector(23 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_0' of 'adff'
   SIGNAL mw_U_0reg_cval : std_logic_vector(23 DOWNTO 0);


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'adff'
   alien_col <= mw_U_0reg_cval;
   u_0seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_0reg_cval <= "000000000000000000000000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_0reg_cval <= dout5;
      END IF;
   END PROCESS u_0seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_14' of 'constval'
   d <= "000000001111111100000000";

   -- ModuleWare code(v1.12) for instance 'U_15' of 'constval'
   din3 <= "000000000000000000000000";

   -- ModuleWare code(v1.12) for instance 'U_13' of 'mux'
   u_13combo_proc: PROCESS(d, din3, hit)
   BEGIN
      CASE hit IS
      WHEN '0' => dout5 <= d;
      WHEN '1' => dout5 <= din3;
      WHEN OTHERS => dout5 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_13combo_proc;

   -- Instance port mappings.

END struct;
