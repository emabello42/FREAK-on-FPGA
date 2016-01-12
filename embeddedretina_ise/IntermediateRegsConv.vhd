--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_F8MKfI
-- /___/   /\     Timestamp : 04/05/2014 20:58:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;
use work.RetinaParameters.ALL;
entity IntermediateRegsConv is
   port ( clk        : in    std_logic; 
          enableIn   : in    std_logic; 
          inputValue : in    std_logic_vector (OUT_VERT_CONV_BW-1 downto 0); 
          rst        : in    std_logic; 
          enableOut  : out   std_logic; 
          outputData : out   T_INPUT_HORIZONTAL_CONVOLUTION
    );
end IntermediateRegsConv;

architecture BEHAVIORAL of IntermediateRegsConv is
	--type T_SCALE_VALUES_FIFO is array std_logic_vector(NUMBER_OF_SCALES-1 downto 0) of std_logic_vector(OUT_VERT_CONV_BW-1 downto 0);
	
	signal intermediate_registers: T_INPUT_HORIZONTAL_CONVOLUTION := (others =>(others => '0'));
	signal counter: integer range 0 to KERNEL_SIZE-1 := 0;
begin
proceso1: process(clk)
begin
if rising_edge(clk) then
        if rst = '1' then
		intermediate_registers <= (others => (others => '0'));
                counter <= 0;
                enableOut <= '0';  
        elsif enableIn = '1' then
	        intermediate_registers(0) <= inputValue;
                loop1: for i in 1 to KERNEL_SIZE-1 loop
                        intermediate_registers(i) <= intermediate_registers(i-1); 
                end loop loop1; 
                if counter = KERNEL_SIZE-1 then
	                counter <= 0;
                        enableOut <= '1';
                else
                        counter <= counter + 1;
                        enableOut <= '0';
                end if;
        else     
                enableOut <= '0';
        end if;
        
end if;--end if rising_edge(clk)
end process proceso1;
outputData <= intermediate_registers;
end BEHAVIORAL;


