--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:53:34 11/28/2013
-- Design Name:   
-- Module Name:   /media/DATA42/Projects/ComputerVision/RetinaDescriptors/td_GaussianFilter.vhd
-- Project Name:  RetinaDescriptors
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GaussianFilter
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
USE work.RetinaParameters.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY td_GaussianFilter IS
END td_GaussianFilter;
 
ARCHITECTURE behavior OF td_GaussianFilter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT GaussianFilter
    PORT(
         CLK        : in    std_logic; 
         ENABLEIN   : in    std_logic;
         RST        : in    std_logic;
         ADDR       : in    std_logic_vector (N_GAUSS_KERNEL_BW-1 downto 0);
         INPUTARRAY : in    T_INPUT_VERTICAL_CONVOLUTION;
         OUTPUTDATA : out   std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0);
         ENABLEOUT  : out   std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';
   signal reset : std_logic := '0';
   signal address : std_logic_vector(N_GAUSS_KERNEL_BW-1 downto 0) := (others => '0');
   signal input_array : T_INPUT_VERTICAL_CONVOLUTION := (others => (others => '0'));

 	--Outputs
   signal output_data : std_logic_vector(OUT_HORIZ_CONV_BW-1 downto 0);
   signal output_enable : std_logic;
   signal counter: std_logic := '0';
   -- Clock period definitions
   constant clk_period : time := 10 ns;
   --others
   signal j: integer range -1 to 10 := 10;
   --image data
   type image_row_type is array (10 downto 0) of integer range 0 to 10;
   type image_data_type is array (10 downto 0) of image_row_type;
   constant image_data : image_data_type :=
   (
0 => (0,1,2,3,4,5,6,7,8,9,10),
1 => (0,1,2,3,4,5,6,7,8,9,10),
2 => (0,1,2,3,4,5,6,7,8,9,10),
3 => (0,1,2,3,4,5,6,7,8,9,10),
4 => (0,1,2,3,4,5,6,7,8,9,10),
5 => (0,1,2,3,4,5,6,7,8,9,10),
6 => (0,1,2,3,4,5,6,7,8,9,10),
7 => (0,1,2,3,4,5,6,7,8,9,10),
8 => (0,1,2,3,4,5,6,7,8,9,10),
9 => (0,1,2,3,4,5,6,7,8,9,10),
10 => (0,1,2,3,4,5,6,7,8,9,10)
);
   --end image data
   
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: GaussianFilter PORT MAP (
          CLK => clk,
          ENABLEIN => enable,
          RST => reset,
          ADDR => address,
          INPUTARRAY => input_array,
          OUTPUTDATA => output_data,
          ENABLEOUT => output_enable
    );

   -- Clock process definitions
   clk_process: process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   reset_proc: process
   begin
      -- hold reset state for 100 ns.
      reset <= '1';
      wait for 100 ns;	
      reset <= '0';
      --wait for clk_period*35;
      --assert False
      --report "The special time has arrived!"
      --severity Failure;
      wait;
   end process;
  
   -- Stimulus process
   stim_proc: process(clk)
   variable array_data: T_INPUT_VERTICAL_CONVOLUTION;
        --variable image_row: image_row_type;
   begin
      if rising_edge(clk) then
        if reset = '0' then
                if j >= 0 then
                        for i in 0 to 10 loop
                           --image_row := image_data(i);
                                array_data(i) := std_logic_vector(to_unsigned(image_data(i)(j), PIXEL_BW));
                        end loop;
                        input_array <= array_data;
                        enable <= '1';
                        if counter = '1' then
                           address <= "0111";
                           counter <= '0';
                           j <= j -1;
                        else
                            counter <= '1';
                            address <= "0000";
                        end if;
                else
                    enable <= '0';    
                end if;
        end if;
      end if;
   end process;

END;
