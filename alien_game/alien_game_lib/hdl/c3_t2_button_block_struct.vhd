-- VHDL Entity alien_game_lib.c3_t2_button_block.symbol
--
-- Created:
--          by - viuhom.viuhom (linux-desktop6.tuni.fi)
--          at - 11:05:15 10/09/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c3_t2_button_block IS
   PORT( 
      Bullet_Y_coordinate : IN     std_logic_vector (7 DOWNTO 0);
      btn                 : IN     std_logic_vector (3 DOWNTO 0);
      enable              : IN     std_logic;
      btn_pulse           : OUT    std_logic
   );

-- Declarations

END c3_t2_button_block ;

--
-- VHDL Architecture alien_game_lib.c3_t2_button_block.struct
--
-- Created:
--          by - viuhom.viuhom (linux-desktop6.tuni.fi)
--          at - 11:05:15 10/09/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c3_t2_button_block IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL dout   : std_logic;
   SIGNAL dout0  : std_logic;
   SIGNAL dout1  : std_logic_vector(3 DOWNTO 0);
   SIGNAL dout10 : std_logic;
   SIGNAL dout2  : std_logic;
   SIGNAL dout3  : std_logic;
   SIGNAL dout4  : std_logic;
   SIGNAL dout5  : std_logic;
   SIGNAL dout6  : std_logic;
   SIGNAL dout7  : std_logic;
   SIGNAL dout8  : std_logic;
   SIGNAL dout9  : std_logic_vector(3 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_4' of 'split'
   SIGNAL mw_U_4temp_din : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_5' of 'split'
   SIGNAL mw_U_5temp_din : std_logic_vector(3 DOWNTO 0);


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'and'
   btn_pulse <= dout10 AND NOT(dout);

   -- ModuleWare code(v1.12) for instance 'U_2' of 'constval'
   dout1 <= "0000";

   -- ModuleWare code(v1.12) for instance 'U_1' of 'mux'
   u_1combo_proc: PROCESS(dout1, btn, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => dout9 <= dout1;
      WHEN '1' => dout9 <= btn;
      WHEN OTHERS => dout9 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_1combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'or'
   dout <= dout0 OR dout2 OR dout3 OR dout4 OR dout5 OR dout6 OR dout7
           OR dout8;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'split'
   mw_U_4temp_din <= Bullet_Y_coordinate;
   u_4combo_proc: PROCESS (mw_U_4temp_din)
   VARIABLE temp_din: std_logic_vector(7 DOWNTO 0);
   BEGIN
      temp_din := mw_U_4temp_din(7 DOWNTO 0);
      dout0 <= temp_din(0);
      dout2 <= temp_din(1);
      dout3 <= temp_din(2);
      dout4 <= temp_din(3);
      dout5 <= temp_din(4);
      dout6 <= temp_din(5);
      dout7 <= temp_din(6);
      dout8 <= temp_din(7);
   END PROCESS u_4combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'split'
   mw_U_5temp_din <= dout9;
   u_5combo_proc: PROCESS (mw_U_5temp_din)
   VARIABLE temp_din: std_logic_vector(3 DOWNTO 0);
   BEGIN
      temp_din := mw_U_5temp_din(3 DOWNTO 0);
      dout10 <= temp_din(0);
   END PROCESS u_5combo_proc;

   -- Instance port mappings.

END struct;
