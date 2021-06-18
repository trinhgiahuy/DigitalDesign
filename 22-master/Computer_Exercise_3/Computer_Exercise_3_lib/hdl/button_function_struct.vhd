-- VHDL Entity Computer_Exercise_3_lib.Button_Function.symbol
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-705-SPC)
--          at - 12:18:30 25.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Button_Function IS
   PORT( 
      btn        : IN     std_logic_vector (3 DOWNTO 0);
      clk        : IN     std_logic;
      enable     : IN     std_logic;
      rst_n      : IN     std_logic;
      x_internal : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END Button_Function ;

--
-- VHDL Architecture Computer_Exercise_3_lib.Button_Function.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-705-SPC)
--          at - 12:51:51 25.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY Computer_Exerccise_2_lib;

ARCHITECTURE struct OF Button_Function IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL data_out : std_logic_vector(7 DOWNTO 0);
   SIGNAL din1     : std_logic;
   SIGNAL din2     : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout     : std_logic_vector(1 DOWNTO 0);
   SIGNAL dout1    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout2    : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL x_internal_internal : std_logic_vector (7 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_7' of 'adff'
   SIGNAL mw_U_7reg_cval : std_logic_vector(7 DOWNTO 0);

   -- Component Declarations
   COMPONENT C2_T3_Leftshifter
   PORT (
      data_in  : IN     std_logic_vector (7 DOWNTO 0);
      data_out : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT C2_T4_Rightshifter
   PORT (
      x : IN     std_logic_vector (7 DOWNTO 0);
      y : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : C2_T3_Leftshifter USE ENTITY Computer_Exerccise_2_lib.C2_T3_Leftshifter;
   FOR ALL : C2_T4_Rightshifter USE ENTITY Computer_Exerccise_2_lib.C2_T4_Rightshifter;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_7' of 'adff'
   x_internal_internal <= mw_U_7reg_cval;
   u_7seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_7reg_cval <= "00001000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_7reg_cval <= dout1;
      END IF;
   END PROCESS u_7seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'and'
   din1 <= enable AND btn(3) AND NOT(x_internal_internal(1));

   -- ModuleWare code(v1.12) for instance 'U_5' of 'and'
   dout2 <= NOT(x_internal_internal(6)) AND btn(1) AND enable;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'merge'
   dout <= din1 & dout2;

   -- ModuleWare code(v1.12) for instance 'U_2' of 'mux'
   u_2combo_proc: PROCESS(x_internal_internal, data_out, din2, dout)
   BEGIN
      CASE dout IS
      WHEN "00" => dout1 <= x_internal_internal;
      WHEN "01" => dout1 <= data_out;
      WHEN "10" => dout1 <= din2;
      WHEN "11" => dout1 <= x_internal_internal;
      WHEN OTHERS => dout1 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_2combo_proc;

   -- Instance port mappings.
   U_1 : C2_T3_Leftshifter
      PORT MAP (
         data_in  => x_internal_internal,
         data_out => data_out
      );
   U_0 : C2_T4_Rightshifter
      PORT MAP (
         x => x_internal_internal,
         y => din2
      );

   -- Implicit buffered output assignments
   x_internal <= x_internal_internal;

END struct;
