setactivelib -work
#Compiling UUT module design files

comp -include "$dsn\src\TestBench\RE_Control_TB.v"
asim +access +r RE_Control_tb

wave
wave -noreg Clk
wave -noreg Exp_Decrease
wave -noreg Exp_Increase
wave -noreg Reset
wave -noreg Take_pic
wave -noreg ADC
wave -noreg Erase
wave -noreg Expose
wave -noreg NRE_1
wave -noreg NRE_2

run

#End simulation macro
