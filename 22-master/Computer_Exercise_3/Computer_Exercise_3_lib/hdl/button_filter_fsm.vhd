-- VHDL Entity Computer_Exercise_3_lib.Button_Filter.symbol
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-707-SPC)
--          at - 13:24:21  1.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Button_Filter IS
   PORT( 
      btn_in       : IN     std_logic;
      clk          : IN     std_logic;
      rst          : IN     std_logic;
      btn_filtered : OUT    std_logic
   );

-- Declarations

END Button_Filter ;

--
-- VHDL Architecture Computer_Exercise_3_lib.Button_Filter.fsm
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-707-SPC)
--          at - 14:44:30  1.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF Button_Filter IS

   TYPE STATE_TYPE IS (
      s0,
      s1,
      s2,
      s3,
      s4
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

   -- Declare Wait State internal signals
   SIGNAL csm_timer : std_logic_vector(13 DOWNTO 0);
   SIGNAL csm_next_timer : std_logic_vector(13 DOWNTO 0);
   SIGNAL csm_timeout : std_logic;
   SIGNAL csm_to_s1 : std_logic;
   SIGNAL csm_to_s4 : std_logic;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      rst
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rst = '0') THEN
         current_state <= s0;
         csm_timer <= (OTHERS => '0');
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
         csm_timer <= csm_next_timer;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      btn_in,
      csm_timeout,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default assignments to Wait State entry flags
      csm_to_s1 <= '0';
      csm_to_s4 <= '0';
      CASE current_state IS
         WHEN s0 => 
            IF (btn_in = '1') THEN 
               next_state <= s1;
               csm_to_s1 <= '1';
            ELSE
               next_state <= s0;
            END IF;
         WHEN s1 => 
            IF (csm_timeout = '1') THEN 
               next_state <= s2;
            ELSE
               next_state <= s1;
            END IF;
         WHEN s2 => 
            next_state <= s3;
         WHEN s3 => 
            IF (btn_in = '0') THEN 
               next_state <= s4;
               csm_to_s4 <= '1';
            ELSE
               next_state <= s3;
            END IF;
         WHEN s4 => 
            IF (csm_timeout = '1' AND (btn_in = '0')) THEN 
               next_state <= s0;
            ELSIF (csm_timeout = '1' AND (btn_in = '1')) THEN 
               next_state <= s3;
            ELSE
               next_state <= s4;
            END IF;
         WHEN OTHERS =>
            next_state <= s0;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      btn_filtered <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN s2 => 
            btn_filtered <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
   -----------------------------------------------------------------
   csm_wait_combo_proc: PROCESS (
      csm_timer,
      csm_to_s1,
      csm_to_s4
   )
   -----------------------------------------------------------------
   VARIABLE csm_temp_timeout : std_logic;
   BEGIN
      IF (unsigned(csm_timer) = 0) THEN
         csm_temp_timeout := '1';
      ELSE
         csm_temp_timeout := '0';
      END IF;

      IF (csm_to_s1 = '1') THEN
         csm_next_timer <= "10011100001110"; -- no cycles(9999)-1=9998
      ELSIF (csm_to_s4 = '1') THEN
         csm_next_timer <= "10011100001110"; -- no cycles(9999)-1=9998
      ELSE
         IF (csm_temp_timeout = '1') THEN
            csm_next_timer <= (OTHERS=>'0');
         ELSE
            csm_next_timer <= unsigned(csm_timer) - '1';
         END IF;
      END IF;
      csm_timeout <= csm_temp_timeout;
   END PROCESS csm_wait_combo_proc;

END fsm;
