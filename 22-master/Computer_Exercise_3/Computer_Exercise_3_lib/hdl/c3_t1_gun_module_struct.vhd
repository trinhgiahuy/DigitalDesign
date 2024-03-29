-- VHDL Entity Computer_Exercise_3_lib.C3_T1_Gun_Module.symbol
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-707-SPC)
--          at - 15:39:53  1.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY C3_T1_Gun_Module IS
   PORT( 
      btn        : IN     std_logic_vector (3 DOWNTO 0);
      clk        : IN     std_logic;
      enable     : IN     std_logic;
      gun_px_idx : IN     std_logic_vector (1 DOWNTO 0);
      rst_n      : IN     std_logic;
      gun_color  : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord    : OUT    std_logic_vector (7 DOWNTO 0);
      x_internal : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord    : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END C3_T1_Gun_Module ;

--
-- VHDL Architecture Computer_Exercise_3_lib.C3_T1_Gun_Module.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-707-SPC)
--          at - 15:39:53  1.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY Computer_Exercise_3_lib;

ARCHITECTURE struct OF C3_T1_Gun_Module IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL d : std_logic_vector(23 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL x_internal_internal : std_logic_vector (7 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_8' of 'adff'
   SIGNAL mw_U_8reg_cval : std_logic_vector(23 DOWNTO 0);

   -- Component Declarations
   COMPONENT Button_Function
   PORT (
      btn        : IN     std_logic_vector (3 DOWNTO 0);
      clk        : IN     std_logic ;
      enable     : IN     std_logic ;
      rst_n      : IN     std_logic ;
      x_internal : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT Gun_pixel
   PORT (
      clk        : IN     std_logic ;
      gun_px_idx : IN     std_logic_vector (1 DOWNTO 0);
      rst_n      : IN     std_logic ;
      x_internal : IN     std_logic_vector (7 DOWNTO 0);
      x_coord    : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord    : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Button_Function USE ENTITY Computer_Exercise_3_lib.Button_Function;
   FOR ALL : Gun_pixel USE ENTITY Computer_Exercise_3_lib.Gun_pixel;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_8' of 'adff'
   gun_color <= mw_U_8reg_cval;
   u_8seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_8reg_cval <= "000000000000000000000000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_8reg_cval <= d;
      END IF;
   END PROCESS u_8seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_0' of 'constval'
   d <= "100000001000000010000000";

   -- Instance port mappings.
   U_6 : Button_Function
      PORT MAP (
         btn        => btn,
         clk        => clk,
         enable     => enable,
         rst_n      => rst_n,
         x_internal => x_internal_internal
      );
   U_7 : Gun_pixel
      PORT MAP (
         clk        => clk,
         gun_px_idx => gun_px_idx,
         rst_n      => rst_n,
         x_internal => x_internal_internal,
         x_coord    => x_coord,
         y_coord    => y_coord
      );

   -- Implicit buffered output assignments
   x_internal <= x_internal_internal;

END struct;
