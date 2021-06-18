-- VHDL Entity pre_made.broken_paddle.symbol
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-711-SPC)
--          at - 15:41:42 11.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY broken_paddle IS
   PORT( 
      btn     : IN     std_logic_vector (3 DOWNTO 0);
      clk     : IN     std_logic;
      rst_n   : IN     std_logic;
      w_rdy   : IN     std_logic;
      write   : OUT    std_logic;
      x_coord : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END broken_paddle ;

--
-- VHDL Architecture pre_made.broken_paddle.struct
--
-- Created:
--          by - mfhubu.UNKNOWN (HTC219-711-SPC)
--          at - 15:48:44 11.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY pre_made;

ARCHITECTURE struct OF broken_paddle IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL and_l_to_merge : std_logic;
   SIGNAL and_r_to_merge : std_logic;
   SIGNAL any_button     : std_logic;
   SIGNAL coord_to_ff    : std_logic_vector(7 DOWNTO 0);
   SIGNAL deb_btn        : std_logic_vector(3 DOWNTO 0);
   SIGNAL l_shift_coord  : std_logic_vector(7 DOWNTO 0);
   SIGNAL r_shift_coord  : std_logic_vector(7 DOWNTO 0);
   SIGNAL sel            : std_logic_vector(1 DOWNTO 0);
   SIGNAL shift_amount   : std_logic;
   SIGNAL tst_t          : std_logic;
   SIGNAL wr_btn         : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL x_coord_internal : std_logic_vector (7 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_0' of 'adff'
   SIGNAL mw_U_0reg_cval : std_logic;

   -- ModuleWare signal declarations(v1.12) for instance 'paddle_x_pos' of 'adff'
   SIGNAL mw_paddle_x_posreg_cval : std_logic_vector(7 DOWNTO 0);

   -- Component Declarations
   COMPONENT debounce
   PORT (
      btn     : IN     std_logic_vector (3 DOWNTO 0);
      clk     : IN     std_logic;
      rst_n   : IN     std_logic;
      deb_btn : OUT    std_logic_vector (3 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : debounce USE ENTITY pre_made.debounce;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'adff'
   write <= mw_U_0reg_cval;
   u_0seq_proc: PROCESS (clk)BEGIN
      IF (clk'EVENT AND clk='1') THEN
         IF (tst_t = '0') THEN
            mw_U_0reg_cval <= '1';
         ELSE
            mw_U_0reg_cval <= wr_btn;
         END IF;
      END IF;
   END PROCESS u_0seq_proc;

   -- ModuleWare code(v1.12) for instance 'paddle_x_pos' of 'adff'
   x_coord_internal <= mw_paddle_x_posreg_cval;
   paddle_x_posseq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_paddle_x_posreg_cval <= "00011000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_paddle_x_posreg_cval <= coord_to_ff;
      END IF;
   END PROCESS paddle_x_posseq_proc;

   -- ModuleWare code(v1.12) for instance 'and_L' of 'and'
   and_l_to_merge <= deb_btn(0) AND NOT(x_coord_internal(0));

   -- ModuleWare code(v1.12) for instance 'and_r' of 'and'
   and_r_to_merge <= NOT(x_coord_internal(0)) AND deb_btn(3);

   -- ModuleWare code(v1.12) for instance 'wen_and' of 'and'
   wr_btn <= w_rdy AND any_button;

   -- ModuleWare code(v1.12) for instance 'shift_one' of 'constval'
   shift_amount <= '1';

   -- ModuleWare code(v1.12) for instance 'shift_one2' of 'constval'
   tst_t <= '0';

   -- ModuleWare code(v1.12) for instance 'U_3' of 'lshift'
   u_3combo_proc : PROCESS (x_coord_internal, shift_amount)
   VARIABLE temp_shift : std_logic_vector (0 DOWNTO 0);
   VARIABLE temp_dout : std_logic_vector (7 DOWNTO 0);
   VARIABLE temp_din : std_logic_vector (7 DOWNTO 0);
   BEGIN
      temp_shift(0) := shift_amount;
      temp_din := x_coord_internal;
      FOR i IN 0 TO 0 LOOP
         IF (temp_shift(i) = '1') THEN
            temp_dout := (OTHERS => '0');
            temp_dout(7 DOWNTO 2**i) := temp_din(7 - 2**i DOWNTO 0);
         ELSIF (temp_shift(i) = '0') THEN
            temp_dout := temp_din;
         ELSE
            temp_dout := (OTHERS => 'X');
         END IF;
         temp_din := temp_dout;
      END LOOP;
      l_shift_coord <= temp_dout;
   END PROCESS u_3combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_7' of 'merge'
   sel <= and_l_to_merge & and_r_to_merge;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'mux'
   u_5combo_proc: PROCESS(x_coord_internal, r_shift_coord, l_shift_coord, 
                          sel)
   BEGIN
      CASE sel IS
      WHEN "00" => coord_to_ff <= x_coord_internal;
      WHEN "01" => coord_to_ff <= r_shift_coord;
      WHEN "10" => coord_to_ff <= l_shift_coord;
      WHEN OTHERS => coord_to_ff <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_5combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_1' of 'or'
   any_button <= deb_btn(0) OR deb_btn(1) OR deb_btn(2) OR deb_btn(3);

   -- ModuleWare code(v1.12) for instance 'U_4' of 'rshift'
   u_4combo_proc : PROCESS (x_coord_internal, shift_amount)
   VARIABLE temp_shift : std_logic_vector (0 DOWNTO 0);
   VARIABLE temp_dout : std_logic_vector (7 DOWNTO 0);
   VARIABLE temp_din : std_logic_vector (7 DOWNTO 0);
   BEGIN
      temp_shift(0) := shift_amount;
      temp_din := x_coord_internal;
      FOR i IN 0 TO 0 LOOP
         IF (temp_shift(i) = '1') THEN
            temp_dout := (OTHERS => '0');
            temp_dout(7 - 2**i DOWNTO 0) := temp_din(7 DOWNTO 2**i);
         ELSIF (temp_shift(i) = '0') THEN
            temp_dout := temp_din;
         ELSE
            temp_dout := (OTHERS => 'X');
         END IF;
         temp_din := temp_dout;
      END LOOP;
      r_shift_coord <= temp_dout;
   END PROCESS u_4combo_proc;

   -- Instance port mappings.
   U_6 : debounce
      PORT MAP (
         btn     => btn,
         clk     => clk,
         rst_n   => rst_n,
         deb_btn => deb_btn
      );

   -- Implicit buffered output assignments
   x_coord <= x_coord_internal;

END struct;
