-- VHDL Entity tb_lib.tb_write_sequencer.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-708-SPC)
--          at - 11:25:06 09/18/19
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_write_sequencer IS
-- Declarations

END tb_write_sequencer ;

--
-- VHDL Architecture tb_lib.tb_write_sequencer.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-708-SPC)
--          at - 10:03:14 19.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY Computer_Exercise_3_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_write_sequencer IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL alien_coord_const : std_logic_vector(7 DOWNTO 0);
   SIGNAL alien_def_const   : std_logic;
   SIGNAL clk               : std_logic;
   SIGNAL enable            : std_logic;
   SIGNAL rst_n             : std_logic;
   SIGNAL simulation_ends   : std_logic;
   SIGNAL wr_done           : std_logic;
   SIGNAL write             : std_logic;
   SIGNAL write_ready       : std_logic;


   -- Component Declarations
   COMPONENT C3_T2_Write_Sequencer
   PORT (
      clk           : IN     std_logic ;
      rst           : IN     std_logic ;
      write_ready   : IN     std_logic ;
      enable        : OUT    std_logic ;
      enable_slow   : OUT    std_logic ;
      frame_done    : OUT    std_logic ;
      gun_px_ix     : OUT    std_logic_vector (1 DOWNTO 0);
      module_select : OUT    std_logic_vector (1 DOWNTO 0);
      write         : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT wr_seq_tester
   PORT (
      enable          : IN     std_logic;
      simulation_ends : IN     std_logic;
      wr_done         : IN     std_logic;
      write           : IN     std_logic;
      clk             : OUT    std_logic;
      rst_n           : OUT    std_logic;
      write_ready     : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : C3_T2_Write_Sequencer USE ENTITY Computer_Exercise_3_lib.C3_T2_Write_Sequencer;
   FOR ALL : wr_seq_tester USE ENTITY tb_lib.wr_seq_tester;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'alien_coord_const' of 'constval'
   alien_coord_const <= "00000001";

   -- ModuleWare code(v1.12) for instance 'alien_defeated_const' of 'constval'
   alien_def_const <= '0';

   -- ModuleWare code(v1.12) for instance 'simulation_ends' of 'constval'
   simulation_ends <= '1';

   -- Instance port mappings.
   U_0 : C3_T2_Write_Sequencer
      PORT MAP (
         clk           => clk,
         rst           => rst_n,
         write_ready   => write_ready,
         enable        => enable,
         enable_slow   => OPEN,
         frame_done    => wr_done,
         gun_px_ix     => OPEN,
         module_select => OPEN,
         write         => write
      );
   U_1 : wr_seq_tester
      PORT MAP (
         enable          => enable,
         wr_done         => wr_done,
         write           => write,
         clk             => clk,
         rst_n           => rst_n,
         write_ready     => write_ready,
         simulation_ends => simulation_ends
      );

END struct;
