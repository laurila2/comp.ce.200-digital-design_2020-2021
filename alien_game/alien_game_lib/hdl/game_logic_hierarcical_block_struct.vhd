-- VHDL Entity alien_game_lib.game_logic_hierarcical_block.symbol
--
-- Created:
--          by - viuhom.viuhom (linux-desktop13.tuni.fi)
--          at - 14:09:59 11/20/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY game_logic_hierarcical_block IS
   PORT( 
      btn         : IN     std_logic_vector (3 DOWNTO 0);
      clk         : IN     std_logic;
      rst_n       : IN     std_logic;
      write_ready : IN     std_logic;
      color       : OUT    std_logic_vector (23 DOWNTO 0);
      frame_done  : OUT    std_logic;
      write       : OUT    std_logic;
      x_coord     : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord     : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END game_logic_hierarcical_block ;

--
-- VHDL Architecture alien_game_lib.game_logic_hierarcical_block.struct
--
-- Created:
--          by - viuhom.viuhom (linux-desktop2.tuni.fi)
--          at - 12:10:58 11/24/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF game_logic_hierarcical_block IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Bullet_X_coordinate : std_logic_vector(7 DOWNTO 0);
   SIGNAL Bullet_Y_coordinate : std_logic_vector(7 DOWNTO 0);
   SIGNAL Color2              : std_logic_vector(23 DOWNTO 0);
   SIGNAL Gun_color           : std_logic_vector(23 DOWNTO 0);
   SIGNAL X_coord1            : std_logic_vector(7 DOWNTO 0);
   SIGNAL X_coordinate        : std_logic_vector(7 DOWNTO 0);
   SIGNAL Y_coord1            : std_logic_vector(7 DOWNTO 0);
   SIGNAL Y_coordinate        : std_logic_vector(7 DOWNTO 0);
   SIGNAL alien_defeated      : std_logic;
   SIGNAL color1              : std_logic_vector(23 DOWNTO 0);
   SIGNAL din3                : std_logic_vector(23 DOWNTO 0);
   SIGNAL din4                : std_logic_vector(7 DOWNTO 0);
   SIGNAL din5                : std_logic_vector(7 DOWNTO 0);
   SIGNAL enable              : std_logic;
   SIGNAL gun_px_idx          : std_logic_vector(1 DOWNTO 0);
   SIGNAL hit                 : std_logic;
   SIGNAL module_select       : std_logic_vector(1 DOWNTO 0);


   -- Component Declarations
   COMPONENT c2_t6_basic_alien_design_top
   PORT (
      clk            : IN     std_logic ;
      enable         : IN     std_logic ;
      hit            : IN     std_logic ;
      rst_n          : IN     std_logic ;
      X_coord        : OUT    std_logic_vector (7 DOWNTO 0);
      Y_coord        : OUT    std_logic_vector (7 DOWNTO 0);
      alien_defeated : OUT    std_logic ;
      color          : OUT    std_logic_vector (23 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c3_t1_Gun_Module
   PORT (
      btn          : IN     std_logic_vector (3 DOWNTO 0);
      clk          : IN     std_logic ;
      enable       : IN     std_logic ;
      gun_px_idx   : IN     std_logic_vector (1 DOWNTO 0);
      rst_n        : IN     std_logic ;
      Gun_color    : OUT    std_logic_vector (23 DOWNTO 0);
      X_coordinate : OUT    std_logic_vector (7 DOWNTO 0);
      Y_coordinate : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c3_t2_Bullet_Flight_Modelling
   PORT (
      Gun_X_coordinate    : IN     std_logic_vector (7 DOWNTO 0);
      btn                 : IN     std_logic_vector (3 DOWNTO 0);
      clk                 : IN     std_logic ;
      enable              : IN     std_logic ;
      rst_n               : IN     std_logic ;
      Bullet_X_coordinate : OUT    std_logic_vector (7 DOWNTO 0);
      Bullet_Y_coordinate : OUT    std_logic_vector (7 DOWNTO 0);
      Color               : OUT    std_logic_vector (23 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c5_t1_hit_detector
   PORT (
      alien_x_coord  : IN     std_logic_vector (7 DOWNTO 0);
      alien_y_coord  : IN     std_logic_vector (7 DOWNTO 0);
      bullet_x_coord : IN     std_logic_vector (7 DOWNTO 0);
      bullet_y_coord : IN     std_logic_vector (7 DOWNTO 0);
      clk            : IN     std_logic ;
      rst_n          : IN     std_logic ;
      hit            : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT c5_t2_Write_Sequencer
   PORT (
      alien_defeated : IN     std_logic ;
      clk            : IN     std_logic ;
      rst_n          : IN     std_logic ;
      write_ready    : IN     std_logic ;
      enable         : OUT    std_logic ;
      frame_done     : OUT    std_logic ;
      gun_px_idx     : OUT    std_logic_vector (1 DOWNTO 0);
      module_select  : OUT    std_logic_vector (1 DOWNTO 0);
      write          : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT c6_t1_victory_effect
   PORT (
      clk          : IN     std_logic ;
      enable       : IN     std_logic ;
      rst_n        : IN     std_logic ;
      X_coordinate : OUT    std_logic_vector (7 DOWNTO 0);
      Y_coordinate : OUT    std_logic_vector (7 DOWNTO 0);
      color        : OUT    std_logic_vector (23 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c2_t6_basic_alien_design_top USE ENTITY alien_game_lib.c2_t6_basic_alien_design_top;
   FOR ALL : c3_t1_Gun_Module USE ENTITY alien_game_lib.c3_t1_Gun_Module;
   FOR ALL : c3_t2_Bullet_Flight_Modelling USE ENTITY alien_game_lib.c3_t2_Bullet_Flight_Modelling;
   FOR ALL : c5_t1_hit_detector USE ENTITY alien_game_lib.c5_t1_hit_detector;
   FOR ALL : c5_t2_Write_Sequencer USE ENTITY alien_game_lib.c5_t2_Write_Sequencer;
   FOR ALL : c6_t1_victory_effect USE ENTITY alien_game_lib.c6_t1_victory_effect;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_5' of 'mux'
   u_5combo_proc: PROCESS(X_coord1, X_coordinate, Bullet_X_coordinate, 
                          din5, module_select)
   BEGIN
      CASE module_select IS
      WHEN "00" => x_coord <= X_coord1;
      WHEN "01" => x_coord <= X_coordinate;
      WHEN "10" => x_coord <= Bullet_X_coordinate;
      WHEN "11" => x_coord <= din5;
      WHEN OTHERS => x_coord <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_5combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'mux'
   u_6combo_proc: PROCESS(Y_coord1, Y_coordinate, Bullet_Y_coordinate, 
                          din4, module_select)
   BEGIN
      CASE module_select IS
      WHEN "00" => y_coord <= Y_coord1;
      WHEN "01" => y_coord <= Y_coordinate;
      WHEN "10" => y_coord <= Bullet_Y_coordinate;
      WHEN "11" => y_coord <= din4;
      WHEN OTHERS => y_coord <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_6combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_7' of 'mux'
   u_7combo_proc: PROCESS(color1, Gun_color, Color2, din3, 
                          module_select)
   BEGIN
      CASE module_select IS
      WHEN "00" => color <= color1;
      WHEN "01" => color <= Gun_color;
      WHEN "10" => color <= Color2;
      WHEN "11" => color <= din3;
      WHEN OTHERS => color <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_7combo_proc;

   -- Instance port mappings.
   U_1 : c2_t6_basic_alien_design_top
      PORT MAP (
         clk            => clk,
         enable         => enable,
         hit            => hit,
         rst_n          => rst_n,
         X_coord        => X_coord1,
         Y_coord        => Y_coord1,
         alien_defeated => alien_defeated,
         color          => color1
      );
   U_2 : c3_t1_Gun_Module
      PORT MAP (
         btn          => btn,
         clk          => clk,
         enable       => enable,
         gun_px_idx   => gun_px_idx,
         rst_n        => rst_n,
         Gun_color    => Gun_color,
         X_coordinate => X_coordinate,
         Y_coordinate => Y_coordinate
      );
   U_4 : c3_t2_Bullet_Flight_Modelling
      PORT MAP (
         Gun_X_coordinate    => X_coordinate,
         btn                 => btn,
         clk                 => clk,
         enable              => enable,
         rst_n               => rst_n,
         Bullet_X_coordinate => Bullet_X_coordinate,
         Bullet_Y_coordinate => Bullet_Y_coordinate,
         Color               => Color2
      );
   U_3 : c5_t1_hit_detector
      PORT MAP (
         alien_x_coord  => X_coord1,
         alien_y_coord  => Y_coord1,
         bullet_x_coord => Bullet_X_coordinate,
         bullet_y_coord => Bullet_Y_coordinate,
         clk            => clk,
         rst_n          => rst_n,
         hit            => hit
      );
   U_0 : c5_t2_Write_Sequencer
      PORT MAP (
         alien_defeated => alien_defeated,
         clk            => clk,
         rst_n          => rst_n,
         write_ready    => write_ready,
         enable         => enable,
         frame_done     => frame_done,
         gun_px_idx     => gun_px_idx,
         module_select  => module_select,
         write          => write
      );
   U_8 : c6_t1_victory_effect
      PORT MAP (
         clk          => clk,
         enable       => enable,
         rst_n        => rst_n,
         X_coordinate => din5,
         Y_coordinate => din4,
         color        => din3
      );

END struct;
