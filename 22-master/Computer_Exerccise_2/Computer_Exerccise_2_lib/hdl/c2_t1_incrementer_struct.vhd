-- VHDL Entity Computer_Exerccise_2_lib.C2_T1_Incrementer.symbol
--
-- Created:
--          by - qkrasi.UNKNOWN (HTC219-722-SPC)
--          at - 12:05:34  8.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY C2_T1_Incrementer IS
   PORT( 
      Input  : IN     std_logic_vector (2 DOWNTO 0);
      Output : OUT    std_logic_vector (2 DOWNTO 0)
   );

-- Declarations

END C2_T1_Incrementer ;

--
-- VHDL Architecture Computer_Exerccise_2_lib.C2_T1_Incrementer.struct
--
-- Created:
--          by - qkrasi.UNKNOWN (HTC219-722-SPC)
--          at - 12:27:35  8.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY c1_t1_half_adder_struct;

ARCHITECTURE struct OF C2_T1_Incrementer IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL carry  : std_logic;
   SIGNAL carry1 : std_logic;
   SIGNAL dout   : std_logic;


   -- Component Declarations
   COMPONENT c1_t1_half_adder
   PORT (
      sw0   : IN     std_logic ;
      sw1   : IN     std_logic ;
      carry : OUT    std_logic ;
      sum   : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c1_t1_half_adder USE ENTITY c1_t1_half_adder_struct.c1_t1_half_adder;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_3' of 'constval'
   dout <= '1';

   -- Instance port mappings.
   U_0 : c1_t1_half_adder
      PORT MAP (
         sw0   => Input(0),
         sw1   => dout,
         carry => carry1,
         sum   => Output(0)
      );
   U_1 : c1_t1_half_adder
      PORT MAP (
         sw0   => Input(1),
         sw1   => carry1,
         carry => carry,
         sum   => Output(1)
      );
   U_2 : c1_t1_half_adder
      PORT MAP (
         sw0   => Input(2),
         sw1   => carry,
         carry => OPEN,
         sum   => Output(2)
      );

END struct;