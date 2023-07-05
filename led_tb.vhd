--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:49:18 04/04/2019
-- Design Name:   
-- Module Name:   F:/VHDL/CilipadiLED/led_tb.vhd
-- Project Name:  LED64_FSM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LEB_RND
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY led_tb IS
END led_tb;
 
ARCHITECTURE behavior OF led_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT led
    PORT(
         datain : IN  std_logic_vector(0 to 63);
         dataout : OUT  std_logic_vector(0 to 63);
         cln : IN  std_logic;
         const1 : IN  std_logic_vector(0 to 3);
         const2 : IN  std_logic_vector(0 to 3);
         const3 : IN  std_logic_vector(0 to 3);
         const4 : IN  std_logic_vector(0 to 3);
         const5 : IN  std_logic_vector(0 to 3);
         const6 : IN  std_logic_vector(0 to 3);
         const7 : IN  std_logic_vector(0 to 3);
         const8 : IN  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   --Inputs
   signal DATAIN : std_logic_vector(0 to 63) := (others => '0');
   signal CLK : std_logic := '0';
   signal CONST1 : std_logic_vector(0 to 3) := (others => '0');
   signal CONST2 : std_logic_vector(0 to 3) := (others => '0');
   signal CONST3 : std_logic_vector(0 to 3) := (others => '0');
   signal CONST4 : std_logic_vector(0 to 3) := (others => '0');
   signal CONST5 : std_logic_vector(0 to 3) := (others => '0');
   signal CONST6 : std_logic_vector(0 to 3) := (others => '0');
   signal CONST7 : std_logic_vector(0 to 3) := (others => '0');
   signal CONST8 : std_logic_vector(0 to 3) := (others => '0');

 	--Outputs
   signal DATAOUT : std_logic_vector(0 to 63);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LEB_RND PORT MAP (
          DATAIN => DATAIN,
          DATAOUT => DATAOUT,
          CLK => CLK,
          CONST1 => CONST1,
          CONST2 => CONST2,
          CONST3 => CONST3,
          CONST4 => CONST4,
          CONST5 => CONST5,
          CONST6 => CONST6,
          CONST7 => CONST7,
          CONST8 => CONST8
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		DATAIN <= x"0000000000000000";
          
          CLK <= '1';
          CONST1 <= x"0";
          CONST2 <= x"1";
          CONST3 <= x"2";
          CONST4 <= x"3";
          CONST5 <= x"0";
          CONST6 <= x"1";
          CONST7 <= x"0";
          CONST8 <= x"1";
      wait;
   end process;

END;
