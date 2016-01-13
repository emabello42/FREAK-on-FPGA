--Copyright 2014 by Emmanuel D. Bello <emabello42@gmail.com>
--Laboratorio de Computacion Reconfigurable (LCR)
--Universidad Tecnologica Nacional
--Facultad Regional Mendoza
--Argentina

--This file is part of FREAK-on-FPGA.

--FREAK-on-FPGA is free software: you can redistribute it and/or modify
--it under the terms of the GNU General Public License as published by
--the Free Software Foundation, either version 3 of the License, or
--(at your option) any later version.

--FREAK-on-FPGA is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU General Public License for more details.

--You should have received a copy of the GNU General Public License
--along with FREAK-on-FPGA.  If not, see <http://www.gnu.org/licenses/>.
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:37:05 06/12/2014
-- Design Name:   
-- Module Name:   /media/DATA42/Dropbox/EmbeddedRetina/embeddedretina_ise/tb_RetinaDescriptorGenerator.vhd
-- Project Name:  EmbeddedRetina_ISE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RetinaDescriptorGenerator
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
 
ENTITY tb_RetinaDescriptorGenerator IS
END tb_RetinaDescriptorGenerator;
 
ARCHITECTURE behavior OF tb_RetinaDescriptorGenerator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RetinaDescriptorGenerator
    PORT(
         CLK : IN  std_logic;
         ENABLE : IN  std_logic;
         IMG_BASE_ADDR : IN  std_logic_vector(31 downto 0);
         KPTS_ADDR : IN  std_logic_vector(31 downto 0);
         KPT_DATA : IN  std_logic_vector(31 downto 0);
         PIXEL_DATA : IN  std_logic_vector(7 downto 0);
         RST : IN  std_logic;
         KPT_ADDR_MEM : OUT  std_logic_vector(31 downto 0);
         PIXEL_ADDR_MEM : OUT  std_logic_vector(31 downto 0);
         DESCRIPTOR : OUT  std_logic_vector(511 downto 0);
         ENABLEOUT : OUT  std_logic;
         KPT_READ_MEM : OUT  std_logic;
         PIXEL_READ_MEM : OUT  std_logic
        );
    END COMPONENT;
    
    COMPONENT RAM
    PORT(
                clk:            IN std_logic;
		address:        IN std_logic_vector(31 downto 0);
		read_en:        IN std_logic;
		data_out:       OUT std_logic_vector(7 downto 0)
    );
    END COMPONENT;

   --Inputs
   signal CLK : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal IMG_BASE_ADDR : std_logic_vector(31 downto 0) := (others => '0');
   signal KPTS_ADDR : std_logic_vector(31 downto 0) := (others => '0');
   signal KPT_DATA : std_logic_vector(31 downto 0) := (others => '0');
   signal PIXEL_DATA : std_logic_vector(7 downto 0) := (others => '1');
   signal RST : std_logic := '0';

 	--Outputs
   signal KPT_ADDR_MEM : std_logic_vector(31 downto 0);
   signal PIXEL_ADDR_MEM : std_logic_vector(31 downto 0);
   signal DESCRIPTOR : std_logic_vector(511 downto 0);
   signal ENABLEOUT : std_logic;
   signal KPT_READ_MEM : std_logic;
   signal PIXEL_READ_MEM : std_logic;
   signal contador: integer range 0 to 4000000 := 0;
signal end_simulation: std_logic := '0';
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RetinaDescriptorGenerator PORT MAP (
          CLK => CLK,
          ENABLE => ENABLE,
          IMG_BASE_ADDR => IMG_BASE_ADDR,
          KPTS_ADDR => KPTS_ADDR,
          KPT_DATA => KPT_DATA,
          PIXEL_DATA => PIXEL_DATA,
          RST => RST,
          KPT_ADDR_MEM => KPT_ADDR_MEM,
          PIXEL_ADDR_MEM => PIXEL_ADDR_MEM,
          DESCRIPTOR => DESCRIPTOR,
          ENABLEOUT => ENABLEOUT,
          KPT_READ_MEM => KPT_READ_MEM,
          PIXEL_READ_MEM => PIXEL_READ_MEM
        );

comp_ram: RAM PORT MAP(
             clk => CLK,
             address => PIXEL_ADDR_MEM,
             read_en => PIXEL_READ_MEM,
             data_out => PIXEL_DATA
             );
   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
reset_proc: process
   begin
      -- hold reset state for 100 ns.
      rst <= '1';
      wait for 100 ns;	
      rst <= '0';
      
    --  wait for clk_period*100;
      -- insert stimulus here 
      
      wait;
   end process;

   -- Stimulus process
stim_proc: process(clk)
begin
if rising_edge(clk) then
        if rst = '1' then
                IMG_BASE_ADDR <= "00000000000000000000001000000000";
                KPTS_ADDR <= "00000000000000000000000000000000";
                KPT_DATA <= "00000000000000110010000011001000";
                ENABLE <= '0';
                PIXEL_DATA <= (others => '1');
		contador <= 0;
        elsif contador = 0 then
	        contador <= contador +1;
	        ENABLE <= '1';
	else
	        contador <= contador +1;
	        ENABLE <= '0';
	end if;
		
	if ENABLEOUT = '1' then
                end_simulation <= '1';               
        end if;
        if end_simulation = '1' then
                assert false report "SUCCESSFUL: Simulation End." severity failure;
        end if;
end if;
end process; 

END;
