-- VHDL Entity tb_lib.tb_victory.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-706-SPC)
--          at - 16:21:43 06/04/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_victory IS
-- Declarations

END tb_victory ;

--
-- VHDL Architecture tb_lib.tb_victory.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-706-SPC)
--          at - 12:50:54 22.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY Computer_Exercise_4_hdl_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_victory IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL clk          : std_logic;
   SIGNAL color        : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixel_amount : std_logic_vector(5 DOWNTO 0);
   SIGNAL rst_n        : std_logic;
   SIGNAL x_coordinate : std_logic_vector(7 DOWNTO 0);
   SIGNAL y_coordinate : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT C4_T2_Victory_Effect
   PORT (
      clk          : IN     std_logic ;
      rst          : IN     std_logic ;
      color        : OUT    std_logic_vector (23 DOWNTO 0);
      victory_done : OUT    std_logic ;
      x            : OUT    std_logic_vector (7 DOWNTO 0);
      y            : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT victory_text_test_block
   PORT (
      color        : IN     std_logic_vector (23 DOWNTO 0);
      pixel_amount : IN     std_logic_vector (5 DOWNTO 0);
      x_data       : IN     std_logic_vector (7 DOWNTO 0);
      y_data       : IN     std_logic_vector (7 DOWNTO 0);
      clk          : OUT    std_logic;
      rst_n        : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : C4_T2_Victory_Effect USE ENTITY Computer_Exercise_4_hdl_lib.C4_T2_Victory_Effect;
   FOR ALL : victory_text_test_block USE ENTITY tb_lib.victory_text_test_block;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'pixel_amount' of 'constval'
   pixel_amount <= "001101";

   -- Instance port mappings.
   U_1 : C4_T2_Victory_Effect
      PORT MAP (
         clk          => clk,
         rst          => rst_n,
         color        => color,
         victory_done => OPEN,
         x            => x_coordinate,
         y            => y_coordinate
      );
   U_0 : victory_text_test_block
      PORT MAP (
         clk          => clk,
         rst_n        => rst_n,
         color        => color,
         x_data       => x_coordinate,
         y_data       => y_coordinate,
         pixel_amount => pixel_amount
      );

END struct;