@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 72aa8c25b9674f6c957334ff9c2f8e62 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_cpt_1_9_behav xil_defaultlib.tb_cpt_1_9 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
