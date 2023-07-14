-- VHDL Entity alien_game_lib.bonus_t3_shield_gamma_set.symbol
--
-- Created:
--          by - viuhom.viuhom (linux-desktop14.tuni.fi)
--          at - 12:31:06 12/01/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY bonus_t3_shield_gamma_set IS
   PORT( 
      clk      : IN     std_logic;
      rst_n    : IN     std_logic;
      rx_rdy   : IN     std_logic;
      bit_out  : OUT    std_logic;
      lat      : OUT    std_logic;
      sb       : OUT    std_logic;
      transmit : OUT    std_logic
   );

-- Declarations

END bonus_t3_shield_gamma_set ;

--
-- VHDL Architecture alien_game_lib.bonus_t3_shield_gamma_set.fsm
--
-- Created:
--          by - viuhom.viuhom (linux-desktop5.tuni.fi)
--          at - 10:09:21 12/04/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF bonus_t3_shield_gamma_set IS

   -- Architecture Declarations
   SIGNAL a : integer RANGE 8 DOWNTO 0 := 7;  
   SIGNAL gamma : std_logic_vector(17 DOWNTO 0) := "001110111111111011";  
   SIGNAL i : integer RANGE 23 DOWNTO 0 := 17;  

   TYPE STATE_TYPE IS (
      s0,
      s1,
      s2,
      s3,
      s4,
      s5
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      rst_n
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rst_n = '0') THEN
         current_state <= s0;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      a,
      current_state,
      i,
      rx_rdy
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN s0 => 
            IF (rx_rdy = '1') THEN 
               next_state <= s1;
            ELSE
               next_state <= s0;
            END IF;
         WHEN s1 => 
            IF (i > 18) THEN 
               next_state <= s5;
            ELSIF (i = 0 AND a = 0) THEN 
               next_state <= s2;
            ELSIF (i = 0 AND a > 0) THEN 
               next_state <= s3;
            ELSE
               next_state <= s1;
            END IF;
         WHEN s2 => 
            next_state <= s4;
         WHEN s3 => 
            IF (rx_rdy = '1') THEN 
               next_state <= s1;
            ELSE
               next_state <= s3;
            END IF;
         WHEN s4 => 
            next_state <= s4;
         WHEN s5 => 
            IF (rx_rdy = '1') THEN 
               next_state <= s1;
            ELSE
               next_state <= s5;
            END IF;
         WHEN OTHERS =>
            next_state <= s0;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      a,
      current_state,
      gamma,
      i
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      bit_out <= '0';
      lat <= '1';
      sb <= '0';
      transmit <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN s1 => 
            bit_out <= gamma(i);
            transmit <= '1';
            i <= i-1;
         WHEN s2 => 
            lat <= '0';
         WHEN s3 => 
            i <= 18;
            a <= a-1;
         WHEN s4 => 
            sb <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
