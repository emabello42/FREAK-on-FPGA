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
--  /   /         Filename : xil_3coJ3K
-- /___/   /\     Timestamp : 04/06/2014 00:34:14
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

entity TopDescriptorMaker is
   port ( clk        : in    std_logic;
          rst        : in    std_logic;
          enableIn   : in    std_logic; 
          inputValue : in    std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0);
          descriptor : out   std_logic_vector (DESCRIPTOR_SIZE-1 downto 0); 
          enableOut  : out   std_logic
	);
end TopDescriptorMaker;

architecture BEHAVIORAL of TopDescriptorMaker is
	signal sPointSet: T_POINT_SET;
	signal sEnableOutPBuff: std_logic := '0';
	signal addr: std_logic_vector(4 downto 0);
	signal points1: T_POINT_INDEX;
	signal points2: T_POINT_INDEX;
	
	component ROM_PAIRS
	port(
	        clk	:	in	std_logic;
	        addr    :       in      std_logic_vector(4 downto 0);
		points1 :       out     T_POINT_INDEX;
		points2 :       out     T_POINT_INDEX
	);
	end component;
	
	component PointBuffer is
        port ( clk        : in    std_logic; 
          enableIn   : in    std_logic; 
          inputValue : in    std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0); 
          rst        : in    std_logic; 
          enableOut  : out   std_logic; 
          pointSet   : out   T_POINT_SET
	);
	end component;
	
	component DescriptorMaker is
        port ( clk        : in std_logic;
               rst        : in std_logic;
               pointIndexs1: in T_POINT_INDEX; 
               pointIndexs2: in T_POINT_INDEX;
               enableInPointSet  : in std_logic;
               pointSet   : in T_POINT_SET;
               descriptor : out std_logic_vector (DESCRIPTOR_SIZE-1 downto 0); 
               enableOut  : out std_logic
			);
        end component;
begin
--mapping
	rom: ROM_PAIRS
	port map(
		clk => clk,
		addr => addr,
		points1 => points1,
		points2 => points2
	);
	pointBufferX: PointBuffer
	port map( clk  =>   clk,
		  enableIn   =>   enableIn,
		  inputValue =>   inputValue, 
		  rst        =>   rst,
		  enableOut  =>   sEnableOutPBuff, 
		  pointSet   =>   sPointSet
	);
	descripMakerX: DescriptorMaker
   port map( clk => clk,
             rst => rst,
             pointIndexs1 => points1, 
             pointIndexs2 => points2,
             enableInPointSet  => sEnableOutPBuff,
             pointSet => sPointSet,
             descriptor => descriptor, 
             enableOut  => enableOut
	 );
loadPointIndexes: process(clk)
begin
if rising_edge(clk) then
    if rst = '1' then
	addr <= (others => '0');
    else
        if sEnableOutPBuff = '1' then
	        addr <= "00001";
	elsif addr = "11111" then
		addr <= (others => '0');
	else
	        addr <= std_logic_vector(resize(unsigned(addr)+1,addr'length));
	end if;
    end if;  
end if;
end process;
end BEHAVIORAL;
