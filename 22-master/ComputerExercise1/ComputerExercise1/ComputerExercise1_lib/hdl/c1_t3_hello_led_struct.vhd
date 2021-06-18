--
-- VHDL Entity ComputerExercise1_lib.entity_name.arch_name
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-709-SPC)
--          at - 12:45:38  4.10.2019
--
-- using Mentor Graphics HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c1_t3_hello_led IS
   PORT( 
      btn       : IN     std_logic_vector (3 DOWNTO 0);
      sw0       : IN     std_logic;
      color_BGR : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord   : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord   : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c1_t3_hello_led ;


--
-- VHDL Architecture ComputerExercise1_lib.c1_t3_hello_led.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-703-SPC)
--          at - 17:26:29  7.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c1_t3_hello_led IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL din0  : std_logic_vector(7 DOWNTO 0);
   SIGNAL din1  : std_logic_vector(7 DOWNTO 0);
   SIGNAL din2  : std_logic_vector(23 DOWNTO 0);
   SIGNAL din3  : std_logic;
   SIGNAL dout  : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout1 : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout2 : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout3 : std_logic;
   SIGNAL dout4 : std_logic;
   SIGNAL dout5 : std_logic;



BEGIN

   -- ModuleWare code(v1.12) for instance 'U_2' of 'and'
   dout4 <= btn(2) AND din3;

   -- ModuleWare code(v1.12) for instance 'U_11' of 'and'
   dout5 <= din3 AND btn(1);

   -- ModuleWare code(v1.12) for instance 'U_99' of 'and'
   dout3 <= btn(0) AND din3;

   -- ModuleWare code(v1.12) for instance 'U_0' of 'constval'
   dout <= "01000000";

   -- ModuleWare code(v1.12) for instance 'U_5' of 'constval'
   din1 <= "10000000";

   -- ModuleWare code(v1.12) for instance 'U_6' of 'constval'
   dout1 <= "10000000";

   -- ModuleWare code(v1.12) for instance 'U_7' of 'constval'
   din0 <= "01000000";

   -- ModuleWare code(v1.12) for instance 'U_8' of 'constval'
   dout2 <= "100000000000011111010000";

   -- ModuleWare code(v1.12) for instance 'U_9' of 'constval'
   din2 <= "000001000000001001011000";

   -- ModuleWare code(v1.12) for instance 'U_12' of 'constval'
   din3 <= '1';

   -- ModuleWare code(v1.12) for instance 'U_3' of 'mux'
   u_3combo_proc: PROCESS(dout, din1, dout3)
   BEGIN
      CASE dout3 IS
      WHEN '0' => x_coord <= dout;
      WHEN '1' => x_coord <= din1;
      WHEN OTHERS => x_coord <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_3combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'mux'
   u_4combo_proc: PROCESS(din0, dout1, dout5)
   BEGIN
      CASE dout5 IS
      WHEN '0' => y_coord <= din0;
      WHEN '1' => y_coord <= dout1;
      WHEN OTHERS => y_coord <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_4combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_10' of 'mux'
   u_10combo_proc: PROCESS(din2, dout2, dout4)
   BEGIN
      CASE dout4 IS
      WHEN '0' => color_BGR <= din2;
      WHEN '1' => color_BGR <= dout2;
      WHEN OTHERS => color_BGR <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_10combo_proc;

   -- Instance port mappings.

END struct;