#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/ad/eng/support/software/linux/all/x86_64/Xilinx/SDK/2014.4/bin:/ad/eng/support/software/linux/all/x86_64/Xilinx/Vivado/2014.4/ids_lite/ISE/bin/lin64:/ad/eng/support/software/linux/all/x86_64/Xilinx/Vivado/2014.4/bin
else
  PATH=/ad/eng/support/software/linux/all/x86_64/Xilinx/SDK/2014.4/bin:/ad/eng/support/software/linux/all/x86_64/Xilinx/Vivado/2014.4/ids_lite/ISE/bin/lin64:/ad/eng/support/software/linux/all/x86_64/Xilinx/Vivado/2014.4/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/ad/eng/support/software/linux/all/x86_64/Xilinx/Vivado/2014.4/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/ad/eng/support/software/linux/all/x86_64/Xilinx/Vivado/2014.4/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD=`dirname "$0"`
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log Single_Cycle_Datapath.vds -m64 -mode batch -messageDb vivado.pb -source Single_Cycle_Datapath.tcl
