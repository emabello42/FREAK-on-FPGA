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
----------------------------------------------------------------------------------
-- Company: LCR
-- Engineer: Emmanuel Bello
-- 
-- Create Date:    16:44:33 10/24/2013 
-- Design Name: 
-- Module Name:    rom_coe - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.RetinaParameters.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom_coe is
	port(
		clk:            in	 std_logic;
		address:        in	 std_logic_vector(N_GAUSS_KERNEL_BW-1 downto 0);
		data_out:       out     std_logic_vector(KERNEL_ROM_BW-1  downto 0)
	);
end rom_coe;

architecture Behavioral of rom_coe is
	type rom_coe_type is array (NUMBER_OF_KERNELS-1 downto 0) of std_logic_vector (KERNEL_ROM_BW-1 downto 0);
	constant rom_coe_data : rom_coe_type :=
	(
0 => ("0000101001000001010010000010100010000101000000001001110"),
1 => ("0000111011000001110110000011101000000111000000001101011"),
2 => ("0001001100100010011000000100100100001000101000000000000"),
3 => ("0001101011100011010010000110000110000000000000000000000"),
4 => ("0010110000000101010000000000000000000000000000000000000"),
5 => ("0010110110000101001010000000000000000000000000000000000"),
6 => ("1000000000000000000000000000000000000000000000000000000"),
7 => ("0000111010000001110100000011100110000111000100001101111"),
8 => ("0001001011000010010101000100100100001000111000000000000"),
9 => ("0001101001000011001111000110010000000000000000000000000"),
10 => ("0010101101100101010011000000000000000000000000000000000"),
11 => ("0010110000000101010000000000000000000000000000000000000"),
12 => ("0010110110000101001010000000000000000000000000000000000"),
13 => ("1000000000000000000000000000000000000000000000000000000"),
14 => ("0001001010000010010100000100100100001001000000000000000"),
15 => ("0001001011000010010101000100100100001000111000000000000"),
16 => ("0001101001000011001111000110010000000000000000000000000"),
17 => ("0010101101100101010011000000000000000000000000000000000"),
18 => ("0010110000000101010000000000000000000000000000000000000"),
19 => ("1000000000000000000000000000000000000000000000000000000"),
20 => ("1000000000000000000000000000000000000000000000000000000")
	);
begin
   rom: process(clk)
	begin
        if rising_edge(clk) then
                data_out <=rom_coe_data(to_integer(resize(unsigned(address),N_GAUSS_KERNEL_BW)));
               -- data_out <=rom_coe_data(0);
        end if;
   end process rom;
end architecture Behavioral;
