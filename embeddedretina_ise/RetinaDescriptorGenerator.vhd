--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_S42m9M
-- /___/   /\     Timestamp : 05/09/2014 00:41:30
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
entity RetinaDescriptorGenerator is
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
end RetinaDescriptorGenerator;

architecture BEHAVIORAL of RetinaDescriptorGenerator is
component KeypointReader is
   port ( addr      : in    std_logic_vector (31 downto 0); 
          enableIn  : in    std_logic;
          clk       : in    std_logic; 
          memData   : in    std_logic_vector (31 downto 0); 
          request   : in    std_logic; 
          rst       : in    std_logic; 
          busy      : out   std_logic; 
          kptCoordX : out   std_logic_vector (KPT_COORD_BW-1 downto 0);--keypoint's column possition
          kptCoordY : out   std_logic_vector (KPT_COORD_BW-1 downto 0);--keypoint's row possition
          kptScale  : out   std_logic_vector(KPT_SCALE_BW-1 downto 0);
          kptOctave : out   std_logic_vector(KPT_OCTAVE_BW-1 downto 0);
          memAddr   : out   std_logic_vector (31 downto 0); 
          read_mem  : out   std_logic
	);
end component;
	--signals between KeypointReader and AddressGenerator:
	---Control
	signal sCtrlBusyKptAddr: std_logic;
	signal sCtrlRequestKptAddr: std_logic;
	---Data
	signal skptCoordX: std_logic_vector (KPT_COORD_BW-1 downto 0);
	signal skptCoordY: std_logic_vector (KPT_COORD_BW-1 downto 0);
	signal skptScale  : std_logic_vector(KPT_SCALE_BW-1 downto 0);
        signal skptOctave : std_logic_vector(KPT_OCTAVE_BW-1 downto 0);
component AddressGenerator is
   port ( busy_in     : in    std_logic; 
          clk         : in    std_logic; 
          imgBaseAddr : in    std_logic_vector (31 downto 0); 
          kptCoordX   : in    std_logic_vector (KPT_COORD_BW-1 downto 0);--keypoint's column possition 
          kptCoordY   : in    std_logic_vector (KPT_COORD_BW-1 downto 0); --keypoint's row possition
          kptScale    : in    std_logic_vector(KPT_SCALE_BW-1 downto 0);--keypoint's scale
          kptOctave   : in    std_logic_vector(KPT_OCTAVE_BW-1 downto 0);--keypoint's octave
          request_in  : in    std_logic; 
          rst         : in    std_logic; 
          kptScaleOut : out   std_logic_vector(KPT_SCALE_BW-1 downto 0);--keypoint's scale
          addr        : out   std_logic_vector (31 downto 0); 
          busy_out    : out   std_logic; 
          request_out : out   std_logic
          );
end component;
	--signals between AddressGenerator and ImagePatchReader:
	---Control
	signal sCtrlBusyAddrImgRd: std_logic;
	signal sCtrlRequestAddrImgRd: std_logic;
	---Data
	signal skptScaleOut  : std_logic_vector(KPT_SCALE_BW-1 downto 0);
	signal sGeneratedAddr: std_logic_vector (31 downto 0);
component ImagePatchReader is
   port ( addr        : in    std_logic_vector (31 downto 0); 
          kptScale    : in    std_logic_vector(KPT_SCALE_BW-1 downto 0);--keypoint's scale
          busy_in     : in    std_logic; 
          clk         : in    std_logic; 
          memData     : in    std_logic_vector (PIXEL_BW-1 downto 0); 
          rst         : in    std_logic; 
          addrKernel  : out   std_logic_vector (N_GAUSS_KERNEL_BW-1 downto 0); 
          en_out      : out   std_logic; 
          memAddr     : out   std_logic_vector (31 downto 0); 
          patchColumn : out   T_INPUT_VERTICAL_CONVOLUTION; 
          readMem     : out   std_logic; 
          request_out : out   std_logic
          );
end component;
	--signals between ImagePatchReader and GaussianFilter:
	---Control
	signal sEnableImgRdGauss: std_logic;
	---Data
	signal sAddrKernel: std_logic_vector (N_GAUSS_KERNEL_BW-1 downto 0);
	signal sPatchColumn: T_INPUT_VERTICAL_CONVOLUTION;
component GaussianFilter is
   port ( ADDR       : in    std_logic_vector (N_GAUSS_KERNEL_BW-1 downto 0); 
          CLK        : in    std_logic; 
          ENABLEIN   : in    std_logic; 
          INPUTARRAY : in    T_INPUT_VERTICAL_CONVOLUTION; 
          RST        : in    std_logic; 
          ENABLEOUT  : out   std_logic; 
          OUTPUTDATA : out   std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0)
	);
end component;
	--signals between GaussianFilter and PointBuffer:
	---Control
	signal sEnableGaussOut: std_logic;
	---Data
	signal sPointValue: std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0);

component TopDescriptorMaker is
   port ( clk        : in    std_logic;
          rst        : in    std_logic;
          enableIn   : in    std_logic; 
          inputValue : in    std_logic_vector (OUT_HORIZ_CONV_BW-1 downto 0);
          descriptor : out   std_logic_vector (DESCRIPTOR_SIZE-1 downto 0); 
          enableOut  : out   std_logic
	);
end component;
begin
--mapping
   keypoint_Reader: KeypointReader
   port map( addr => KPTS_ADDR, 
          enableIn  =>    ENABLE,
	  clk       =>    CLK, 
          memData   =>    KPT_DATA,
          request   =>    sCtrlRequestKptAddr,
          rst       =>    RST, 
          busy      =>   sCtrlBusyKptAddr,
          kptCoordX =>   skptCoordX,
          kptCoordY =>   skptCoordY, 
          kptScale  =>   skptScale,
	  kptOctave =>   skptOctave,
          memAddr   =>   KPT_ADDR_MEM,
          read_mem  =>   KPT_READ_MEM
   );
   
   address_Generator: AddressGenerator
   port map( busy_in   =>    sCtrlBusyKptAddr,
             clk =>    CLK,
             imgBaseAddr =>   IMG_BASE_ADDR,
             kptCoordX   =>   skptCoordX,
             kptCoordY   =>   skptCoordY, 
             kptScale    =>   skptScale,
	     kptOctave   =>   skptOctave,
             request_in  =>   sCtrlRequestAddrImgRd,
	     rst         =>   RST, 
	     kptScaleOut => skptScaleOut,
	     addr        =>   sGeneratedAddr,
             busy_out    =>   sCtrlBusyAddrImgRd,
             request_out =>   sCtrlRequestKptAddr
	);
	imagePatch_Reader: ImagePatchReader
   port map( addr     =>    sGeneratedAddr, 
          busy_in     =>    sCtrlBusyAddrImgRd,
          kptScale    =>    skptScaleOut,
          clk         =>    CLK, 
          memData     =>    PIXEL_DATA,
          rst         =>    RST,
          addrKernel  =>   sAddrKernel,
          en_out      =>   sEnableImgRdGauss,
          memAddr     =>   PIXEL_ADDR_MEM, 
          patchColumn =>   sPatchColumn, 
          readMem     =>   PIXEL_READ_MEM,
          request_out =>   sCtrlRequestAddrImgRd
	);
	gaussian_Filter: GaussianFilter
   port map( ADDR    =>    sAddrKernel,
          CLK        =>    CLK,
          ENABLEIN   =>    sEnableImgRdGauss, 
          INPUTARRAY =>    sPatchColumn,
          RST        =>    RST,
          ENABLEOUT  =>   sEnableGaussOut,
          OUTPUTDATA =>   sPointValue
	);
		
	TopDescriptor_Maker: TopDescriptorMaker
	port map( 
		clk => CLK,
		rst => RST,
		enableIn => sEnableGaussOut, 
		inputValue => sPointValue,
		descriptor => DESCRIPTOR,
		enableOut => ENABLEOUT
	);
end BEHAVIORAL;


