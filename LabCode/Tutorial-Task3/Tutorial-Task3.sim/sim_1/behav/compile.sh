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
echo "xvlog -m64 -prj Structural_testbench_vlog.prj"
ExecStep $xv_path/bin/xvlog -m64 -prj Structural_testbench_vlog.prj 2>&1 | tee compile.log
