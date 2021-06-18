-- VHDL Entity tb_lib.hit_test_generator.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-705-SPC)
--          at - 09:41:22 10/08/19
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY hit_test_generator IS
   PORT( 
      clk      : IN     std_logic;
      mode     : IN     std_logic;
      rst_n    : IN     std_logic;
      alien_x  : OUT    std_logic_vector (7 DOWNTO 0);
      alien_y  : OUT    std_logic_vector (7 DOWNTO 0);
      btn      : OUT    std_logic;
      bullet_x : OUT    std_logic_vector (7 DOWNTO 0);
      bullet_y : OUT    std_logic_vector (7 DOWNTO 0);
      done     : OUT    std_logic;
      gun_x    : OUT    std_logic_vector (7 DOWNTO 0);
      ref_hit  : OUT    std_logic
   );

-- Declarations

END hit_test_generator ;

--
-- VHDL Architecture tb_lib.hit_test_generator.struct
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-705-SPC)
--          at - 09:41:22 10/08/19
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY tb_lib;

ARCHITECTURE struct OF hit_test_generator IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL alien_x_adv   : std_logic_vector(7 DOWNTO 0);
   SIGNAL alien_x_basic : std_logic_vector(7 DOWNTO 0);
   SIGNAL done_adv      : std_logic;
   SIGNAL done_basic    : std_logic;
   SIGNAL ref_adv       : std_logic;
   SIGNAL ref_basic     : std_logic;


   -- Component Declarations
   COMPONENT adv_test_case
   PORT (
      clk         : IN     std_logic ;
      rst_n       : IN     std_logic ;
      alien_x_adv : OUT    std_logic_vector (7 DOWNTO 0);
      alien_y     : OUT    std_logic_vector (7 DOWNTO 0);
      bullet_x    : OUT    std_logic_vector (7 DOWNTO 0);
      bullet_y    : OUT    std_logic_vector (7 DOWNTO 0);
      done_adv    : OUT    std_logic ;
      ref_adv     : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT basic_test_case
   PORT (
      clk           : IN     std_logic ;
      rst_n         : IN     std_logic ;
      alien_x_basic : OUT    std_logic_vector (7 DOWNTO 0);
      btn           : OUT    std_logic ;
      done_basic    : OUT    std_logic ;
      gun_x         : OUT    std_logic_vector (7 DOWNTO 0);
      ref_basic     : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : adv_test_case USE ENTITY tb_lib.adv_test_case;
   FOR ALL : basic_test_case USE ENTITY tb_lib.basic_test_case;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'sel_alien_x' of 'mux'
   sel_alien_xcombo_proc: PROCESS(alien_x_basic, alien_x_adv, mode)
   BEGIN
      CASE mode IS
      WHEN '0' => alien_x <= alien_x_basic;
      WHEN '1' => alien_x <= alien_x_adv;
      WHEN OTHERS => alien_x <= (OTHERS => 'X');
      END CASE;
   END PROCESS sel_alien_xcombo_proc;

   -- ModuleWare code(v1.12) for instance 'sel_done' of 'mux'
   sel_donecombo_proc: PROCESS(done_basic, done_adv, mode)
   BEGIN
      CASE mode IS
      WHEN '0' => done <= done_basic;
      WHEN '1' => done <= done_adv;
      WHEN OTHERS => done <= 'X';
      END CASE;
   END PROCESS sel_donecombo_proc;

   -- ModuleWare code(v1.12) for instance 'sel_ref_hit' of 'mux'
   sel_ref_hitcombo_proc: PROCESS(ref_basic, ref_adv, mode)
   BEGIN
      CASE mode IS
      WHEN '0' => ref_hit <= ref_basic;
      WHEN '1' => ref_hit <= ref_adv;
      WHEN OTHERS => ref_hit <= 'X';
      END CASE;
   END PROCESS sel_ref_hitcombo_proc;

   -- Instance port mappings.
   U_3 : adv_test_case
      PORT MAP (
         clk         => clk,
         rst_n       => rst_n,
         alien_x_adv => alien_x_adv,
         alien_y     => alien_y,
         bullet_x    => bullet_x,
         bullet_y    => bullet_y,
         done_adv    => done_adv,
         ref_adv     => ref_adv
      );
   U_4 : basic_test_case
      PORT MAP (
         clk           => clk,
         rst_n         => rst_n,
         alien_x_basic => alien_x_basic,
         btn           => btn,
         done_basic    => done_basic,
         gun_x         => gun_x,
         ref_basic     => ref_basic
      );

END struct;
