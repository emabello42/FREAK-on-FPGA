--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:54:53 05/28/2014
-- Design Name:   
-- Module Name:   /media/DATA42/Dropbox/EmbeddedRetina/embeddedretina_ise/tb_DescriptorMaker.vhd
-- Project Name:  EmbeddedRetina_ISE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DescriptorMaker
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
 
ENTITY tb_DescriptorMaker IS
END tb_DescriptorMaker;
 
ARCHITECTURE behavior OF tb_DescriptorMaker IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DescriptorMaker
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         pointIndexs1 : IN  std_logic_vector(15 downto 0);
         pointIndexs2 : IN  std_logic_vector(15 downto 0);
         enableInPointSet : IN  std_logic;
         pointSet : IN  std_logic_vector(42 downto 0);
         descriptor : OUT  std_logic_vector(511 downto 0);
         enableOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal pointIndexs1 : std_logic_vector(15 downto 0) := (others => '0');
   signal pointIndexs2 : std_logic_vector(15 downto 0) := (others => '0');
   signal enableInPointSet : std_logic := '0';
   signal pointSet : std_logic_vector(42 downto 0) := (others => '0');

 	--Outputs
   signal descriptor : std_logic_vector(511 downto 0);
   signal enableOut : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DescriptorMaker PORT MAP (
          clk => clk,
          rst => rst,
          pointIndexs1 => pointIndexs1,
          pointIndexs2 => pointIndexs2,
          enableInPointSet => enableInPointSet,
          pointSet => pointSet,
          descriptor => descriptor,
          enableOut => enableOut
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
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
