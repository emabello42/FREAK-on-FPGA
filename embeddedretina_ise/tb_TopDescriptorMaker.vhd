--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:53:14 05/24/2014
-- Design Name:   
-- Module Name:   /media/DATA42/Dropbox/EmbeddedRetina/embeddedretina_ise/tb_DescriptorMaker.vhd
-- Project Name:  EmbeddedRetina_ISE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TopDescriptorMaker
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY tb_TopDescriptorMaker IS
END tb_TopDescriptorMaker;
 
ARCHITECTURE behavior OF tb_TopDescriptorMaker IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TopDescriptorMaker
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         enableIn : IN  std_logic;
         inputValue : IN  std_logic_vector(13 downto 0);
         descriptor : OUT  std_logic_vector(511 downto 0);
         enableOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal enableIn : std_logic := '0';
   signal inputValue : std_logic_vector(13 downto 0) := (others => '0');

 	--Outputs
   signal descriptor : std_logic_vector(511 downto 0);
   signal enableOut : std_logic;
   signal validOutputs: integer range 0 to 2 := 0;
   signal end_simulation: std_logic := '0';
   signal end_aux: std_logic := '0';
   -- Clock period definitions
   signal counter: integer range 0 to 86 := 0;
   type T_INPUT_DATA is array (0 to 85) of integer range 0 to 16383;
   constant clk_period : time := 10 ns;
   constant inputdata: T_INPUT_DATA :=
   (
   1,10,2,20,3,30,4,40,5,50,6,60,7,70,8,80,9,90,10,100,11,110,12,120,13,130,14,140,15,150,16,160,
   17,170,18,180,19,190,20,200,21,210,22,220,23,230,24,240,25,250,26,260,27,270,28,280,29,290,30,300,
   31,310,32,320,33,330,34,340,35,350,36,360,37,370,38,380,39,390,40,400,41,410,42,420,43,430
   );
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopDescriptorMaker PORT MAP (
          clk => clk,
          rst => rst,
          enableIn => enableIn,
          inputValue => inputValue,
          descriptor => descriptor,
          enableOut => enableOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   reset_proc: process
   begin
      -- hold reset state for 100 ns.
      rst <= '1';
      wait for 100 ns;	
      rst <= '0';
      
    --  wait for clk_period*100;
      -- insert stimulus here 
      
      wait;
   end process;

--simulate the GaussianFilter output
stim_proc: process(clk)
begin
if rising_edge(clk) then
        if rst = '1' then                                 
                counter <= 0;
                validOutputs <=0;  
                enableIn <= '0';
        elsif end_aux = '0' then 
                if counter = 86 then
                        counter <= 0;
                        enableIn <= '0';
                       -- end_aux <= '1';
                else
                        enableIn <= '1';
                        inputValue <= std_logic_vector(to_unsigned(inputdata(counter),inputValue'length));
                        counter <= counter +1;
                end if;
        end if;
        if enableOut = '1' then
                validOutputs <= validOutputs+1;            
        end if;
        if validOutputs = 2 then
                end_simulation <= '1';
        end if;
        if end_simulation = '1' then
                assert false report "SUCCESSFUL: Simulation End." severity failure;
        end if;
end if;
end process;

END;
