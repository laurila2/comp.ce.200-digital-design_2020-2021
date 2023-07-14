-- VHDL Entity alien_game_lib.c1_t2_incrementer.symbol
--
-- Created:
--          by - viuhom.viuhom (linux-desktop12.tuni.fi)
--          at - 11:44:54 09/16/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c1_t2_incrementer IS
   PORT( 
      value  : IN     std_logic_vector (2 DOWNTO 0);
      result : OUT    std_logic_vector (2 DOWNTO 0)
   );

-- Declarations

END c1_t2_incrementer ;

--
-- VHDL Architecture alien_game_lib.c1_t2_incrementer.struct
--
-- Created:
--          by - viuhom.viuhom (linux-desktop12.tuni.fi)
--          at - 11:44:54 09/16/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c1_t2_incrementer IS

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
   FOR ALL : c1_t1_half_adder USE ENTITY alien_game_lib.c1_t1_half_adder;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_3' of 'constval'
   dout <= '1';

   -- Instance port mappings.
   U_0 : c1_t1_half_adder
      PORT MAP (
         sw0   => value(0),
         sw1   => dout,
         carry => carry,
         sum   => result(0)
      );
   U_1 : c1_t1_half_adder
      PORT MAP (
         sw0   => value(1),
         sw1   => carry,
         carry => carry1,
         sum   => result(1)
      );
   U_2 : c1_t1_half_adder
      PORT MAP (
         sw0   => value(2),
         sw1   => carry1,
         carry => OPEN,
         sum   => result(2)
      );

END struct;