--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_OuyKy6
-- /___/   /\     Timestamp : 04/06/2014 00:34:07
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;
use work.RetinaParameters.ALL;
entity DoG is
   port ( clk       : in    std_logic; 
          enableIn  : in    std_logic; 
          point1    : in    std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0); 
          point2    : in    std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0); 
          enableOut : out   std_logic; 
          test      : out   std_logic);
end DoG;

architecture BEHAVIORAL of DoG is
begin
process(clk)
begin
	if rising_edge(clk) then
		if enableIn = '1' then
			if unsigned(point1) > unsigned(point2) then
				test <= '1';
			else
				test <= '0';
			end if;
		end if;
		enableOut <= enableIn;
	end if;
end process;
end BEHAVIORAL;


