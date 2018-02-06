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
ExecStep $xv_path/bin/xelab -wto af34082910a941c885e03f2910d4b61e -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot eightbitcounter_testbench_behav xil_defaultlib.eightbitcounter_testbench xil_defaultlib.glbl -log elaborate.log
