----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:55:53 06/12/2014 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
PORT(
                clk:            IN std_logic;
		address:        IN std_logic_vector(31 downto 0);
		read_en:        IN std_logic;
		data_out:       OUT std_logic_vector(7 downto 0)
    );
end RAM;

architecture Behavioral of RAM is

begin
process(clk)
begin
if rising_edge(clk)then
        if read_en = '1' then
                data_out <= (others => '1');
        end if;
end if;
end process;

end Behavioral;

