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

entity DescriptorMaker is
   port ( clk        : in std_logic;
          rst        : in std_logic;
          pointIndexs1: in T_POINT_INDEX; 
          pointIndexs2: in T_POINT_INDEX;
          enableInPointSet  : in std_logic;
          pointSet   : in T_POINT_SET;
          descriptor : out std_logic_vector (DESCRIPTOR_SIZE-1 downto 0); 
          enableOut  : out std_logic
	);
end DescriptorMaker;

architecture BEHAVIORAL of DescriptorMaker is
        signal counter: integer range 0 to 31 := 0;
        signal sDescriptor : std_logic_vector (DESCRIPTOR_SIZE-1 downto 0) := (others => '0');
        signal innerEnable: std_logic := '0';
	signal sPointSet: T_POINT_SET := (others => (others => '0'));
begin

createDescriptor: process(clk)
	variable index_i: integer range 0 to 42;
	variable index_j: integer range 0 to 42;
begin
if rising_edge(clk) then
    if rst = '1' then
                counter <= 0;
                enableOut <= '0';
                sPointSet <= (others => (others => '0'));
                innerEnable <= '0';
                sDescriptor <= (others => '0');
	elsif enableInPointSet = '1' then
                sPointSet <= pointSet;
                innerEnable <= '1';
                enableOut <= '0';
    elsif innerEnable = '1' then
	        for i in 0 to 15 loop
	                index_i := to_integer(resize(unsigned(pointIndexs1(i)),6));
	                index_j := to_integer(resize(unsigned(pointIndexs2(i)),6)); 
	                if unsigned(sPointSet(index_i)) > unsigned(sPointSet(index_j)) then
	                        sDescriptor(counter*16+i) <= '1';
	                else
	                        sDescriptor(counter*16+i) <= '0';
	                end if;
	        end loop;
	        if counter = 31 then
	                counter <= 0;
	                innerEnable <= '0';
                        enableOut <= '1';
	        else
	                innerEnable <= '1';
	                enableOut <= '0';
	                counter <= counter +1;
	        end if;
	else
	        enableOut <= '0';
	end if;
end if;
end process;
descriptor <= sDescriptor;
end BEHAVIORAL;


