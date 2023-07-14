-- VHDL Entity pre_made.HELLO_ALIEN.symbol
--
-- Created:
--          by - saarines.Domain Users (HTC219-722-SPC)
--          at - 11:48:24 08/16/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY HELLO_ALIEN IS
   PORT( 
      btn            : IN     std_logic_vector (3 DOWNTO 0);
      clk            : IN     std_logic;
      rst_n          : IN     std_logic;
      if_you_name    : OUT    std_logic_vector (7 DOWNTO 0);
      iotre_will     : OUT    std_logic;
      like_this      : OUT    std_logic;
      of_this_course : OUT    std_logic;
      throw_you_out  : OUT    std_logic;
      your_signals   : OUT    std_logic
   );

-- Declarations

END HELLO_ALIEN ;

--
-- VHDL Architecture pre_made.HELLO_ALIEN.struct
--
-- Created:
--          by - viuhom.UNKNOWN (HTC219-722-SPC)
--          at - 14:48:08  3.11.2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY pre_made;

ARCHITECTURE struct OF HELLO_ALIEN IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL alien_color : std_logic_vector(23 DOWNTO 0);
   SIGNAL alien_x     : std_logic_vector(7 DOWNTO 0);
   SIGNAL alien_y     : std_logic_vector(7 DOWNTO 0);
   SIGNAL enable      : std_logic;
   SIGNAL q           : std_logic;
   SIGNAL write       : std_logic;


   -- ModuleWare signal declarations(v1.12) for instance 'convenience_ff' of 'adff'
   SIGNAL mw_convenience_ffreg_cval : std_logic;

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
   COMPONENT en_wr
   PORT (
      clk    : IN     std_logic;
      rst_n  : IN     std_logic;
      enable : OUT    std_logic;
      wr     : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT z_black_box_y
   PORT (
      clk            : IN     std_logic;
      color_BGR      : IN     std_logic_vector (23 DOWNTO 0);
      frame_done     : IN     std_logic;
      rst_n          : IN     std_logic;
      write          : IN     std_logic;
      x_coord        : IN     std_logic_vector (7 DOWNTO 0);
      y_coord        : IN     std_logic_vector (7 DOWNTO 0);
      if_you_name    : OUT    std_logic_vector (7 DOWNTO 0);
      iotre_will     : OUT    std_logic;
      like_this      : OUT    std_logic;
      of_this_course : OUT    std_logic;
      throw_you_out  : OUT    std_logic;
      w_rdy          : OUT    std_logic;
      your_signals   : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c2_t6_basic_alien_design_top USE ENTITY alien_game_lib.c2_t6_basic_alien_design_top;
   FOR ALL : en_wr USE ENTITY pre_made.en_wr;
   FOR ALL : z_black_box_y USE ENTITY pre_made.z_black_box_y;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'convenience_ff' of 'adff'
   q <= mw_convenience_ffreg_cval;
   convenience_ffseq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_convenience_ffreg_cval <= '0';
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_convenience_ffreg_cval <= write;
      END IF;
   END PROCESS convenience_ffseq_proc;

   -- Instance port mappings.
   U_1 : c2_t6_basic_alien_design_top
      PORT MAP (
         clk            => clk,
         enable         => enable,
         hit            => btn(0),
         rst_n          => rst_n,
         X_coord        => alien_x,
         Y_coord        => alien_y,
         alien_defeated => OPEN,
         color          => alien_color
      );
   U_2 : en_wr
      PORT MAP (
         clk    => clk,
         rst_n  => rst_n,
         enable => enable,
         wr     => write
      );
   U_0 : z_black_box_y
      PORT MAP (
         clk            => clk,
         color_BGR      => alien_color,
         frame_done     => q,
         rst_n          => rst_n,
         write          => write,
         x_coord        => alien_x,
         y_coord        => alien_y,
         if_you_name    => if_you_name,
         iotre_will     => iotre_will,
         like_this      => like_this,
         of_this_course => of_this_course,
         throw_you_out  => throw_you_out,
         w_rdy          => OPEN,
         your_signals   => your_signals
      );

END struct;
