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
--  /   /         Filename : xil_XMTEyY
-- /___/   /\     Timestamp : 04/06/2014 00:33:38
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
entity ImagePatchReader is
   port ( addr        : in    std_logic_vector (31 downto 0); 
          kptScale    : in    std_logic_vector(KPT_SCALE_BW-1 downto 0);--keypoint's scale
          busy_in     : in    std_logic; 
          clk         : in    std_logic; 
          memData     : in    std_logic_vector (PIXEL_BW-1 downto 0); 
          rst         : in    std_logic; 
          addrKernel  : out   std_logic_vector (N_GAUSS_KERNEL_BW-1 downto 0); 
          en_out      : out   std_logic; 
          memAddr     : out   std_logic_vector (31 downto 0); 
          patchColumn : out   T_INPUT_VERTICAL_CONVOLUTION; 
          readMem     : out   std_logic; 
          request_out : out   std_logic
   );
end ImagePatchReader;

architecture BEHAVIORAL of ImagePatchReader is
	signal s_column_array: T_INPUT_VERTICAL_CONVOLUTION;
	type consumer_FSM_states is (INIT, REQ, WAITING, READY);
	signal s_consumerState: consumer_FSM_states;
	type reading_mem_states is (INIT, READING, READY, END_READ);
	signal s_readingMemState: reading_mem_states;
	signal s_mem_addr: std_logic_vector(31 downto 0);
	signal row_counter: integer range 0 to KERNEL_SIZE;
	signal col_counter: integer range 0 to KERNEL_SIZE;
	signal pointCounterA: integer range 0 to N_POINTS-1;--total number of points
	signal pointCounterB: integer range 0 to 6;--number of points on each concentric circle
	signal sAddrKernel: std_logic_vector (N_GAUSS_KERNEL_BW-1 downto 0);
begin

consumer_proc: process(clk)
begin
        if rising_edge(clk) then
                if rst = '1' then
                        s_consumerState <= INIT;
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
                                if s_readingMemState = END_READ then
                                        s_consumerState <= INIT;
                                end if;
                        end case; 
                end if;
        end if; 
end process;

patch_reading_proc: process(clk)
begin
if rising_edge(clk) then
	if rst = '1' then
		s_readingMemState <= INIT;
		s_column_array <= (others => (others => '0'));
		en_out <= '0';
		readMem <= '0';
	elsif s_consumerState = READY then
		case s_readingMemState is
		when INIT =>
			 s_mem_addr <= std_logic_vector(to_unsigned(to_integer(unsigned(addr)) +
								 (KERNEL_SIZE_ROM-1)*(1-IMAGE_WIDTH)
								 , s_mem_addr'length));
			 readMem <= '1'; 
			 s_readingMemState <= READING;
			 row_counter <= 0;
			 col_counter <= 0;
			 en_out <= '0';
	        when READING =>
			 readMem <= '0';
			 s_readingMemState <= READY;
			 en_out <= '0';
	        when READY =>
			s_column_array(0) <= memData;
			for i in 1 to KERNEL_SIZE-1 loop
				s_column_array(i) <= s_column_array(i-1); 
			end loop;
			--read the next pixel
			if row_counter = KERNEL_SIZE-1 then
			        row_counter <= 0;
				if col_counter = KERNEL_SIZE-1 then
				        s_readingMemState <= END_READ;
					col_counter <= 0;
					readMem <= '0';
				else
				        s_mem_addr <= std_logic_vector(to_unsigned(
									to_integer(unsigned(s_mem_addr)) 
									 - (IMAGE_WIDTH*(KERNEL_SIZE-1)+1)
									 , s_mem_addr'length)); --first row, previous column
					col_counter <= col_counter + 1;
					readMem <= '1';  
					s_readingMemState <= READING;
				end if;
				en_out <= '1'; 
			else
				s_mem_addr <= std_logic_vector(to_unsigned(to_integer(
										 unsigned(s_mem_addr)) +IMAGE_WIDTH
										 , s_mem_addr'length));--next row, same column
				row_counter <= row_counter + 1;
				en_out <= '0';
				readMem <= '1';  
				s_readingMemState <= READING;
			end if;
		when END_READ => 
			en_out <= '0';
			s_readingMemState <= INIT;
		end case;
	else
		en_out <= '0';
	end if;
end if;
end process;

selectGaussKernel: process(clk)
begin
	if rising_edge(clk) then
		if rst = '1' then
			pointCounterA <= 0;
			pointCounterB <= 0;
			sAddrKernel <= (others => '0');
		elsif s_readingMemState = END_READ then
			if pointCounterA = N_POINTS-1 then
			   pointCounterA <= 0;
				sAddrKernel <= (others => '0');
			else
				pointCounterA <= pointCounterA + 1;				
			end if;
			if pointCounterA /= N_POINTS-2 then
			        if  pointCounterB = 5 then
			        	pointCounterB <= 0;
			        	sAddrKernel <= std_logic_vector(resize(unsigned(sAddrKernel) + 1 , sAddrKernel'length));
			        else
			        	pointCounterB <= pointCounterB + 1;
			        end if;
			end if;
			
		end if;
	end if;
end process;
memAddr <= s_mem_addr;
patchColumn <= s_column_array;
addrKernel <= std_logic_vector(resize(unsigned(sAddrKernel) + unsigned(kptScale)*NKERNEL_BY_SCALES, sAddrKernel'length));
end BEHAVIORAL;
