-- VHDL Entity alien_game_lib.c2_t6_alien_hitblock.symbol
--
-- Created:
--          by - viuhom.viuhom (linux-desktop2.tuni.fi)
--          at - 12:07:09 11/24/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t6_alien_hitblock IS
   PORT( 
      clk            : IN     std_logic;
      hit            : IN     std_logic;
      rst            : IN     std_logic;
      alien_defeated : OUT    std_logic;
      color          : OUT    std_logic_vector (23 DOWNTO 0)
   );

-- Declarations

END c2_t6_alien_hitblock ;

--
-- VHDL Architecture alien_game_lib.c2_t6_alien_hitblock.struct
--
-- Created:
--          by - viuhom.viuhom (linux-desktop2.tuni.fi)
--          at - 12:07:09 11/24/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c2_t6_alien_hitblock IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL din0   : std_logic_vector(23 DOWNTO 0);
   SIGNAL din2   : std_logic_vector(23 DOWNTO 0);
   SIGNAL din3   : std_logic_vector(23 DOWNTO 0);
   SIGNAL din4   : std_logic_vector(23 DOWNTO 0);
   SIGNAL din5   : std_logic_vector(23 DOWNTO 0);
   SIGNAL din6   : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout   : std_logic_vector(2 DOWNTO 0);
   SIGNAL dout0  : std_logic;
   SIGNAL dout1  : std_logic;
   SIGNAL dout2  : std_logic;
   SIGNAL dout3  : std_logic;
   SIGNAL dout4  : std_logic;
   SIGNAL dout5  : std_logic_vector(23 DOWNTO 0);
   SIGNAL q      : std_logic_vector(2 DOWNTO 0);
   SIGNAL result : std_logic_vector(2 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL alien_defeated_internal : std_logic;


   -- ModuleWare signal declarations(v1.12) for instance 'U_0' of 'adff'
   SIGNAL mw_U_0reg_cval : std_logic_vector(2 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_12' of 'adff'
   SIGNAL mw_U_12reg_cval : std_logic;

   -- ModuleWare signal declarations(v1.12) for instance 'U_11' of 'split'
   SIGNAL mw_U_11temp_din : std_logic_vector(2 DOWNTO 0);

   -- Component Declarations
   COMPONENT c1_t2_incrementer
   PORT (
      value  : IN     std_logic_vector (2 DOWNTO 0);
      result : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c1_t2_incrementer USE ENTITY alien_game_lib.c1_t2_incrementer;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'adff'
   q <= mw_U_0reg_cval;
   u_0seq_proc: PROCESS (clk, rst)
   BEGIN
      IF (rst = '0') THEN
         mw_U_0reg_cval <= "000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_0reg_cval <= dout;
      END IF;
   END PROCESS u_0seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_12' of 'adff'
   alien_defeated_internal <= mw_U_12reg_cval;
   u_12seq_proc: PROCESS (clk, rst)
   BEGIN
      IF (rst = '0') THEN
         mw_U_12reg_cval <= '0';
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_12reg_cval <= dout4;
      END IF;
   END PROCESS u_12seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_10' of 'and'
   dout3 <= dout0 AND NOT(dout1) AND dout2;

   -- ModuleWare code(v1.12) for instance 'U_2' of 'constval'
   din0 <= "101010011000101011000111";

   -- ModuleWare code(v1.12) for instance 'U_4' of 'constval'
   din2 <= "000101010111000111000111";

   -- ModuleWare code(v1.12) for instance 'U_5' of 'constval'
   din3 <= "011010111110011100000000";

   -- ModuleWare code(v1.12) for instance 'U_7' of 'constval'
   din4 <= "011100101110011100000000";

   -- ModuleWare code(v1.12) for instance 'U_8' of 'constval'
   din5 <= "000001110000000000000000";

   -- ModuleWare code(v1.12) for instance 'U_9' of 'constval'
   din6 <= "000000000000000000000000";

   -- ModuleWare code(v1.12) for instance 'U_1' of 'mux'
   u_1combo_proc: PROCESS(din0, din2, din3, din4, din5, din6, q)
   BEGIN
      CASE q IS
      WHEN "000" => dout5 <= din0;
      WHEN "001" => dout5 <= din2;
      WHEN "010" => dout5 <= din3;
      WHEN "011" => dout5 <= din4;
      WHEN "100" => dout5 <= din5;
      WHEN "101" => dout5 <= din6;
      WHEN "110" => dout5 <= din6;
      WHEN "111" => dout5 <= din6;
      WHEN OTHERS => dout5 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_1combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'mux'
   u_3combo_proc: PROCESS(q, result, hit)
   BEGIN
      CASE hit IS
      WHEN '0' => dout <= q;
      WHEN '1' => dout <= result;
      WHEN OTHERS => dout <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_3combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_13' of 'mux'
   u_13combo_proc: PROCESS(dout3, alien_defeated_internal)
   BEGIN
      CASE alien_defeated_internal IS
      WHEN '0' => dout4 <= dout3;
      WHEN '1' => dout4 <= alien_defeated_internal;
      WHEN OTHERS => dout4 <= 'X';
      END CASE;
   END PROCESS u_13combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_14' of 'mux'
   u_14combo_proc: PROCESS(dout5, din6, alien_defeated_internal)
   BEGIN
      CASE alien_defeated_internal IS
      WHEN '0' => color <= dout5;
      WHEN '1' => color <= din6;
      WHEN OTHERS => color <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_14combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_11' of 'split'
   mw_U_11temp_din <= q;
   u_11combo_proc: PROCESS (mw_U_11temp_din)
   VARIABLE temp_din: std_logic_vector(2 DOWNTO 0);
   BEGIN
      temp_din := mw_U_11temp_din(2 DOWNTO 0);
      dout0 <= temp_din(0);
      dout1 <= temp_din(1);
      dout2 <= temp_din(2);
   END PROCESS u_11combo_proc;

   -- Instance port mappings.
   U_6 : c1_t2_incrementer
      PORT MAP (
         value  => q,
         result => result
      );

   -- Implicit buffered output assignments
   alien_defeated <= alien_defeated_internal;

END struct;
