--
-- VHDL Entity Computer_Exerccise_2_lib.Basic_Alien_Direction.arch_name
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-711-SPC)
--          at - 14:48:55 11.10.2019
--
-- using Mentor Graphics HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Basic_Alien_Direction IS
   PORT( 
      clk       : IN     std_logic;
      enable    : IN     std_logic;
      rst_n     : IN     std_logic;
      x_0       : IN     std_logic;                      -- Condition to switch direction
      x_7       : IN     std_logic;                      -- Condition to switch direction
      direction : OUT    std_logic_vector (1 DOWNTO 0)   -- 2 MSB allow to shift - 2 LSB decide direction
   );

-- Declarations

END Basic_Alien_Direction ;


--
-- VHDL Architecture Computer_Exerccise_2_lib.Basic_Alien_Direction.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-707-SPC)
--          at - 09:35:24 24.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF Basic_Alien_Direction IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL din0  : std_logic;
   SIGNAL din1  : std_logic;
   SIGNAL din2  : std_logic_vector(1 DOWNTO 0);    -- 2 MSB allow to shift - 2 LSB decide direction
   SIGNAL din3  : std_logic_vector(1 DOWNTO 0);    -- 2 MSB allow to shift - 2 LSB decide direction
   SIGNAL din4  : std_logic;
   SIGNAL dout  : std_logic;                       -- Condition to switch direction
   SIGNAL dout4 : std_logic;
   SIGNAL qb    : std_logic;


   -- ModuleWare signal declarations(v1.12) for instance 'U_7' of 'adff'
   SIGNAL mw_U_7reg_cval : std_logic;


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_7' of 'adff'
   din0 <= mw_U_7reg_cval;
   qb <= NOT(mw_U_7reg_cval);
   u_7seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_7reg_cval <= '0';
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_7reg_cval <= dout4;
      END IF;
   END PROCESS u_7seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'and'
   dout <= din0 AND x_7;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'and'
   din4 <= x_0 AND qb;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'constval'
   din3 <= "00";

   -- ModuleWare code(v1.12) for instance 'U_2' of 'merge'
   din2 <= qb & din0;

   -- ModuleWare code(v1.12) for instance 'U_0' of 'mux'
   u_0combo_proc: PROCESS(din0, qb, din1)
   BEGIN
      CASE din1 IS
      WHEN '0' => dout4 <= din0;
      WHEN '1' => dout4 <= qb;
      WHEN OTHERS => dout4 <= 'X';
      END CASE;
   END PROCESS u_0combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'mux'
   u_3combo_proc: PROCESS(din3, din2, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => direction <= din3;
      WHEN '1' => direction <= din2;
      WHEN OTHERS => direction <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_3combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_1' of 'or'
   din1 <= dout OR din4;

   -- Instance port mappings.

END struct;
