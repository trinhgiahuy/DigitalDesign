--
-- VHDL Entity Computer_Exerccise_2_lib.C2_T2_Decrementer.arch_name
--
-- Created:
--          by - qkrasi.UNKNOWN (HTC219-722-SPC)
--          at - 12:54:59  8.10.2019
--
-- using Mentor Graphics HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY C2_T2_Decrementer IS
   PORT( 
      Input  : IN     std_logic_vector (2 DOWNTO 0);
      Output : OUT    std_logic_vector (2 DOWNTO 0)
   );

-- Declarations

END C2_T2_Decrementer ;


--
-- VHDL Architecture Computer_Exerccise_2_lib.C2_T2_Decrementer.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-708-SPC)
--          at - 11:13:15 10.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY Computer_Exerccise_2_lib;

ARCHITECTURE struct OF C2_T2_Decrementer IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL carry_out  : std_logic;
   SIGNAL carry_out1 : std_logic;
   SIGNAL dout       : std_logic;


   -- Component Declarations
   COMPONENT Decrementer
   PORT (
      Input     : IN     std_logic ;
      carry_in  : IN     std_logic ;
      carry_out : OUT    std_logic ;
      output    : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Decrementer USE ENTITY Computer_Exerccise_2_lib.Decrementer;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_3' of 'constval'
   dout <= '0';

   -- Instance port mappings.
   U_0 : Decrementer
      PORT MAP (
         Input     => Input(1),
         carry_in  => carry_out,
         carry_out => carry_out1,
         output    => Output(1)
      );
   U_1 : Decrementer
      PORT MAP (
         Input     => Input(0),
         carry_in  => dout,
         carry_out => carry_out,
         output    => Output(0)
      );
   U_2 : Decrementer
      PORT MAP (
         Input     => Input(2),
         carry_in  => carry_out1,
         carry_out => OPEN,
         output    => Output(2)
      );

END struct;
