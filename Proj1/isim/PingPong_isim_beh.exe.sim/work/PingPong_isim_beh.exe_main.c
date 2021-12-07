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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002170321263_3410735667_init();
    work_m_00000000002978890643_4048139333_init();
    work_m_00000000003797747299_3212034283_init();
    work_m_00000000000712379719_0578944255_init();
    work_m_00000000000125819272_4129199223_init();
    work_m_00000000000154959640_2065198360_init();
    work_m_00000000000781155755_0556733791_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000781155755_0556733791");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
