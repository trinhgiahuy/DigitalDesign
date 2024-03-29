-- VHDL Entity Computer_Exercise_5_lib.C5_Game_Top_Level.symbol
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-709-SPC)
--          at - 16:26:42 21.01.2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY C5_Game_Top_Level IS
   PORT( 
      btn     : IN     std_logic_vector (3 DOWNTO 0);
      clk     : IN     std_logic;
      rst_n   : IN     std_logic;
      sw0     : IN     std_logic;
      channel : OUT    std_logic_vector (7 DOWNTO 0);
      lat     : OUT    std_logic;
      s_clk   : OUT    std_logic;
      s_rst   : OUT    std_logic;
      s_sda   : OUT    std_logic;
      sb      : OUT    std_logic
   );

-- Declarations

END C5_Game_Top_Level ;

--
-- VHDL Architecture Computer_Exercise_5_lib.C5_Game_Top_Level.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-709-SPC)
--          at - 16:26:42 21.01.2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY Computer_Exercise_3_lib;
LIBRARY Computer_Exercise_5_lib;

ARCHITECTURE struct OF C5_Game_Top_Level IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL color         : std_logic_vector(23 DOWNTO 0);
   SIGNAL frame_written : std_logic;
   SIGNAL w_rdy         : std_logic;
   SIGNAL write_out     : std_logic;
   SIGNAL xw            : std_logic_vector(7 DOWNTO 0);
   SIGNAL yw            : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT C3_T2_Top_Level
   PORT (
      btn           : IN     std_logic_vector (3 DOWNTO 0);
      clk           : IN     std_logic ;
      rst_n         : IN     std_logic ;
      sw0           : IN     std_logic ;
      w_rdy         : IN     std_logic ;
      color         : OUT    std_logic_vector (23 DOWNTO 0);
      frame_written : OUT    std_logic ;
      write_out     : OUT    std_logic ;
      xw            : OUT    std_logic_vector (7 DOWNTO 0);
      yw            : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT C5_Dislay_Top_Level
   PORT (
      clk           : IN     std_logic ;
      frame_written : IN     std_logic ;
      pixd_in       : IN     std_logic_vector (23 DOWNTO 0);
      rst_n         : IN     std_logic ;
      write         : IN     std_logic ;
      xw            : IN     std_logic_vector (7 DOWNTO 0);
      yw            : IN     std_logic_vector (7 DOWNTO 0);
      channel       : OUT    std_logic_vector (7 DOWNTO 0);
      lat           : OUT    std_logic ;
      s_clk         : OUT    std_logic ;
      s_rst         : OUT    std_logic ;
      s_sda         : OUT    std_logic ;
      sb            : OUT    std_logic ;
      w_rdy         : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : C3_T2_Top_Level USE ENTITY Computer_Exercise_3_lib.C3_T2_Top_Level;
   FOR ALL : C5_Dislay_Top_Level USE ENTITY Computer_Exercise_5_lib.C5_Dislay_Top_Level;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : C3_T2_Top_Level
      PORT MAP (
         btn           => btn,
         clk           => clk,
         rst_n         => rst_n,
         sw0           => sw0,
         w_rdy         => w_rdy,
         color         => color,
         frame_written => frame_written,
         write_out     => write_out,
         xw            => xw,
         yw            => yw
      );
   U_0 : C5_Dislay_Top_Level
      PORT MAP (
         clk           => clk,
         frame_written => frame_written,
         pixd_in       => color,
         rst_n         => rst_n,
         write         => write_out,
         xw            => xw,
         yw            => yw,
         channel       => channel,
         lat           => lat,
         s_clk         => s_clk,
         s_rst         => s_rst,
         s_sda         => s_sda,
         sb            => sb,
         w_rdy         => w_rdy
      );

END struct;
