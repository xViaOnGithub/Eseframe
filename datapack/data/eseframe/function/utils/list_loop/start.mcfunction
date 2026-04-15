say [Eseframe Internal] eseframe:utils/list_loop/start is DEPRECATED! Please use eseframe:util/list_loop/run instead!

function eseframe:utils/list_loop/initialize

# Set up function parameters that doesn't require math
$data modify storage eseframe:tmp list_loop.macro set value {function:"$(function_path)",list:'$(list_path)',index:0}

# Subtract 1 from the length of the list to get the max index
$execute store result score #max_index eseframe.util.list_loop if data $(list_path)[]
execute store result storage eseframe:tmp list_loop.macro.max_index int 1 run scoreboard players remove #max_index eseframe.util.list_loop 1


return run function eseframe:utils/list_loop/steps/01_repeating with storage eseframe:tmp list_loop.macro