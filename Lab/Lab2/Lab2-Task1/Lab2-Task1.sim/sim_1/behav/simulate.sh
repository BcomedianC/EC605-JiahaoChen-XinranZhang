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
ExecStep $xv_path/bin/xsim Full_Adder_Test_behav -key {Behavioral:sim_1:Functional:Full_Adder_Test} -tclbatch Full_Adder_Test.tcl -log simulate.log
