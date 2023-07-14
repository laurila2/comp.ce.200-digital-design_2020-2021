-- VHDL Entity alien_game_lib.c7_t1_Integration_of_display_controller.symbol
--
-- Created:
--          by - viuhom.viuhom (linux-desktop5.tuni.fi)
--          at - 10:44:26 12/04/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c7_t1_Integration_of_display_controller IS
   PORT( 
      clk           : IN     std_logic;
      frame_written : IN     std_logic;
      pixd_in       : IN     std_logic_vector (23 DOWNTO 0);
      rst_n         : IN     std_logic;
      write         : IN     std_logic;
      xw            : IN     std_logic_vector (7 DOWNTO 0);
      yw            : IN     std_logic_vector (7 DOWNTO 0);
      channel       : OUT    std_logic_vector (7 DOWNTO 0);
      lat           : OUT    std_logic;
      s_clk         : OUT    std_logic;
      s_rst         : OUT    std_logic;
      s_sda         : OUT    std_logic;
      sb            : OUT    std_logic;
      w_rdy         : OUT    std_logic
   );

-- Declarations

END c7_t1_Integration_of_display_controller ;

--
-- VHDL Architecture alien_game_lib.c7_t1_Integration_of_display_controller.struct
--
-- Created:
--          by - viuhom.viuhom (linux-desktop5.tuni.fi)
--          at - 10:44:26 12/04/20
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c7_t1_Integration_of_display_controller IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL bit_c      : std_logic;
   SIGNAL bit_g      : std_logic;
   SIGNAL bit_in     : std_logic;
   SIGNAL done       : std_logic;
   SIGNAL lat_c      : std_logic;
   SIGNAL lat_g      : std_logic;
   SIGNAL pixd       : std_logic_vector(23 DOWNTO 0);
   SIGNAL ready      : std_logic;
   SIGNAL rx_ready   : std_logic;
   SIGNAL rx_ready_c : std_logic;
   SIGNAL transmit   : std_logic;
   SIGNAL tx_c       : std_logic;
   SIGNAL tx_g       : std_logic;
   SIGNAL xr         : std_logic_vector(7 DOWNTO 0);
   SIGNAL yr         : std_logic_vector(7 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL sb_internal : std_logic;


   -- Component Declarations
   COMPONENT bonus_t1_shield_initial_reset
   PORT (
      clk   : IN     std_logic ;
      rst_n : IN     std_logic ;
      done  : OUT    std_logic ;
      s_rst : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT bonus_t2_serial_data_transmit
   PORT (
      bit_in   : IN     std_logic ;
      clk      : IN     std_logic ;
      rst_n    : IN     std_logic ;
      transmit : IN     std_logic ;
      ready    : OUT    std_logic ;
      s_clk    : OUT    std_logic ;
      s_sda    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT reg_bank
   PORT (
      clk      : IN     std_logic;
      pixd_in  : IN     std_logic_vector (23 DOWNTO 0);
      rst_n    : IN     std_logic;
      w_done   : IN     std_logic;
      write    : IN     std_logic;
      xr       : IN     std_logic_vector (7 DOWNTO 0);
      xw       : IN     std_logic_vector (7 DOWNTO 0);
      yr       : IN     std_logic_vector (7 DOWNTO 0);
      yw       : IN     std_logic_vector (7 DOWNTO 0);
      pixd_out : OUT    std_logic_vector (23 DOWNTO 0);
      w_rdy    : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT serial_led_cannon
   PORT (
      clk     : IN     std_logic;
      pixdata : IN     std_logic_vector (23 DOWNTO 0);
      rst_n   : IN     std_logic;
      run     : IN     std_logic;
      bit_out : OUT    std_logic;
      chans   : OUT    std_logic_vector (7 DOWNTO 0);
      lat     : OUT    std_logic;
      tx      : OUT    std_logic;
      x       : OUT    std_logic_vector (7 DOWNTO 0);
      y       : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT v2_gamma
   PORT (
      clk     : IN     std_logic;
      rst_n   : IN     std_logic;
      run     : IN     std_logic;
      bit_out : OUT    std_logic;
      sb      : OUT    std_logic;
      tx      : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : bonus_t1_shield_initial_reset USE ENTITY alien_game_lib.bonus_t1_shield_initial_reset;
   FOR ALL : bonus_t2_serial_data_transmit USE ENTITY alien_game_lib.bonus_t2_serial_data_transmit;
   FOR ALL : reg_bank USE ENTITY alien_game_lib.reg_bank;
   FOR ALL : serial_led_cannon USE ENTITY alien_game_lib.serial_led_cannon;
   FOR ALL : v2_gamma USE ENTITY alien_game_lib.v2_gamma;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_4' of 'and'
   rx_ready <= done AND ready;

   -- ModuleWare code(v1.12) for instance 'U_7' of 'and'
   rx_ready_c <= ready AND sb_internal;

   -- ModuleWare code(v1.12) for instance 'U_9' of 'constval'
   lat_g <= '0';

   -- ModuleWare code(v1.12) for instance 'sel_tx_bit' of 'mux'
   sel_tx_bitcombo_proc: PROCESS(bit_g, bit_c, sb_internal)
   BEGIN
      CASE sb_internal IS
      WHEN '0' => bit_in <= bit_g;
      WHEN '1' => bit_in <= bit_c;
      WHEN OTHERS => bit_in <= 'X';
      END CASE;
   END PROCESS sel_tx_bitcombo_proc;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'or'
   transmit <= tx_g OR tx_c;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'or'
   lat <= lat_g OR lat_c;

   -- Instance port mappings.
   U_0 : bonus_t1_shield_initial_reset
      PORT MAP (
         clk   => clk,
         rst_n => rst_n,
         done  => done,
         s_rst => s_rst
      );
   U_2 : bonus_t2_serial_data_transmit
      PORT MAP (
         bit_in   => bit_in,
         clk      => clk,
         rst_n    => rst_n,
         transmit => transmit,
         ready    => ready,
         s_clk    => s_clk,
         s_sda    => s_sda
      );
   U_8 : reg_bank
      PORT MAP (
         clk      => clk,
         pixd_in  => pixd_in,
         rst_n    => rst_n,
         w_done   => frame_written,
         write    => write,
         xr       => xr,
         xw       => xw,
         yr       => yr,
         yw       => yw,
         pixd_out => pixd,
         w_rdy    => w_rdy
      );
   U_3 : serial_led_cannon
      PORT MAP (
         clk     => clk,
         pixdata => pixd,
         rst_n   => rst_n,
         run     => rx_ready_c,
         bit_out => bit_c,
         chans   => channel,
         lat     => lat_c,
         tx      => tx_c,
         x       => xr,
         y       => yr
      );
   U_1 : v2_gamma
      PORT MAP (
         clk     => clk,
         rst_n   => rst_n,
         run     => rx_ready,
         bit_out => bit_g,
         sb      => sb_internal,
         tx      => tx_g
      );

   -- Implicit buffered output assignments
   sb <= sb_internal;

END struct;