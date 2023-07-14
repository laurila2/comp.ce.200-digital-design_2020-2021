-- VHDL Entity alien_game_lib.c2_t6_direction_block.symbol
--
-- Created:
--          by - laurila2.laurila2 (linux-desktop3.tuni.fi)
--          at - 11:57:10 10/02/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t6_direction_block IS
   PORT( 
      X_coord   : IN     std_logic_vector (7 DOWNTO 0);
      clk       : IN     std_logic;
      enable    : IN     std_logic;
      rst       : IN     std_logic;
      direction : INOUT  std_logic
   );

-- Declarations

END c2_t6_direction_block ;

--
-- VHDL Architecture alien_game_lib.c2_t6_direction_block.struct
--
-- Created:
--          by - laurila2.laurila2 (linux-desktop3.tuni.fi)
--          at - 11:57:09 10/02/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c2_t6_direction_block IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL d     : std_logic;
   SIGNAL din1  : std_logic;
   SIGNAL din2  : std_logic;
   SIGNAL din3  : std_logic;
   SIGNAL din4  : std_logic;
   SIGNAL dout  : std_logic;
   SIGNAL dout1 : std_logic;
   SIGNAL dout2 : std_logic;
   SIGNAL dout3 : std_logic;


   -- ModuleWare signal declarations(v1.12) for instance 'U_0' of 'adff'
   SIGNAL mw_U_0reg_cval : std_logic;

   -- ModuleWare signal declarations(v1.12) for instance 'U_6' of 'split'
   SIGNAL mw_U_6temp_din : std_logic_vector(7 DOWNTO 0);


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'adff'
   direction <= mw_U_0reg_cval;
   u_0seq_proc: PROCESS (clk, rst)
   BEGIN
      IF (rst = '0') THEN
         mw_U_0reg_cval <= '1';
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_0reg_cval <= d;
      END IF;
   END PROCESS u_0seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'and'
   dout2 <= dout1 AND NOT(direction);

   -- ModuleWare code(v1.12) for instance 'U_7' of 'and'
   dout1 <= enable AND din3;

   -- ModuleWare code(v1.12) for instance 'U_8' of 'and'
   din2 <= enable AND din1;

   -- ModuleWare code(v1.12) for instance 'U_9' of 'and'
   dout3 <= din2 AND direction;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'inv'
   din4 <= NOT(direction);

   -- ModuleWare code(v1.12) for instance 'U_1' of 'mux'
   u_1combo_proc: PROCESS(direction, din4, dout)
   BEGIN
      CASE dout IS
      WHEN '0' => d <= direction;
      WHEN '1' => d <= din4;
      WHEN OTHERS => d <= 'X';
      END CASE;
   END PROCESS u_1combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_2' of 'or'
   dout <= dout2 OR dout3;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'split'
   mw_U_6temp_din <= X_coord;
   u_6combo_proc: PROCESS (mw_U_6temp_din)
   VARIABLE temp_din: std_logic_vector(7 DOWNTO 0);
   BEGIN
      temp_din := mw_U_6temp_din(7 DOWNTO 0);
      din3 <= temp_din(1);
      din1 <= temp_din(6);
   END PROCESS u_6combo_proc;

   -- Instance port mappings.

END struct;
