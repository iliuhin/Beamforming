@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto b1315fd5c2664e3c9e741bd1bea90ed1 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot beamforming_control_tb_behav xil_defaultlib.beamforming_control_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
