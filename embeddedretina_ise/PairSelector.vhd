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
--  /   /         Filename : xil_I25VXL
-- /___/   /\     Timestamp : 04/06/2014 00:33:59
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
entity PairSelector is
   port ( clk       : in    std_logic; 
          enableIn  : in    std_logic; 
          pointSet  : in    T_POINT_SET; 
          rst       : in    std_logic; 
          enableOut : out   std_logic; 
          point1    : out   std_logic_vector(OUT_HORIZ_CONV_BW-1 downto 0); 
          point2    : out   std_logic_vector(OUT_HORIZ_CONV_BW-1 downto 0)
	);
end PairSelector;

architecture BEHAVIORAL of PairSelector is
	signal s_addr: integer range 0 to 511;
	signal s_pointSetAux: T_POINT_SET;
	signal s_enableAux: std_logic;
begin
load_points: process(clk)
begin
	if rising_edge(clk) then
		if rst = '1' then
			s_pointSetAux <= (others => (others => '0'));
			s_enableAux <= '0';
		else
			if enableIn = '1' then
				for i in 0 to 511 loop
					s_pointSetAux(i) <= pointSet(i);
				end loop;
				s_enableAux <= '1';
			end if;
		end if;
	end if;
end process;
select_points: process(clk)
begin
	if rising_edge(clk) then
		if rst = '1' then
			s_addr <= 0;
		elsif s_enableAux = '1' then
			point1 <= std_logic_vector(to_unsigned(ROM_PAIRS(s_addr)(0), point1'length));
			point2 <= std_logic_vector(to_unsigned(ROM_PAIRS(s_addr)(1), point2'length));
		end if;
		enableOut <= s_enableAux;
	end if;
end process;
end BEHAVIORAL;


