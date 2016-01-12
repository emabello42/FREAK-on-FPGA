--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_hg0Oyc
-- /___/   /\     Timestamp : 04/05/2014 21:13:39
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

entity GaussianFilter is
   port ( ADDR       : in    std_logic_vector (N_GAUSS_KERNEL_BW-1 downto 0); 
          CLK        : in    std_logic; 
          ENABLEIN   : in    std_logic; 
          INPUTARRAY : in    T_INPUT_VERTICAL_CONVOLUTION; 
          RST        : in    std_logic; 
          ENABLEOUT  : out   std_logic; 
          OUTPUTDATA : out   std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0)
	);
end GaussianFilter;

architecture BEHAVIORAL of GaussianFilter is
--	component ROM_GAUSS_COE is
--	PORT (
--		CLK: IN  STD_LOGIC;
--		WE: IN  STD_LOGIC;
--		SPO: OUT STD_LOGIC_VECTOR(KERNEL_ROM_BW-1 downto 0);
--		A: IN  STD_LOGIC_VECTOR(3 downto 0);
--		D: IN  STD_LOGIC_VECTOR(KERNEL_ROM_BW-1 downto 0)
--      );
--	end component;
	
	component rom_coe is
	port(
		clk	:	in	std_logic;
		address	:	in	std_logic_vector(N_GAUSS_KERNEL_BW-1 downto 0);
		data_out:	out	std_logic_vector(KERNEL_ROM_BW-1  downto 0)
	);
	end component;
	
	component VerticalConvolution is
        port ( 
          clk            : in    std_logic; 
          rst            : in    std_logic;
          enableIn       : in    std_logic; 
          gaussianKernel : in    std_logic_vector (KERNEL_ROM_BW-1 downto 0); 
          inputArray     : in    T_INPUT_VERTICAL_CONVOLUTION; 
          enableOut      : out   std_logic; 
          outputData     : out   std_logic_vector (OUT_VERT_CONV_BW-1 downto 0)
			 );
        end component;
	
	--component IntermediateBufferConv is
	--port ( clk        : in    std_logic; 
         -- enableIn   : in    std_logic; 
          --inputValue : in    std_logic_vector (OUT_VERT_CONV_BW-1 downto 0); 
          --rst        : in    std_logic; 
          --enableOut  : out   std_logic; 
          --outputData : out   T_INPUT_HORIZONTAL_CONVOLUTION
	--		 );
	--end component;
	component IntermediateRegsConv is
        port ( clk        : in    std_logic; 
          enableIn   : in    std_logic; 
          inputValue : in    std_logic_vector (OUT_VERT_CONV_BW-1 downto 0); 
          rst        : in    std_logic; 
          enableOut  : out   std_logic; 
          outputData : out   T_INPUT_HORIZONTAL_CONVOLUTION
        );
        end component;
	
	component HorizontalConvolution is
        port ( clk            : in    std_logic;
          rst            : in    std_logic;
          enableIn       : in    std_logic; 
          gaussianKernel : in    std_logic_vector (KERNEL_ROM_BW-1 downto 0); 
          inputData      : in    T_INPUT_HORIZONTAL_CONVOLUTION; 
          enableOut      : out   std_logic; 
          outputData     : out   std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0)
			 );
        end component;
   signal intermediate_registers: T_INPUT_HORIZONTAL_CONVOLUTION;
   signal output_vert_conv: std_logic_vector(OUT_VERT_CONV_BW-1 downto 0);
   signal gaussian_coefficients: std_logic_vector(KERNEL_ROM_BW-1  downto 0);
   signal out_enable_vert_conv: std_logic;
   signal in_enable_horiz_conv: std_logic;
--	signal WE: std_logic := '0';
--	signal D: std_logic_vector(KERNEL_ROM_BW-1  downto 0) := (others => '0');
begin
   --mapping
--	gauss_coe: ROM_GAUSS_COE
--	port map(
--		CLK => CLK,
--		WE => WE,
--		SPO => gaussian_coefficients,
--		A => ADDR,
--		D => D   
--	);
	gauss_coe: rom_coe
	port map(
		clk => CLK,
		data_out => gaussian_coefficients,
		address => ADDR
	);
	
	vert_conv: VerticalConvolution
	port map(
	   clk => CLK,
	   enableIn => ENABLEIN,
	   rst => RST,
	   inputArray => INPUTARRAY,
	   gaussianKernel => gaussian_coefficients,
	   outputData => output_vert_conv,
	   enableOut => out_enable_vert_conv  
	);
	Intermediate_RegsConv: IntermediateRegsConv
	port map(
		clk => CLK,
		enableIn => out_enable_vert_conv,
		rst => RST,
		inputValue => output_vert_conv,
		enableOut => in_enable_horiz_conv,
		outputData => intermediate_registers
	);
	horiz_conv: HorizontalConvolution
	port map(
		clk => CLK,
		rst => RST,
                enableIn => in_enable_horiz_conv,
	        inputData => intermediate_registers,
                gaussianKernel => gaussian_coefficients,
                outputData => OUTPUTDATA,
                enableOut => ENABLEOUT
	);
	--end of mapping
end BEHAVIORAL;


