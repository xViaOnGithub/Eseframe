function esefy:util/list_loop/initialize

# Set up function parameters that doesn't require math
$data modify storage esefy:tmp list_loop.macro set value {function:"$(function_path)",list:'$(list_path)',index:0}

# Subtract 1 from the length of the list to get the max index

$say execute store result score #max_index esefy.util.list_loop if data $(list_path)[]
$execute store result score #max_index esefy.util.list_loop if data $(list_path)[]
execute store result storage esefy:tmp list_loop.macro.max_index int 1 run scoreboard players remove #max_index esefy.util.list_loop 1


return run function esefy:util/list_loop/steps/01_repeating with storage esefy:tmp list_loop.macro