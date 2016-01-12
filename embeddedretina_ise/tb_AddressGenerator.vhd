--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:37:23 11/26/2013
-- Design Name:   
-- Module Name:   /media/DATA42/Projects/ComputerVision/RetinaDescriptors/tb_AddressGenerator.vhd
-- Project Name:  RetinaDescriptors
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: AddressGenerator
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
use work.RetinaParameters.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_AddressGenerator IS
END tb_AddressGenerator;
 
ARCHITECTURE behavior OF tb_AddressGenerator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AddressGenerator
    PORT(
         clk : IN  std_logic;
         en : IN  std_logic;
         rst : IN  std_logic;
         coord_x : IN  std_logic_vector(KPT_COORD_BW-1 downto 0);
         coord_y : IN  std_logic_vector(KPT_COORD_BW-1 downto 0);
         image_base_addr : IN  std_logic_vector(31 downto 0);
         mem_addr : OUT  std_logic_vector(31 downto 0);
         out_en : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal en : std_logic := '0';
   signal rst : std_logic := '0';
   signal coord_x : std_logic_vector(KPT_COORD_BW-1 downto 0) := (others => '0');
   signal coord_y : std_logic_vector(KPT_COORD_BW-1 downto 0) := (others => '0');
   signal image_base_addr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal mem_addr : std_logic_vector(31 downto 0);
   signal out_en : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AddressGenerator PORT MAP (
          clk => clk,
          en => en,
          rst => rst,
          coord_x => coord_x,
          coord_y => coord_y,
          image_base_addr => image_base_addr,
          mem_addr => mem_addr,
          out_en => out_en
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rst <= '1';
      wait for 100 ns;	
      rst <= '0';
      wait for clk_period*10;
      coord_x <= "0001000000";
      coord_y <= "0001000001";
      image_base_addr <= "00000000000000000000000000000000";
      en <= '1';  
      -- insert stimulus here 

      wait;
   end process;

END;
