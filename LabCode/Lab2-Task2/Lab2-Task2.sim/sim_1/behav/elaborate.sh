#!/bin/sh -f
xv_path="/ad/eng/support/software/linux/all/x86_64/Xilinx/Vivado/2014.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto ae1783efee0642c5a9ddae08adb19d25 -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot Structural_testbench_behav xil_defaultlib.Structural_testbench xil_defaultlib.glbl -log elaborate.log
