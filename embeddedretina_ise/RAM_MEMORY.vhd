--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_F9LRRL
-- /___/   /\     Timestamp : 04/06/2014 00:33:54
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
entity RAM_MEMORY is
   port ( 
		clk		:	IN	std_logic;
		address	:   IN	std_logic_vector(31 downto 0);
		read_en	:   IN	std_logic;
		data_out:   OUT	std_logic_vector(7 downto 0)
	);
end RAM_MEMORY;

architecture BEHAVIORAL of PointBuffer is
	signal sPointSet: T_POINT_SET := others => (others => '0')); 
	signal enables: std_logic_vector(N_POINTS-2 downto 0);
	signal counter1: integer range 0 to N_POINTS*NUMBER_OF_SCALES-1 = 0;
	signal counter2: integer range 0 to NUMBER_OF_SCALES-1 := 0;
	component PointFifo
	port ( clk       : in    std_logic; 
          enableIn   : in    std_logic; 
          inputValue : in    std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0); 
          rst        : in    std_logic; 
          enableOut  : out   std_logic; 
          outputValue: out   std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0)
	);
	end component;
begin
        pointFifo0: PointFifo
	port map(
		clk => clk,
		enableIn => enableIn,
		inputValue => inputValue,
		rst => rst,
		enableOut => enables(0),
		outputValue => sPointSet(1)
	);
	genPointBuffer: for i in 1 to N_POINTS-2 generate
		pointFifoX: PointFifo
		port map(
			clk => clk,
			enableIn => enables(i-1),
			inputValue => sPointSet(i),
			rst => rst,
			enableOut => enables(i),
			outputValue => sPointSet(i+1)
		);
	end generate genPointBuffer;
process(clk)
begin
if rising_edge(clk) then
    if rst = '1' then
		counter1 <= 0;
		counter2 <= 0;
		enableOut <= '0';
	else
		if enableIn = '1' then
		        sPointSet(0) <= inputValue;
		        if counter1 = N_POINTS*NUMBER_OF_SCALES-1 then
					if counter2 = NUMBER_OF_SCALES-1 then
						counter2 <= 0;
						counter1 <= 0;
					else
						counter2 <= counter2+1;
					end if;
					enableOut <= '1';
				else
					counter1 <= counter1+1;
					enableOut <= '0';
				end if;
		else
			enableOut <= '0';
		end if;
	end if;
end if;
end process;
pointSet <= sPointSet;
end BEHAVIORAL;


