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
--  /   /         Filename : xil_6QjEG2
-- /___/   /\     Timestamp : 04/05/2014 20:58:04
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
entity VerticalConvolution is
   port ( clk            : in    std_logic;
          rst            : in    std_logic;  
          enableIn       : in    std_logic; 
          gaussianKernel : in    std_logic_vector (KERNEL_ROM_BW-1 downto 0); 
          inputArray     : in    T_INPUT_VERTICAL_CONVOLUTION; 
          enableOut      : out   std_logic; 
          outputData     : out   std_logic_vector (OUT_VERT_CONV_BW-1 downto 0)
   );
end VerticalConvolution;

architecture BEHAVIORAL of VerticalConvolution is
	signal s1_vert_conv_array: T_S1_VERT_CONV;
	signal s1_vert_enable: std_logic;
	signal s2_vert_conv_array: T_S2_VERT_CONV;
	signal s2_vert_enable: std_logic;
	signal s3_vert_conv: std_logic_vector(S3_VERT_CONV_BW-1 downto 0);
begin
filtrar: process(clk)
begin
if rising_edge(clk) then
    if rst = '1' then
            s1_vert_conv_array <= (others =>(others => '0'));
            s1_vert_enable <= '0';
            s2_vert_conv_array <= (others =>(others => '0'));
            s2_vert_enable <= '0';
            s3_vert_conv <= (others => '0');
    else
		if enableIn = '1' then
		--step 1
			loop1: for i in 0 to (KERNEL_SIZE_ROM-1)-1 loop
				s1_vert_conv_array(KERNEL_SIZE_ROM-1-i) <= std_logic_vector(resize(unsigned(inputArray(i)) 
																			+ unsigned(inputArray(KERNEL_SIZE-1-i)),
																			s1_vert_conv_array(0)'length)
																			);
			end loop loop1;
			s1_vert_conv_array(0) <= std_logic_vector(resize(unsigned(inputArray(KERNEL_SIZE_ROM-1)), s1_vert_conv_array(0)'length));
		end if;
		s1_vert_enable <= enableIn;
		if s1_vert_enable = '1' then
		--step 2
	                loop2: for j in 0 to (KERNEL_SIZE_ROM-1) loop
			        s2_vert_conv_array(j) <= std_logic_vector(resize(unsigned(s1_vert_conv_array(j)) * 
								unsigned(
								        gaussianKernel(
								            GAUSSIAN_COE_BW*(KERNEL_SIZE_ROM-j) -1  
								                downto
								            GAUSSIAN_COE_BW*(KERNEL_SIZE_ROM -j) -GAUSSIAN_COE_BW
								        )
								 ), 
								 s2_vert_conv_array(0)'length));
                        end loop loop2;
		end if;
        s2_vert_enable <= s1_vert_enable;
		if s2_vert_enable = '1' then
	        --step 3
	                s3_vert_conv <= std_logic_vector(resize(
					((unsigned(s2_vert_conv_array(0)) + unsigned(s2_vert_conv_array(1)))+			
					(unsigned(s2_vert_conv_array(2)) + unsigned(s2_vert_conv_array(3))))+
						
					(unsigned(s2_vert_conv_array(4)))--+
					--(unsigned(s2_vert_conv_array(6)) + unsigned(s2_vert_conv_array(7))))+
						
					--((unsigned(s2_vert_conv_array(8)) + unsigned(s2_vert_conv_array(9)))+
					--(unsigned(s2_vert_conv_array(10)) + unsigned(s2_vert_conv_array(11))))+
					
					--((unsigned(s2_vert_conv_array(12)) + unsigned(s2_vert_conv_array(13)))+
					--(unsigned(s2_vert_conv_array(14))))
					, s3_vert_conv'length));  
                end if;
                enableOut <= s2_vert_enable;
        end if;
end if;
end process filtrar;
outputData <= s3_vert_conv(S3_VERT_CONV_BW-1 downto SCALE_FACTOR_SH);
end BEHAVIORAL;


