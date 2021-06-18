add_input_file {"P:/Git/22/tb_lib/hdl/half_adder_test_block_testbench.vhd"} -format {VHDL} -work tb_lib
add_input_file {"P:/ComputerExercise1/ComputerExercise1/ComputerExercise1_lib/hdl/c1_t1_half_adder_struct.vhd"} -format {VHDL} -work ComputerExercise1_lib
add_input_file {"P:/Git/22/tb_lib/hdl/tb_half_adder_struct.vhd"} -format {VHDL} -work tb_lib
setup_design -design tb_half_adder
setup_design -architecture struct
