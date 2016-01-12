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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/media/DATA42/Projects/EmbeddedRetina/EmbeddedRetina_ISE/IntermediateRegsConv.vhd";
extern char *IEEE_P_2592010699;
extern char *WORK_P_0014510338;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3904115852_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned int t8;
    char *t9;
    unsigned char t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    int t18;
    int t19;
    int t20;
    int t21;
    int t22;
    unsigned int t23;
    int t24;
    int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3872);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(40, ng0);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB10;

LAB11:
LAB6:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t17 = *((int *)t3);
    t1 = ((WORK_P_0014510338) + 2488U);
    t4 = *((char **)t1);
    t18 = *((int *)t4);
    t19 = (t18 - 1);
    t2 = (t17 == t19);
    if (t2 != 0)
        goto LAB17;

LAB19:
LAB18:    goto LAB3;

LAB5:    xsi_set_current_line(41, ng0);
    t3 = xsi_get_transient_memory(348U);
    memset(t3, 0, 348U);
    t7 = t3;
    t8 = (12U * 1U);
    t9 = t7;
    memset(t9, (unsigned char)2, t8);
    t10 = (t8 != 0);
    if (t10 == 1)
        goto LAB8;

LAB9:    t12 = (t0 + 3968);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t3, 348U);
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(42, ng0);
    t1 = (t0 + 4032);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((int *)t9) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(43, ng0);
    t1 = (t0 + 4096);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB6;

LAB8:    t11 = (348U / t8);
    xsi_mem_set_data(t7, t7, t8, t11);
    goto LAB9;

LAB10:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t1 = (t0 + 3968);
    t7 = (t1 + 56U);
    t9 = *((char **)t7);
    t12 = (t9 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 12U);
    xsi_driver_first_trans_delta(t1, 336U, 12U, 0LL);
    xsi_set_current_line(46, ng0);
    t1 = ((WORK_P_0014510338) + 2488U);
    t3 = *((char **)t1);
    t17 = *((int *)t3);
    t18 = (t17 - 2);
    t1 = (t0 + 7056);
    *((int *)t1) = 0;
    t4 = (t0 + 7060);
    *((int *)t4) = t18;
    t19 = 0;
    t20 = t18;

LAB12:    if (t19 <= t20)
        goto LAB13;

LAB15:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t17 = *((int *)t3);
    t18 = (t17 + 1);
    t1 = (t0 + 4032);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t12 = *((char **)t9);
    *((int *)t12) = t18;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB13:    xsi_set_current_line(47, ng0);
    t7 = (t0 + 1992U);
    t9 = *((char **)t7);
    t7 = (t0 + 7056);
    t21 = *((int *)t7);
    t22 = (t21 - 28);
    t8 = (t22 * -1);
    xsi_vhdl_check_range_of_index(28, 0, -1, *((int *)t7));
    t11 = (12U * t8);
    t23 = (0 + t11);
    t12 = (t9 + t23);
    t13 = (t0 + 7056);
    t24 = *((int *)t13);
    t25 = (t24 + 1);
    t26 = (t25 - 28);
    t27 = (t26 * -1);
    t28 = (12U * t27);
    t29 = (0U + t28);
    t14 = (t0 + 3968);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t30 = (t16 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t12, 12U);
    xsi_driver_first_trans_delta(t14, t29, 12U, 0LL);

LAB14:    t1 = (t0 + 7056);
    t19 = *((int *)t1);
    t3 = (t0 + 7060);
    t20 = *((int *)t3);
    if (t19 == t20)
        goto LAB15;

LAB16:    t17 = (t19 + 1);
    t19 = t17;
    t4 = (t0 + 7056);
    *((int *)t4) = t19;
    goto LAB12;

LAB17:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 4032);
    t7 = (t1 + 56U);
    t9 = *((char **)t7);
    t12 = (t9 + 56U);
    t13 = *((char **)t12);
    *((int *)t13) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 4096);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB18;

}

static void work_a_3904115852_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(57, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 4160);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 348U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3888);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3904115852_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3904115852_3212880686_p_0,(void *)work_a_3904115852_3212880686_p_1};
	xsi_register_didat("work_a_3904115852_3212880686", "isim/GaussianFilter_isim_beh.exe.sim/work/a_3904115852_3212880686.didat");
	xsi_register_executes(pe);
}
