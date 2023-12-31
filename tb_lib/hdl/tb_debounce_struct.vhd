-- VHDL Entity tb_lib.tb_debounce.symbol
--
-- Created:
--          by - kayra.UNKNOWN (WS-11696-PC)
--          at - 13:47:36 07/27/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_debounce IS
-- Declarations

END tb_debounce ;

--
-- VHDL Architecture tb_lib.tb_debounce.struct
--
-- Created:
--          by - kayra.UNKNOWN (WS-11696-PC)
--          at - 12:44:02  3.09.2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY tb_lib;

ARCHITECTURE struct OF tb_debounce IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL btn_out       : std_logic;
   SIGNAL button_to_DUV : std_logic;
   SIGNAL clk           : std_logic;
   SIGNAL rst_n         : std_logic;


   -- Component Declarations
   COMPONENT debounce_tester
   PORT (
      button_from_duv : IN     std_logic;
      button_to_DUV   : OUT    std_logic;
      clk             : OUT    std_logic;
      rst_n           : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : debounce_tester USE ENTITY tb_lib.debounce_tester;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : debounce_tester
      PORT MAP (
         button_from_duv => btn_out,
         button_to_DUV   => button_to_DUV,
         clk             => clk,
         rst_n           => rst_n
      );

END struct;
