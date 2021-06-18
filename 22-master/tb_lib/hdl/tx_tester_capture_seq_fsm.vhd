-- VHDL Entity tb_lib.tx_tester_capture_seq.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-717-SPC)
--          at - 12:21:36 06/12/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tx_tester_capture_seq IS
   PORT( 
      clk     : IN     std_logic;
      rst_n   : IN     std_logic;
      sck     : IN     std_logic;
      sda     : IN     std_logic;
      correct : OUT    std_logic;
      done    : OUT    std_logic
   );

-- Declarations

END tx_tester_capture_seq ;

--
-- VHDL Architecture tb_lib.tx_tester_capture_seq.fsm
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-717-SPC)
--          at - 15:55:38 09/20/19
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ARCHITECTURE fsm OF tx_tester_capture_seq IS

   -- Architecture Declarations
   SIGNAL data : std_logic_vector(31 DOWNTO 0);  
   SIGNAL data_col : std_logic_vector(31 DOWNTO 0);  
   SIGNAL indexer : integer;  
   SIGNAL ref_data : std_logic_vector(31 DOWNTO 0);  

   TYPE STATE_TYPE IS (
      reset,
      wait_clk,
      write,
      completed,
      corr,
      incorr
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk
   )
   -----------------------------------------------------------------
   BEGIN
      IF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;

         -- Combined Actions
         CASE current_state IS
            WHEN reset => 
               indexer<=31;
               data<=(others=>'0');
               data_col<=(others=>'0');
            WHEN write => 
               data(indexer)<=sda;
               data_col <= data or data_col;
               IF (sck='0') THEN 
                  indexer<=indexer-1;
               END IF;
            WHEN OTHERS =>
               NULL;
         END CASE;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      current_state,
      data_col,
      indexer,
      ref_data,
      sck
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN reset => 
            next_state <= wait_clk;
         WHEN wait_clk => 
            IF (indexer =-1) THEN 
               next_state <= completed;
            ELSIF (sck='1') THEN 
               next_state <= write;
            ELSE
               next_state <= wait_clk;
            END IF;
         WHEN write => 
            IF (sck='0') THEN 
               next_state <= wait_clk;
            ELSE
               next_state <= write;
            END IF;
         WHEN completed => 
            IF (data_col = ref_data) THEN 
               next_state <= corr;
            ELSE
               next_state <= incorr;
            END IF;
         WHEN corr => 
            next_state <= corr;
         WHEN incorr => 
            next_state <= incorr;
         WHEN OTHERS =>
            next_state <= reset;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      correct <= '0';
      done <= '0';
      -- Default Assignment To Internals
      ref_data <= "11011110101011011011111011101111";

      -- Combined Actions
      CASE current_state IS
         WHEN corr => 
            correct <='1';
            done <='1';
         WHEN incorr => 
            correct <= '0';
            done<='1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
