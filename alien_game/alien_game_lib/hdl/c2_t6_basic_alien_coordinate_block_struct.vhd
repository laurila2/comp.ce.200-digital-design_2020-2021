-- VHDL Entity alien_game_lib.c2_t6_basic_alien_coordinate_block.symbol
--
-- Created:
--          by - laurila2.laurila2 (linux-desktop3.tuni.fi)
--          at - 09:59:05 10/02/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t6_basic_alien_coordinate_block IS
   PORT( 
      clk       : IN     std_logic;
      direction : IN     std_logic;
      enable    : IN     std_logic;
      rst_n     : IN     std_logic;
      X_coord   : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c2_t6_basic_alien_coordinate_block ;

--
-- VHDL Architecture alien_game_lib.c2_t6_basic_alien_coordinate_block.struct
--
-- Created:
--          by - laurila2.laurila2 (linux-desktop3.tuni.fi)
--          at - 11:55:12 10/02/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c2_t6_basic_alien_coordinate_block IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL data_out  : std_logic_vector(7 DOWNTO 0);
   SIGNAL data_out1 : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout      : std_logic_vector(7 DOWNTO 0);
   SIGNAL sel       : std_logic_vector(1 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL X_coord_internal : std_logic_vector (7 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_3' of 'adff'
   SIGNAL mw_U_3reg_cval : std_logic_vector(7 DOWNTO 0);

   -- Component Declarations
   COMPONENT c2_t3_left_shifter
   PORT (
      data_in  : IN     std_logic_vector (7 DOWNTO 0);
      data_out : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c2_t4_right_shifter
   PORT (
      data_in  : IN     std_logic_vector (7 DOWNTO 0);
      data_out : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c2_t3_left_shifter USE ENTITY alien_game_lib.c2_t3_left_shifter;
   FOR ALL : c2_t4_right_shifter USE ENTITY alien_game_lib.c2_t4_right_shifter;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_3' of 'adff'
   X_coord_internal <= mw_U_3reg_cval;
   u_3seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_3reg_cval <= "10100000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_3reg_cval <= dout;
      END IF;
   END PROCESS u_3seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'merge'
   sel <= enable & direction;

   -- ModuleWare code(v1.12) for instance 'U_2' of 'mux'
   u_2combo_proc: PROCESS(X_coord_internal, data_out, data_out1, sel)
   BEGIN
      CASE sel IS
      WHEN "00" => dout <= X_coord_internal;
      WHEN "01" => dout <= X_coord_internal;
      WHEN "10" => dout <= data_out;
      WHEN "11" => dout <= data_out1;
      WHEN OTHERS => dout <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_2combo_proc;

   -- Instance port mappings.
   U_0 : c2_t3_left_shifter
      PORT MAP (
         data_in  => X_coord_internal,
         data_out => data_out1
      );
   U_1 : c2_t4_right_shifter
      PORT MAP (
         data_in  => X_coord_internal,
         data_out => data_out
      );

   -- Implicit buffered output assignments
   X_coord <= X_coord_internal;

END struct;
