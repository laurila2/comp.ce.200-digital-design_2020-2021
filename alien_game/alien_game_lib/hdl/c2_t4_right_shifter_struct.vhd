-- VHDL Entity alien_game_lib.c2_t4_right_shifter.symbol
--
-- Created:
--          by - laurila2.laurila2 (linux-desktop7.tuni.fi)
--          at - 12:33:07 09/30/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t4_right_shifter IS
   PORT( 
      data_in  : IN     std_logic_vector (7 DOWNTO 0);
      data_out : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c2_t4_right_shifter ;

--
-- VHDL Architecture alien_game_lib.c2_t4_right_shifter.struct
--
-- Created:
--          by - laurila2.laurila2 (linux-desktop7.tuni.fi)
--          at - 12:37:04 09/30/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c2_t4_right_shifter IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL din7  : std_logic;
   SIGNAL dout1 : std_logic;
   SIGNAL dout2 : std_logic;
   SIGNAL dout3 : std_logic;
   SIGNAL dout4 : std_logic;
   SIGNAL dout5 : std_logic;
   SIGNAL dout6 : std_logic;
   SIGNAL dout7 : std_logic;


   -- ModuleWare signal declarations(v1.12) for instance 'U_0' of 'split'
   SIGNAL mw_U_0temp_din : std_logic_vector(7 DOWNTO 0);


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_2' of 'constval'
   din7 <= '0';

   -- ModuleWare code(v1.12) for instance 'U_1' of 'merge'
   data_out <= din7 & dout7 & dout6 & dout5 & dout4 & dout3 & dout2 & dout1;

   -- ModuleWare code(v1.12) for instance 'U_0' of 'split'
   mw_U_0temp_din <= data_in;
   u_0combo_proc: PROCESS (mw_U_0temp_din)
   VARIABLE temp_din: std_logic_vector(7 DOWNTO 0);
   BEGIN
      temp_din := mw_U_0temp_din(7 DOWNTO 0);
      dout1 <= temp_din(1);
      dout2 <= temp_din(2);
      dout3 <= temp_din(3);
      dout4 <= temp_din(4);
      dout5 <= temp_din(5);
      dout6 <= temp_din(6);
      dout7 <= temp_din(7);
   END PROCESS u_0combo_proc;

   -- Instance port mappings.

END struct;
