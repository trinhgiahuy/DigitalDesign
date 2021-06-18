-- VHDL Entity Computer_Exerccise_2_lib.Decrementer.symbol
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-708-SPC)
--          at - 11:13:14 10.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Decrementer IS
   PORT( 
      Input     : IN     std_logic;
      carry_in  : IN     std_logic;
      carry_out : OUT    std_logic;
      output    : OUT    std_logic
   );

-- Declarations

END Decrementer ;

--
-- VHDL Architecture Computer_Exerccise_2_lib.Decrementer.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-708-SPC)
--          at - 11:13:14 10.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF Decrementer IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL dout  : std_logic;
   SIGNAL dout1 : std_logic;
   SIGNAL dout2 : std_logic;
   SIGNAL dout3 : std_logic;



BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'and'
   dout3 <= dout1 AND Input;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'and'
   dout2 <= carry_in AND dout;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'constval'
   dout1 <= '1';

   -- ModuleWare code(v1.12) for instance 'U_4' of 'or'
   carry_out <= dout2 OR dout3;

   -- ModuleWare code(v1.12) for instance 'U_1' of 'xor'
   output <= dout XOR carry_in;

   -- ModuleWare code(v1.12) for instance 'U_2' of 'xor'
   dout <= Input XOR dout1;

   -- Instance port mappings.

END struct;
