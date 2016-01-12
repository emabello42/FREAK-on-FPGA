--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_F8MKfI
-- /___/   /\     Timestamp : 04/05/2014 20:58:17
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
entity IntermediateFifoConv is
   port ( clk        : in    std_logic;  
          rst        : in    std_logic;
          enableIn   : in    std_logic;
		  inputValue : in    std_logic_vector (OUT_VERT_CONV_BW-1 downto 0);
          enableOut  : out   std_logic;
          outputData : out   std_logic_vector (OUT_VERT_CONV_BW-1 downto 0)
	);
end IntermediateFifoConv;

architecture BEHAVIORAL of IntermediateFifoConv is
	type T_SCALE_VALUES_FIFO is array (NUMBER_OF_SCALES-1 downto 0) of std_logic_vector(OUT_VERT_CONV_BW-1 downto 0);
	signal intermediate_fifo: T_SCALE_VALUES_FIFO := (others => (others => '0'));
	signal counter: integer range 0 to NUMBER_OF_SCALES-1 := 0;
begin
process(clk)
begin
if rising_edge(clk) then
	if rst = '1' then
		intermediate_fifo <= (others => (others => '0'));
		enableOut <= '0';
		counter <= 0;
	else
		if enableIn = '1' then
			-------WORKS ONLY FOR NUMBER_OF_SCALES > 2  ??????
			intermediate_fifo(0) <= inputValue;
			for i in 1 to NUMBER_OF_SCALES-1 loop
				intermediate_fifo(i) <= intermediate_fifo(i-1);
			end loop;
			if counter = NUMBER_OF_SCALES-1 then
				enableOut <= '1';
				counter <= 0;
			else
				counter <= counter +1;
				enableOut <= '0';
			end if;
		else
			enableOut <= '0';
		end if;
	end if;
end if;
end process;
outputData <= intermediate_fifo(NUMBER_OF_SCALES-1);
end BEHAVIORAL;


