/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *STD_TEXTIO;
char *IEEE_P_1242562249;
char *UNISIM_P_0947159679;
char *WORK_P_0014510338;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    unisim_p_0947159679_init();
    work_p_0014510338_init();
    std_textio_init();
    xilinxcorelib_a_2614268679_3212880686_init();
    work_a_1155770727_0739218428_init();
    work_a_2242539549_3212880686_init();
    work_a_3904115852_3212880686_init();
    work_a_2537983650_3212880686_init();
    work_a_3468153315_3212880686_init();


    xsi_register_tops("work_a_3468153315_3212880686");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    WORK_P_0014510338 = xsi_get_engine_memory("work_p_0014510338");

    return xsi_run_simulation(argc, argv);

}
