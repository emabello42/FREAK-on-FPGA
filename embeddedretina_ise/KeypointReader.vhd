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
--  /   /         Filename : xil_5vbn0d
-- /___/   /\     Timestamp : 04/06/2014 00:33:22
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
entity KeypointReader is
   port ( addr      : in    std_logic_vector (31 downto 0); 
          enableIn  : in    std_logic;
          clk       : in    std_logic; 
          memData   : in    std_logic_vector (31 downto 0); 
          request   : in    std_logic; 
          rst       : in    std_logic; 
          busy      : out   std_logic; 
          kptCoordX : out   std_logic_vector (KPT_COORD_BW-1 downto 0);--keypoint's column possition
          kptCoordY : out   std_logic_vector (KPT_COORD_BW-1 downto 0);--keypoint's row possition
          kptScale  : out   std_logic_vector(KPT_SCALE_BW-1 downto 0);
          kptOctave : out   std_logic_vector(KPT_OCTAVE_BW-1 downto 0);
          memAddr   : out   std_logic_vector (31 downto 0); 
          read_mem  : out   std_logic
	);
end KeypointReader;

architecture BEHAVIORAL of KeypointReader is
        signal addrAux: std_logic_vector(31 downto 0) := (others => '0');
	signal enableAux: std_logic := '0';
	type reading_mem_states is (INIT, READING, READY);
	signal s_readingMemState: reading_mem_states;
	
	type producer_FSM_states is (INIT, REQ);
	signal s_producerState: producer_FSM_states;
	--signal s_memData: std_logic_vector (31 downto 0);
	signal s_offset: natural range 0 to integer'HIGH;

begin

producer_proc: process(clk)
begin
	if rising_edge(clk) then
		if rst = '1' then
			s_producerState <= INIT;
			busy <= '0';
		else
			case s_producerState is
				when INIT =>
					if request = '1' then
						busy <= '1';
						s_producerState <= REQ;
					end if;
				when REQ =>
					if s_readingMemState = READY then
						busy <= '0'; 
						s_producerState <= INIT;
					end if;
			end case;	
		end if;
	end if;
end process;

load_kpt_data: process(clk)
begin
if rising_edge(clk) then
        if rst = '1' then
                addrAux <= (others => '0');
        elsif enableIn = '1' then
                addrAux <= addr;
                enableAux <= enableIn;
        end if;
end if;
end process;
read_keypoints: process(clk)
begin 
	if rising_edge(clk) then
		if rst = '1' then
			s_readingMemState <= INIT;
			kptCoordX <= (others => '0');
			kptCoordY <= (others => '0');
			memAddr <= (others => '0');
			s_offset <= 0;
			read_mem <= '0';
		else
			if enableAux = '1' AND s_producerState = REQ then
				case s_readingMemState is
				when INIT =>
					memAddr <= std_logic_vector(resize(unsigned(addrAux) + s_offset,32));
                                        read_mem <= '1';
					s_offset <= s_offset + 4;
                                        s_readingMemState <= READING;
                                when READING =>
					read_mem <= '0';
                                        s_readingMemState <= READY;
                                when READY =>
					kptCoordX <= memData(KPT_COORD_BW-1 downto 0);--9 a 0
					kptCoordY <= memData(2*KPT_COORD_BW-1 downto KPT_COORD_BW);--19 a 10
					kptScale <= memData((2*KPT_COORD_BW+KPT_SCALE_BW)-1 downto 2*KPT_COORD_BW);--25 a 20
					kptOctave <= memData((2*KPT_COORD_BW+KPT_SCALE_BW+KPT_OCTAVE_BW)-1 downto (2*KPT_COORD_BW+KPT_SCALE_BW));
               s_readingMemState <= INIT;
				end case; 
			end if;
		end if;
   end if;
end process;

end BEHAVIORAL;
