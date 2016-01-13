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
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:09:09 06/06/2014 
-- Design Name: 
-- Module Name:    TOP_DESIGN - Behavioral 
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
use work.RetinaParameters.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_DESIGN is
     port (
        CLK           : in    std_logic;
        RST           : in    std_logic;
        ENABLE_IN     : in    std_logic;
        DATA_IN       : in    std_logic_vector (7 downto 0);
        DATA_OUT      : OUT    std_logic_vector (7 downto 0);
        ENABLE_OUT     : OUT    std_logic
     );
end TOP_DESIGN;

architecture Behavioral of TOP_DESIGN is
          signal ENABLE        : std_logic; 
          signal IMG_BASE_ADDR : std_logic_vector (31 downto 0); 
          signal KPTS_ADDR     : std_logic_vector (31 downto 0); 
          signal KPT_DATA      : std_logic_vector (31 downto 0); 
          signal PIXEL_DATA    : std_logic_vector (PIXEL_BW-1 downto 0);  
          signal KPT_ADDR_MEM  : std_logic_vector (31 downto 0);
          signal PIXEL_ADDR_MEM: std_logic_vector (31 downto 0);
          signal DESCRIPTOR    : std_logic_vector (DESCRIPTOR_SIZE-1 downto 0); 
          signal ENABLEOUT     : std_logic; 
          signal KPT_READ_MEM  : std_logic;
          signal PIXEL_READ_MEM      : std_logic;
component RetinaDescriptorGenerator is
   port ( CLK           : in    std_logic; 
          ENABLE        : in    std_logic; 
          IMG_BASE_ADDR : in    std_logic_vector (31 downto 0); 
          KPTS_ADDR     : in    std_logic_vector (31 downto 0); 
          KPT_DATA      : in    std_logic_vector (31 downto 0); 
          PIXEL_DATA    : in    std_logic_vector (PIXEL_BW-1 downto 0); 
          RST           : in    std_logic; 
          KPT_ADDR_MEM  : out   std_logic_vector (31 downto 0);
          PIXEL_ADDR_MEM: out   std_logic_vector (31 downto 0);
          DESCRIPTOR    : out   std_logic_vector (DESCRIPTOR_SIZE-1 downto 0); 
          ENABLEOUT     : out   std_logic; 
          KPT_READ_MEM      : out   std_logic;
          PIXEL_READ_MEM      : out   std_logic
	);
end component;
begin
retina: RetinaDescriptorGenerator
port map(
          CLK           => CLK, 
          ENABLE        => ENABLE, 
          IMG_BASE_ADDR => IMG_BASE_ADDR, 
          KPTS_ADDR     => KPTS_ADDR, 
          KPT_DATA      => KPT_DATA, 
          PIXEL_DATA    => PIXEL_DATA, 
          RST           => RST, 
          KPT_ADDR_MEM  => KPT_ADDR_MEM,
          PIXEL_ADDR_MEM => PIXEL_ADDR_MEM,
          DESCRIPTOR => DESCRIPTOR, 
          ENABLEOUT => ENABLEOUT, 
          KPT_READ_MEM => KPT_READ_MEM,
          PIXEL_READ_MEM => PIXEL_READ_MEM
);
process(clk)
begin
if rising_edge(clk)then
        if rst = '1' then
                ENABLE <= '0';
                IMG_BASE_ADDR<= (others => '0'); 
                KPTS_ADDR <=    (others => '0'); 
                KPT_DATA    <=  (others => '0'); 
                PIXEL_DATA  <=  (others => '0');
        elsif ENABLE_IN = '1' then
               case DATA_IN is
                when "00000001" => --cargar registro IMG_BASE_ADDR
                        IMG_BASE_ADDR <= "00000000000000000000000000100000";
                when "00000010" => -- cargar registro KPTS_ADDR
                        KPTS_ADDR <= "00000000000000000000000000000000";
                when "00000011" => -- cargar registro KPTS_ADDR
                        KPT_DATA <= "00000000001000000001000000100000";
                when "00000100" => -- cargar registro KPTS_ADDR
                        PIXEL_DATA <= "00100100";
                when "00000101" => -- RUN!
                        ENABLE <= '1';
               end case;
               if 
        end if;
end if;
end process;
end Behavioral;

