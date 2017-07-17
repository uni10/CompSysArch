set search_path [concat "/home/cad/lib/osu_stdcells/lib/tsmc018/lib/" $search_path]
set LIB_MAX_FILE {osu018_stdcells.db  }

set link_library $LIB_MAX_FILE
set target_library $LIB_MAX_FILE

read_verilog alu.v
read_verilog rfile.v
read_verilog mipse.v
current_design "mipse"
create_clock -period 10.0 clk 
set_input_delay 8.5 -clock clk [find port "readdata*"]
set_input_delay 2.5 -clock clk [find port "instr*"]
set_output_delay 9.5 -clock clk [find port "pc*"]
set_output_delay 3.5 -clock clk [find port "aluresult*"]
set_output_delay 3.5 -clock clk [find port "writedata*"]
set_output_delay 3.5 -clock clk [find port "memwrite"]

set_max_fanout 12 [current_design]

set_max_area 0

compile -map_effort high -area_effort medium

report_timing -max_paths 10

report_area

report_power

write -hier -format verilog -output mipse.vnet

quit
