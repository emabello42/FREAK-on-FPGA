--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package RetinaParameters is

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--
   constant IMAGE_WIDTH: natural  := 640;--640
   constant IMAGE_HEIGHT: natural := 480;--480
   constant PIXEL_BW : natural := 8;
   constant KPT_COORD_BW : natural := 10;
   constant KPT_SCALE_BW: natural := 6;
   constant KPT_OCTAVE_BW: natural := 2;
   --constant OFFSET_COORD_BW : natural := 8;
   constant NUM_POINT_SET: natural := 6;
   constant COORD_ROM_BW: natural := 2*NUM_POINT_SET;
   constant S1_VERT_CONV_BW : natural := PIXEL_BW+1;
   constant S2_VERT_CONV_BW : natural := S1_VERT_CONV_BW *2;
   constant NUMBER_OF_SCALES: natural := 3;
   constant NUMBER_OF_KERNELS: natural := NUMBER_OF_SCALES*7;-- equal to 7*NUMBER_OF_SCALES!!!!!
   constant NKERNEL_BY_SCALES: natural := NUMBER_OF_KERNELS/2;
   constant N_GAUSS_KERNEL_BW: natural := 6; --proporcional al NUMBER OF KERNELS!!!!!!!
   constant GAUSSIAN_COE_BW : natural := 11;
   constant SCALE_FACTOR_SH : natural := 10;
   constant KERNEL_SIZE : natural := 9;--proporcional al numero de scalas!!!!!!
   constant KERNEL_SIZE_ROM : natural := (KERNEL_SIZE-1)/2 +1;--equal to (KERNEL_SIZE-1)/2 +1
   constant KERNEL_ROM_BW : natural := KERNEL_SIZE_ROM*GAUSSIAN_COE_BW;
   constant S3_VERT_CONV_BW : natural := 20; --24 = log2((2^S2_VERT_CONV_BW -1)*KERNEL_SIZE_ROM)
   constant OUT_VERT_CONV_BW : natural := S3_VERT_CONV_BW - SCALE_FACTOR_SH;
   constant S1_HORIZ_CONV_BW : natural := OUT_VERT_CONV_BW+1;
   constant S2_HORIZ_CONV_BW : natural := S1_HORIZ_CONV_BW *2;
   constant S3_HORIZ_CONV_BW : natural := 24;--32 = log2((2^S2_HORIZ_CONV_BW -1)*KERNEL_SIZE_ROM)
   constant OUT_HORIZ_CONV_BW : natural := S3_HORIZ_CONV_BW - SCALE_FACTOR_SH;
   constant DESCRIPTOR_SIZE: natural := 512;
   constant ADDR_MEM_BW: natural := 32;
   constant N_POINTS: natural := 43;--total number of points in the retina pattern
   --specific data types
   --data types used in vertical convolution
   type T_INPUT_VERTICAL_CONVOLUTION is array (KERNEL_SIZE-1 downto 0) of std_logic_vector(PIXEL_BW-1 downto 0);
   type T_S1_VERT_CONV is array (KERNEL_SIZE_ROM-1 downto 0) of std_logic_vector(S1_VERT_CONV_BW-1 downto 0);
   type T_S2_VERT_CONV is array (KERNEL_SIZE_ROM-1 downto 0) of std_logic_vector(S2_VERT_CONV_BW-1 downto 0);
	
   --data types used in horizontal convolution
   type T_INPUT_HORIZONTAL_CONVOLUTION is array (KERNEL_SIZE-1 downto 0) of std_logic_vector(OUT_VERT_CONV_BW-1 downto 0);
   type T_S1_HORIZ_CONV is array (KERNEL_SIZE_ROM-1 downto 0) of std_logic_vector(S1_HORIZ_CONV_BW-1 downto 0);
   type T_S2_HORIZ_CONV is array (KERNEL_SIZE_ROM-1 downto 0) of std_logic_vector(S2_HORIZ_CONV_BW-1 downto 0);
   type kpt_coord_type is array (1 downto 0) of std_logic_vector(KPT_COORD_BW-1 downto 0);
   type pt_params_type is array (2 downto 0) of std_logic_vector(7-1 downto 0);
   type T_POINT_SET is array (N_POINTS-1 downto 0) of std_logic_vector(OUT_HORIZ_CONV_BW-1 downto 0);
   type T_POINT_INDEX is array (15 downto 0) of std_logic_vector (5 downto 0);
   type T_PAIR is array (1 downto 0) of integer range 0 to 42;
   type T_ROM_PAIRS is array (DESCRIPTOR_SIZE-1 downto 0) of T_PAIR;
end RetinaParameters;

package body RetinaParameters is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end RetinaParameters;
