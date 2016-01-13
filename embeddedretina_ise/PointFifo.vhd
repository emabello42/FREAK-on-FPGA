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
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_F9LRRL
-- /___/   /\     Timestamp : 04/06/2014 00:33:54
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
entity PointFifo is
   port ( clk        : in    std_logic; 
          enableIn   : in    std_logic; 
          inputValue : in    std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0); 
          rst        : in    std_logic;
          enableOut  : out   std_logic;
          outputValue: out   std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0)
	);
end PointFifo;

architecture BEHAVIORAL of PointFifo is
    type T_POINT_ARRAY is array (NUMBER_OF_SCALES-1 downto 0) of (OUT_HORIZ_CONV_BW-1 downto 0);
	signal s_point_array: T_POINT_ARRAY := (others => (others => '0'));
	signal counter: integer range 0 to NUMBER_OF_SCALES-1 := 0;
begin
process(clk)
begin
if rising_edge(clk) then
    if rst = '1' then
	    s_point_array <= (others => (others => '0'));
		enableOut <= '0';
		counter <= 0;
	else
		if enableIn = '1' then
			s_point_array(0) <= inputValue;
			for i in 1 to NUMBER_OF_SCALES-1 loop
				s_point_array(i) <= s_point_array(i-1); 
			end loop;
			if counter = NUMBER_OF_SCALES-1 then
				enableOut <= '1';
				counter <= 0;
			else
			    counter <= counter +1;
				enableOut <= '0';
			end if;
		else
			enableOut <= '0';
		end if;
	end if;
end if;
end process;
outputValue <= s_point_array(NUMBER_OF_SCALES-1);
end BEHAVIORAL;
