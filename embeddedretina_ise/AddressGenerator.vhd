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
--  /   /         Filename : xil_A26CnV
-- /___/   /\     Timestamp : 04/06/2014 00:33:30
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use work.RetinaParameters.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity AddressGenerator is
   port ( busy_in     : in    std_logic; 
          clk         : in    std_logic; 
          imgBaseAddr : in    std_logic_vector (31 downto 0); 
          kptCoordX   : in    std_logic_vector (KPT_COORD_BW-1 downto 0);--keypoint's column possition 
          kptCoordY   : in    std_logic_vector (KPT_COORD_BW-1 downto 0); --keypoint's row possition
          kptScale    : in    std_logic_vector(KPT_SCALE_BW-1 downto 0);--keypoint's scale
          kptOctave   : in    std_logic_vector(KPT_OCTAVE_BW-1 downto 0);--keypoint's octave
          request_in  : in    std_logic; 
          rst         : in    std_logic; 
          kptScaleOut : out   std_logic_vector(KPT_SCALE_BW-1 downto 0);--keypoint's scale
          addr        : out   std_logic_vector (31 downto 0); 
          busy_out    : out   std_logic; 
          request_out : out   std_logic
          );
end AddressGenerator;

architecture BEHAVIORAL of AddressGenerator is
	type points_coord_type is array(11 downto 0) of integer range -23 to 23;
	type rom_coord_type is array (20 downto 0) of points_coord_type;
	--coordinates of each point on the retina pattern, from OUTER to INNER
	constant rom_coord_data : rom_coord_type :=
	(
	0 => (23,0,12,20,-12,20,-23,0,-12,-20,12,-20),
        1 => (15,9,0,17,-15,9,-15,-9,0,-17,15,-9),
        2 => (13,0,6,11,-6,11,-13,0,-6,-11,6,-11),
        3 => (8,4,0,9,-8,4,-8,-4,0,-9,8,-4),
        4 => (6,0,3,5,-3,5,-6,0,-3,-5,3,-5),
        5 => (3,2,0,4,-3,2,-3,-2,0,-4,3,-2),
        6 => (3,0,1,3,-1,3,-3,0,-1,-3,1,-3),
        7 => (18,0,9,16,-9,16,-18,0,-9,-16,9,-16),
        8 => (12,7,0,14,-12,7,-12,-7,0,-14,12,-7),
        9 => (10,0,5,9,-5,9,-10,0,-5,-9,5,-9),
        10 => (6,3,0,7,-6,3,-6,-3,0,-7,6,-3),
        11 => (5,0,2,4,-2,4,-5,0,-2,-4,2,-4),
        12 => (3,2,0,3,-3,2,-3,-2,0,-3,3,-2),
        13 => (2,0,1,2,-1,2,-2,0,-1,-2,1,-2),
        14 => (15,0,7,13,-7,13,-15,0,-7,-13,7,-13),
        15 => (10,5,0,11,-10,6,-10,-5,0,-11,10,-5),
        16 => (8,0,4,7,-4,7,-8,0,-4,-7,4,-7),
        17 => (5,3,0,6,-5,3,-5,-3,0,-6,5,-3),
        18 => (4,0,2,3,-2,3,-4,0,-2,-3,2,-3),
        19 => (2,1,0,2,-2,1,-2,-1,0,-2,2,-1),
        20 => (2,0,1,2,-1,2,-2,0,-1,-2,1,-2)
	);
	signal point_set_id: integer range 0 to 7;--describes each point set included the center of the retina pattern(the keypoint's possition)
	signal point_addr: std_logic_vector(31 downto 0);
	signal select_pair: integer range 0 to 5;
	
	type consumer_FSM_states is (INIT, REQ, WAITING, READY);
	signal s_consumerState: consumer_FSM_states;
	type producer_FSM_states is (INIT, REQ);
	signal s_producerState: producer_FSM_states;
begin

consumer_proc: process(clk)
begin
        if rising_edge(clk) then
                if rst = '1' then
                        s_consumerState <= INIT;
						request_out <= '0';
                else
                        case s_consumerState is
                        when INIT =>
                                if busy_in = '0' then
                                        request_out <= '1';
                                        s_consumerState <= REQ;
                                end if;
                        when REQ =>
                                if busy_in = '1' then
                                        request_out <= '0';
                                        s_consumerState <= WAITING;
                                end if;
                        when WAITING =>
                                if busy_in = '0' then
                                        s_consumerState <= READY;
                                end if;
                        when READY =>
                                if select_pair = 5 and point_set_id = 7 then
                                        s_consumerState <= INIT;
                                end if;
                        end case; 
                end if;
        end if; 
end process;

producer_proc: process(clk)
begin
        if rising_edge(clk) then
                if rst = '1' then
                        s_producerState <= INIT;
                        busy_out <= '0';
                else
                        case s_producerState is
                        when INIT =>
                                if request_in = '1' then
                                        busy_out <= '1';
                                        s_producerState <= REQ;
                                end if;
                        when REQ =>
                                if s_consumerState = READY then
                                       busy_out <= '0'; 
                                       s_producerState <= INIT;
                                end if;
                        end case;
                end if;
        end if;
end process;
addr_generation_proc: process(clk)
        --variable tmp1: integer range -1023 to 1023;
        --variable tmp2: integer range -1023*IMAGE_WIDTH to 1023*IMAGE_WIDTH;
        variable coordArray: points_coord_type;
begin
        if rising_edge(clk) then
	        if rst = '1' then
			point_set_id <= 0;
			select_pair <= 5;
			point_addr <= (others => '0');
			kptScaleOut <= (others => '0');
		elsif s_consumerState = READY and s_producerState = REQ then
		        if point_set_id = 7 then
				point_addr <= std_logic_vector(
		                                to_unsigned(
							   to_integer(unsigned(imgBaseAddr)) +
							   to_integer(unsigned(kptOctave))*IMAGE_WIDTH*IMAGE_HEIGHT +
							   to_integer(unsigned(kptCoordX)) + 
							   (to_integer(unsigned(kptCoordY)))*IMAGE_WIDTH
							   , point_addr'length)
					        );
		        else
				coordArray := rom_coord_data(point_set_id + 7*to_integer(unsigned(kptScale)));
				point_addr <= std_logic_vector(
		                                to_unsigned(
							   to_integer(unsigned(imgBaseAddr)) +
							   to_integer(unsigned(kptOctave))*IMAGE_WIDTH*IMAGE_HEIGHT +
							   to_integer(unsigned(kptCoordX)) + coordArray(select_pair*2+1) +
							   (to_integer(unsigned(kptCoordY)) + coordArray(select_pair*2))*IMAGE_WIDTH
							   , point_addr'length)
					        );
                        end if;
		 --       if point_set_id = 7 then
		--	        tmp1 := to_integer(unsigned(kptCoordX));
		--		tmp2 := (to_integer(unsigned(kptCoordY)))*IMAGE_WIDTH;
		 --       else
		--		coordArray := rom_coord_data(point_set_id + 7*to_integer(unsigned(kptScale)));
		--		tmp1 := to_integer(unsigned(kptCoordX)) + coordArray(select_pair*2+1);--column possition offset
		--		tmp2 := (to_integer(unsigned(kptCoordY)) + coordArray(select_pair*2))*IMAGE_WIDTH;--row possition offset
                --        end if;
		--		point_addr <= std_logic_vector(
		  --                              to_unsigned(
		--					   to_integer(unsigned(imgBaseAddr)) +
		--					   to_integer(unsigned(kptOctave))*IMAGE_WIDTH*IMAGE_HEIGHT +
		--					   
		--					   tmp1 + tmp2
		--					   
		--					   
		--					   , point_addr'length)
		--			        ); 
					        
					        
			kptScaleOut <= kptScale;
		        if point_set_id = 7 then
			        point_set_id <= 0;
			        select_pair <= 5;
			elsif select_pair = 0 then
				select_pair <= 5;	 
				point_set_id <= point_set_id + 1;
			else
				select_pair <= select_pair -1;			    
			end if;
		end if;
	end if;--rising_edge(clk)
end process;

addr <= point_addr;

end BEHAVIORAL;


